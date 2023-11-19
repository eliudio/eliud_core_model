import 'dart:async';

import 'package:eliud_core_model/access/state/access_determined.dart';
import 'package:eliud_core_model/access/state/access_state.dart';
import 'package:eliud_core_model/access/state/logged_out.dart';
import 'package:eliud_core_model/access/state/undertermined_access_state.dart';
import 'package:eliud_core_model/apis/routerapi/arguments.dart';
import 'package:eliud_core_model/apis/routerapi/router_api.dart';
import 'package:eliud_core_model/model/abstract_repository_singleton.dart';
import 'package:eliud_core_model/model/access_model.dart';
import 'package:eliud_core_model/model/app_model.dart';
import 'package:eliud_core_model/model/member_claim_model.dart';
import 'package:eliud_core_model/model/member_model.dart';
import 'package:eliud_core_model/style/style_registry.dart';
import 'package:eliud_core_model/tools/main_abstract_repository_singleton.dart'
    as repos;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'access_event.dart';
import 'state/logged_in.dart';

class AccessBloc extends Bloc<AccessEvent, AccessState> {
  final Map<String, StreamSubscription<AppModel?>> _appSubscription = {};
  final Map<String, StreamSubscription<AccessModel?>> _accessSubscription = {};
  StreamSubscription<MemberModel?>? _memberSubscription;
  final GlobalKey<NavigatorState> navigatorKey;
  StreamSubscription? _memberClaimsSubscription;

  AccessBloc(this.navigatorKey) : super(UndeterminedAccessState()) {
    on<AccessInitEvent>((event, emit) async {
      var usr = repos.AbstractMainRepositorySingleton.singleton
          .userRepository()!
          .currentSignedinUser();

      if (usr == null) {
        await StyleRegistry.registry()
            .addApp(null, event.app, () => _currentStyleChanged(event.app));
        _listenToApp(event.app.documentID, null);
        emit(await LoggedOut.getLoggedOut2(this, event.app,
            playstoreApp: event.playstoreApp));
      } else {
        var member = await firebaseToMemberModel(usr);
        _listenToMember(member);
        await StyleRegistry.registry()
            .addApp(member, event.app, () => _currentStyleChanged(event.app));

        _listenToApp(event.app.documentID, member);
        var newState = await LoggedIn.getLoggedIn2(
            this, usr, member, event.app, LoggedIn.getSubscriptions(member),
            playstoreApp: event.playstoreApp);

        // auto subscribe when no policies in place
        newState = await acceptPoliciesIfNone(newState, event.app, member);

        _listenToMemberClaims(member.documentID, newState);
        emit(newState);
      }
    });
    on<GoHome>((event, emit) async {
      var theState = state as AccessDetermined;
      if (event.isProcessing()) {
        var appId = event.app.documentID;
        var app = theState.getApp(appId);
        var homePage = (event.redetermine && (app != null))
            ? await theState.reterminedHomePageForAppId(app)
            : theState.homePageForAppId(appId);
        gotoPage(true, event.app.documentID, homePage?.documentID,
            errorString:
                'Homepage not set correct for app ${event.app.documentID}');
        emit(theState.asNotProcessing());
      } else {
        add(event.asProcessing());
        emit(theState.asProcessing());
      }
    });
    on<LogoutEvent>((event, emit) async {
      var theState = state as AccessDetermined;
      _stopListenToMember();
      _stopListenToMemberClaims();
      if (event.isProcessing()) {
        await repos.AbstractMainRepositorySingleton.singleton
            .userRepository()!
            .signOut();
        var toEmit = await LoggedOut.getLoggedOut(this,
            theState.apps.map((determinedApp) => determinedApp.app).toList(),
            playstoreApp: theState.playstoreApp);
        var homePage = toEmit.homePageForAppId(event.app.documentID);
        gotoPage(true, event.app.documentID, homePage?.documentID,
            errorString:
                'Homepage not set correct for app ${event.app.documentID}');
        emit(toEmit);
      } else {
        add(event.asProcessing());
        emit(theState.asProcessing());
      }
    });

    on<DismissTempMessage>((event, emit) async {
      var theState = state as AccessDetermined;
      emit(theState.clearTempMessage());
    });

    on<ShowTempMessage>((event, emit) async {
      var theState = state as AccessDetermined;
      emit(theState.withTempMessage(event.tempMessage));
    });

    on<LoginEvent>((event, emit) async {
      var theState = state as AccessDetermined;
      if (event.isProcessing()) {
        User? usr;
        try {
          switch (event.loginType) {
            case LoginType.googleLogin:
              usr = await repos.AbstractMainRepositorySingleton.singleton
                  .userRepository()!
                  .signInWithGoogle();
              break;
            case LoginType.appleLogin:
              usr = await repos.AbstractMainRepositorySingleton.singleton
                  .userRepository()!
                  .signInWithApple();
              break;
          }
        } catch (exception) {
          print('Exception during signIn: $exception');
          emit(theState
              .asNotProcessing()
              .withTempMessage('Error during signin'));
        }
        if (usr != null) {
          var member = await firebaseToMemberModel(usr);

          var toEmit = await LoggedIn.getLoggedIn(
              this,
              usr,
              member,
              theState.apps.map((determinedApp) => determinedApp.app).toList(),
              null,
              LoggedIn.getSubscriptions(member),
              playstoreApp: theState.playstoreApp);

          // auto subscribe when no policies in place
          toEmit = await acceptPoliciesIfNone(toEmit, event.app, member);

          _resetAccessListeners(
              theState.apps.map((e) => e.app.documentID).toList(),
              member.documentID);

          _listenToMember(member);
          _listenToMemberClaims(member.documentID, toEmit);
          emit(toEmit);
          if (event.actions != null) {
            event.actions!.runTheAction();
          } else {
            var homePage = toEmit.homePageForAppId(event.app.documentID);
            gotoPage(true, event.app.documentID, homePage?.documentID,
                errorString:
                    'Homepage not set correct for app ${event.app.documentID}');
          }
        }
      } else {
        add(event.asProcessing());
        emit(theState.asProcessing());
      }
    });

    on<SwitchAppWithIDEvent>((event, emit) async {
      var theState = state as AccessDetermined;
      if (event.isProcessing()) {
        var app = await _fetchApp(event.appId);
        await StyleRegistry.registry()
            .addApp(state.getMember(), app, () => _currentStyleChanged(app));
        var newState = await theState.asNotProcessing().addApp(this, app);
        var homePage = newState.homePageForAppId(event.appId);
        gotoPage(false, event.appId, homePage?.documentID,
            errorString: 'Homepage not set correct for app ${event.appId}');

        _listenToApp(event.appId, theState.getMember());
        emit(newState);
      } else {
        add(event.asProcessing());
        emit(theState.asProcessing());
      }
    });

    on<MemberUpdatedEvent>((event, emit) async {
      if (state is AccessDetermined) {
        var theState = state as AccessDetermined;
        var newState = theState.updateMember(event.member);
        emit(newState);
      }
    });

    on<AppUpdatedEvent>((event, emit) async {
      if (state is AccessDetermined) {
        var theState = state as AccessDetermined;
        var newState = await theState.updateApp2(this, event.app);
        await StyleRegistry.registry().addApp(state.getMember(), event.app,
            () => _currentStyleChanged(event.app));
        emit(newState);
      }
    });

    on<RefreshAppEvent>((event, emit) async {
      if (state is AccessDetermined) {
        var theState = state as AccessDetermined;
        var newState = theState.newVersion();
        emit(newState);
      }
    });

    on<GotoPageEvent>((event, emit) async {
      // NAVIGATION-USING-BLOC: Navigation within the context of using bloc should use BlocListener. However, there are issues with that, see : https://github.com/felangel/bloc/issues/2938
      // When this would get resolved, then we can use theState.switchPage(page, parameters: event.parameters)
      // and remove the navigation from here:
      gotoPage(false, event.app.documentID, event.pageId,
          parameters: event.parameters, errorString: 'Page not does not exist');
    });

    on<OpenDialogEvent>((event, emit) async {
      // See comment @ GotoPageEvent
      // We should use theState.openDialog(`dialog, parameters: event.parameters);
    });

    on<UpdatePackageConditionEvent>((event, emit) async {
      if (state is AccessDetermined) {
        var theState = state as AccessDetermined;
        var newState = theState.withDifferentPackageCondition(
            event.app.documentID,
            event.package,
            event.packageCondition,
            event.condition);
        emit(newState);
      }
    });

    on<PrivilegeChangedEvent>((event, emit) async {
      if (state is AccessDetermined) {
        var theState = state as AccessDetermined;
        emit(await theState.withOtherPrivilege(
            this, event.app, event.privilege, event.blocked));
      }
    });

    on<AcceptedMembershipEvent>((event, emit) async {
      if (state is AccessDetermined) {
        var theState = state as AccessDetermined;
        if (theState is LoggedIn) {
          var theMember = theState.getMember();
          if (theMember != null) {
            await LoggedIn.acceptMembership(theMember, event.app);
            var newState = theState
                .withSubscriptions(LoggedIn.getSubscriptions(theMember));
            if (newState.postLoginAction != null) {
              newState.postLoginAction!.runTheAction();
            }
            emit(newState);
          }
        }
      }
    });

    on<AccessUpdatedEvent>((event, emit) async {
      if (state is AccessDetermined) {
        var theState = state as AccessDetermined;
        emit(await theState.withNewAccess(this, event.access));
      }
    });
  }

  void _currentStyleChanged(AppModel app) {
    add(RefreshAppEvent(app));
  }

  Future<LoggedIn> acceptPoliciesIfNone(
      LoggedIn toEmit, AppModel app, MemberModel member) async {
    var theAppPolicies = await appPolicyRepository(appId: app.documentID)!
        .valuesListWithDetails();
    if (theAppPolicies.isEmpty) {
      await LoggedIn.acceptMembership(member, app);
      toEmit = toEmit.withSubscriptions(LoggedIn.getSubscriptions(member));
    }
    return toEmit;
  }

  void gotoPage(bool clearHistory, String? appId, String? pageId,
      {Map<String, dynamic>? parameters, String? errorString}) {
    if (appId == null) {
      throw Exception('Error: gotoPage(null)');
    }
    if (pageId != null) {
      if (navigatorKey.currentState != null) {
        if (clearHistory) {
          navigatorKey.currentState!.pushNamedAndRemoveUntil(
              RouterApi.pageRoute, (_) => false,
              arguments: Arguments('$appId/$pageId', parameters));
        } else {
          navigatorKey.currentState!.pushNamed(RouterApi.pageRoute,
              arguments: Arguments('$appId/$pageId', parameters));
        }
      } else {
        throw Exception(
            "Can't pushNamed page $appId/$pageId because navigatorKey.currentState is null");
      }
    } else {
      if (clearHistory) {
        navigatorKey.currentState!.pushNamedAndRemoveUntil(
            RouterApi.messageRoute, (_) => false,
            arguments: Arguments(appId, {'message': errorString}));
      } else {
        navigatorKey.currentState!.pushNamed(RouterApi.messageRoute,
            arguments: Arguments(appId, {'message': errorString}));
      }
    }
  }

  void _listenToApp(String appId, MemberModel? member) async {
    await _appSubscription[appId]?.cancel();
    _appSubscription[appId] =
        repos.appRepository(appId: appId)!.listenTo(appId, (value) {
      if (value != null) add(AppUpdatedEvent(value));
    });

    if (member != null) {
//    _accessSubscription[appId]?.cancel();
      _accessSubscription[appId] =
          accessRepository(appId: appId)!.listenTo(member.documentID, (value) {
        if (value != null) add(AccessUpdatedEvent(value));
      });
    }
  }

  // we listen to memberClaim updates... The function that manages the claims will update this document when
  // we need to refresh
  void _listenToMemberClaims(String memberId, LoggedIn loggedIn) {
    _stopListenToMemberClaims();
    _memberClaimsSubscription =
        memberClaimRepository()!.listenTo(memberId, (value) async {
      loggedIn.refreshClaims();
    });
  }

  void _stopListenToMemberClaims() {
    _memberClaimsSubscription?.cancel();
  }

  void _listenToMember(MemberModel member) async {
    await _memberSubscription?.cancel();
    _memberSubscription =
        repos.memberRepository()!.listenTo(member.documentID, (value) {
      if (value != null) add(MemberUpdatedEvent(value));
    });
  }

  void _stopListenToMember() async {
    await _memberSubscription?.cancel();
  }

  void _resetAccessListeners(List<String> apps, String memberId) async {
    for (var theAs in _accessSubscription.values) {
      await theAs.cancel();
    }
    for (var appId in apps) {
      _accessSubscription[appId] =
          accessRepository(appId: appId)!.listenTo(memberId, (value) {
        if (value != null) add(AccessUpdatedEvent(value));
      });
    }
  }

  static Future<MemberClaimModel> getMemberClaimModel(
      MemberModel member) async {
    var futureMemberClaimModel = await memberClaimRepository()!
        .get(member.documentID)
        .then((memberClaim) async {
      if (memberClaim == null) {
        memberClaim = MemberClaimModel(
          documentID: member.documentID,
          refreshValue: 1,
        );
        return await memberClaimRepository()!.add(memberClaim);
      } else {
        return memberClaim;
      }
    }).catchError((onError) {
      var errorMsg = 'Exception in getMemberClaimModel $onError';
      print(errorMsg);
      throw Exception(errorMsg);
    });
    return futureMemberClaimModel;
  }

  static Future<MemberModel> firebaseToMemberModel(User usr) async {
    var futureMemberModel =
        await repos.memberRepository()!.get(usr.uid).then((member) async {
      if (member == null) {
        member = MemberModel(
          documentID: usr.uid,
          name: usr.displayName,
          email: usr.email,
          isAnonymous: usr.isAnonymous,
          photoURL: usr.photoURL,
          subscriptions: [],
          /*items:[]*/
        );
        await getMemberClaimModel(member);
        return await repos.memberRepository()!.add(member);
      } else {
        await getMemberClaimModel(member);
        return member;
      }
    }).catchError((onError) {
      var errorMsg = 'Exception in firebaseToMemberModel $onError';
      print(errorMsg);
      throw Exception(errorMsg);
    });
    return futureMemberModel;
  }

  /* Helper functions to get details from the AppState */
  static AccessBloc getBloc(BuildContext context) {
    return BlocProvider.of<AccessBloc>(context);
  }

  static MemberModel? member(BuildContext context) {
    var state = BlocProvider.of<AccessBloc>(context).state;
    if (state is AccessDetermined) {
      return state.getMember();
    } else {
      return null;
    }
  }

  static String? memberId(BuildContext context) {
    var theMember = member(context);
    return (theMember != null) ? theMember.documentID : null;
  }

  static bool isOwner(BuildContext context, AppModel app) {
    var theState = AccessBloc.getState(context);
    if (theState is AccessDetermined) {
      return theState.memberIsOwner(app.documentID);
    }
    return false;
  }

/*
  static AppModel currentApp(BuildContext context) {
    var theState = AccessBloc.getState(context);
    if (theState is AccessDetermined) {
      return theState.currentApp;
    } else {
      throw Exception('No current app');
    }
  }

  static String currentAppId(BuildContext context) {
    var theState = AccessBloc.getState(context);
    if (theState is AccessDetermined) {
      return theState.currentApp.documentID;
    } else {
      throw Exception('No current app');
    }
  }

  static String currentOwnerId(BuildContext context) {
    var theState = AccessBloc.getState(context);
    if (theState is AccessDetermined) {
      return theState.currentApp.ownerID!;
    } else {
      throw Exception('No current app');
    }
  }
*/

  static AccessState getState(BuildContext context) {
    var accessBloc = BlocProvider.of<AccessBloc>(context);
    var state = accessBloc.state;
    return state;
  }

  Future<AppModel> _fetchApp(String id) async {
    var appModel = await repos.AbstractMainRepositorySingleton.singleton
        .appRepository()!
        .get(id);
    if (appModel == null) {
      throw Exception("Unable to find app with id '$id");
    } else {
      return appModel;
    }
  }
}
