import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eliud_core_model/model/abstract_repository_singleton.dart';
import 'package:eliud_core_model/model/access_model.dart';
import 'package:eliud_core_model/model/app_model.dart';
import 'package:eliud_core_model/model/member_model.dart';
import 'package:eliud_core_model/model/member_subscription_model.dart';
import 'package:eliud_core_model/model/page_model.dart';
import 'package:eliud_core_model/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_core_model/tools/etc/random.dart';
import 'package:eliud_core_model/tools/member_collection_info.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

import '../../package/packages.dart';
import '../access_bloc.dart';
import '../access_event.dart';
import '../helper/access_helpers.dart';
import 'access_determined.dart';
import 'maintain_blocked.dart';

class LoggedIn extends AccessDetermined {
  final User usr;
  final MemberModel member;
  final PostLoginAction? postLoginAction;
  final List<String> subscribedToApps;
  final List<String> blockedMembers;

  LoggedIn._(
    this.usr,
    this.member,
    this.postLoginAction,
    List<DeterminedApp> apps,
    Map<String, PagesAndDialogAccesss> accesses,
    this.subscribedToApps,
    this.blockedMembers, {
    AppModel? playstoreApp,
    bool? isProcessing,
    String? tempMessage,
    int? newForceRefresh,
  }) : super(apps, accesses,
            playstoreApp: playstoreApp,
            isProcessing: isProcessing,
            tempMessage: tempMessage,
            newForceRefresh: newForceRefresh);

  static Future<LoggedIn> getLoggedIn(
    AccessBloc accessBloc,
    User usr,
    MemberModel member,
    List<AppModel> apps,
    PostLoginAction? postLoginAction,
    List<String> subscribedToApps, {
    AppModel? playstoreApp,
  }) async {
    var accesses =
        await AccessHelper.getAccesses(accessBloc, member, apps, false);

    var determinedApps = await Future.wait(apps.map((app) async {
      var privilegeLevel = _privilegeLevel(app.documentID, accesses);
      var appIsBlocked = _isBlocked(app.documentID, accesses);
      var homePage = await getHomepage(app, appIsBlocked, privilegeLevel);
      return DeterminedApp(app, homePage);
    }).toList());

    List<String> blockedMembers =
        await MaintainBlocked.getBlockedMembers(member.documentID);

/*
    if ((!(subscribedToApps.contains(currentApp.documentID))) && (currentApp.policies == null)) {
      // accept membership as not policies provided
      member = await acceptMembership(member, currentApp);
    }
*/

    return LoggedIn._(
      usr,
      member,
      postLoginAction,
      determinedApps,
      accesses,
      subscribedToApps,
      blockedMembers,
      playstoreApp: playstoreApp,
    );
  }

  static Future<LoggedIn> getLoggedIn2(
    AccessBloc accessBloc,
    User usr,
    MemberModel member,
    AppModel app,
    List<String> subscribedToApps, {
    AppModel? playstoreApp,
  }) async {
    var accesses =
        await AccessHelper.getAccesses2(accessBloc, member, [app], false);
    var privilegeLevel = _privilegeLevel(app.documentID, accesses);
    var appIsBlocked = _isBlocked(app.documentID, accesses);
    var homePage = await getHomepage(app, appIsBlocked, privilegeLevel);
    var apps = [DeterminedApp(app, homePage)];
    List<String> blockedMembers =
        await MaintainBlocked.getBlockedMembers(member.documentID);

    return LoggedIn._(
      usr,
      member,
      null,
      apps,
      accesses,
      subscribedToApps,
      blockedMembers,
      playstoreApp: playstoreApp,
    );
  }

  bool isSubscribedToCurrentApp(String currentAppId) {
    return subscribedToApps.contains(currentAppId);
  }

  @override
  bool hasAccessToOtherApps() {
    if (member.subscriptions != null) return false;
    return member.subscriptions!.length > 1;
  }

  @override
  bool isLoggedIn() => true;

  String? memberProfilePhoto() {
    return member.photoURL;
  }

  @override
  bool memberIsOwner(String appId) {
    var memberId = member.documentID;
    for (var app in apps) {
      if (app.app.documentID == appId) return app.app.ownerID == memberId;
    }
    return false;
  }

  @override
  Future<LoggedIn> addApp(AccessBloc accessBloc, AppModel newCurrentApp) async {
    for (var app in apps) {
      if (app.app.documentID == newCurrentApp.documentID) {
        return LoggedIn._(
          usr,
          member,
          postLoginAction,
          apps,
          accesses,
          subscribedToApps,
          blockedMembers,
          playstoreApp: playstoreApp,
          isProcessing: isProcessing,
          newForceRefresh: forceRefresh,
        );
      }
    }

    return addApp2(accessBloc, accesses, apps, newCurrentApp);
  }

  @override
  Future<LoggedIn> addApp2(
      AccessBloc accessBloc,
      Map<String, PagesAndDialogAccesss> accesses,
      List<DeterminedApp> apps,
      AppModel newCurrentApp) async {
    var newAccesses = await AccessHelper.extendAccesses(
        accessBloc, member, accesses, newCurrentApp, true);
    var newApps = apps.map((v) => v).toList();

    var privilegeLevel = _privilegeLevel(newCurrentApp.documentID, newAccesses);
    var appIsBlocked = _isBlocked(newCurrentApp.documentID, newAccesses);
    var homePage =
        await getHomepage(newCurrentApp, appIsBlocked, privilegeLevel);
    newApps.add(DeterminedApp(newCurrentApp, homePage));
    return Future.value(LoggedIn._(
      usr,
      member,
      postLoginAction,
      newApps,
      newAccesses,
      subscribedToApps,
      blockedMembers,
      playstoreApp: playstoreApp,
      newForceRefresh: forceRefresh,
    ));
  }

  @override
  Future<LoggedIn> updateApp2(
      AccessBloc accessBloc, AppModel newCurrentApp) async {
    var newAccesses = await AccessHelper.extendAccesses(
        accessBloc, member, accesses, newCurrentApp, true);

    var newApps = <DeterminedApp>[];
    for (var app in apps) {
      if (app.app.documentID == newCurrentApp.documentID) {
        var privilegeLevel =
            _privilegeLevel(newCurrentApp.documentID, newAccesses);
        var appIsBlocked = _isBlocked(newCurrentApp.documentID, newAccesses);
        var homePage =
            await getHomepage(newCurrentApp, appIsBlocked, privilegeLevel);
        newApps.add(DeterminedApp(newCurrentApp, homePage));
      } else {
        newApps.add(app);
      }
    }

    return Future.value(LoggedIn._(
      usr,
      member,
      postLoginAction,
      newApps,
      newAccesses,
      subscribedToApps,
      blockedMembers,
      playstoreApp: playstoreApp,
      newForceRefresh: forceRefresh,
    ));
  }

  @override
  Future<LoggedIn> updateApps(
    AppModel newCurrentApp,
    List<DeterminedApp> newApps,
  ) {
    return Future.value(LoggedIn._(
      usr,
      member,
      postLoginAction,
      newApps,
      accesses,
      subscribedToApps,
      blockedMembers,
      playstoreApp: playstoreApp,
      newForceRefresh: forceRefresh,
    ));
  }

  @override
  AccessDetermined asNotProcessing() {
    return LoggedIn._(
      usr,
      member,
      postLoginAction,
      apps,
      accesses,
      subscribedToApps,
      blockedMembers,
      playstoreApp: playstoreApp,
      isProcessing: false,
      newForceRefresh: forceRefresh,
    );
  }

  @override
  AccessDetermined withTempMessage(String message) {
    return LoggedIn._(
      usr,
      member,
      postLoginAction,
      apps,
      accesses,
      subscribedToApps,
      blockedMembers,
      playstoreApp: playstoreApp,
      isProcessing: isProcessing,
      tempMessage: message,
      newForceRefresh: forceRefresh,
    );
  }

  @override
  AccessDetermined clearTempMessage() {
    return LoggedIn._(
      usr,
      member,
      postLoginAction,
      apps,
      accesses,
      subscribedToApps,
      blockedMembers,
      playstoreApp: playstoreApp,
      isProcessing: isProcessing,
      tempMessage: null,
      newForceRefresh: forceRefresh,
    );
  }

  @override
  AccessDetermined asProcessing() {
    return LoggedIn._(
      usr,
      member,
      postLoginAction,
      apps,
      accesses,
      subscribedToApps,
      blockedMembers,
      playstoreApp: playstoreApp,
      isProcessing: true,
      newForceRefresh: forceRefresh,
    );
  }

  @override
  AccessDetermined withNewAccesses(
      Map<String, PagesAndDialogAccesss> newAccesses) {
    return LoggedIn._(
      usr,
      member,
      postLoginAction,
      apps,
      newAccesses,
      subscribedToApps,
      blockedMembers,
      playstoreApp: playstoreApp,
      isProcessing: isProcessing,
      newForceRefresh: forceRefresh,
    );
  }

/*
  @override
  Future<AccessDetermined> copyWithNewPage(PageModel page, {Map<String, dynamic>? parameters}) async {
    return LoggedIn._(
      usr,
      member,
      postLoginAction,
      currentApp,
      homePage,
      apps,
      accesses,
      OpenPageAction(page, parameters: parameters),
      playstoreApp: playstoreApp,
      newForceRefresh: forceRefresh,
    );
  }

  @override
  Future<AccessDetermined> copyWithNewDialog(DialogModel dialog, {Map<String, dynamic>? parameters}) async {
    return LoggedIn._(
      usr,
      member,
      postLoginAction,
      currentApp,
      homePage,
      apps,
      accesses,
      OpenDialogAction(dialog, parameters: parameters),
      playstoreApp: playstoreApp,
      newForceRefresh: forceRefresh,
    );
  }
*/

  @override
  MemberModel? getMember() => member;

  @override
  PrivilegeLevel getPrivilegeLevel(String appId) =>
      _privilegeLevel(appId, accesses);

  static PrivilegeLevel _privilegeLevel(
      String appId, Map<String, PagesAndDialogAccesss> accesses) {
    var appAccess = accesses[appId];
    if (appAccess == null) return PrivilegeLevel.noPrivilege;
    return appAccess.privilegeLevel ?? PrivilegeLevel.noPrivilege;
  }

  @override
  bool isBlocked(String appId) => _isBlocked(appId, accesses);

  static bool _isBlocked(
      String appId, Map<String, PagesAndDialogAccesss> accesses) {
    var appAccess = accesses[appId];
    if (appAccess == null) return false;
    return appAccess.blocked ?? false;
  }

  @override
  List<MemberCollectionInfo> getMemberCollectionInfo() {
    var memberCollectionInfo = <MemberCollectionInfo>[];
    for (var i = 0; i < Packages.registeredPackages.length; i++) {
      var packageCollectionInfo =
          Packages.registeredPackages[i].getMemberCollectionInfo();
      if (packageCollectionInfo != null) {
        memberCollectionInfo.addAll(packageCollectionInfo);
      }
    }
    return memberCollectionInfo;
  }

  @override
  // todo!
  bool forceAcceptMembership(String appId) => false;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LoggedIn &&
          usr == other.usr &&
          member == other.member &&
          postLoginAction == other.postLoginAction &&
          mapEquals(accesses, other.accesses) &&
          ListEquality().equals(apps, other.apps) &&
          ListEquality().equals(subscribedToApps, other.subscribedToApps) &&
          playstoreApp == other.playstoreApp &&
          newVersion == other.newVersion &&
          tempMessage == other.tempMessage &&
          isProcessing == other.isProcessing;

  @override
  List<Object?> get props => [
        usr,
        member,
        postLoginAction,
        accesses,
        playstoreApp,
      ];

  static Future<PageModel?> getHomepage(
      AppModel app, bool isBlocked, PrivilegeLevel privilegeLevel) {
    var appId = app.documentID;
    if (app.homePages == null) {
      return AccessDetermined.getPage(appId, null, alternativePageId: null);
    }
    if (isBlocked) {
      return AccessDetermined.getPage(
          appId, app.homePages!.homePageBlockedMember,
          alternativePageId: app.homePages!.homePagePublic);
    }
    if ((privilegeLevel.index >= PrivilegeLevel.ownerPrivilege.index)) {
      return AccessDetermined.getPage(appId, app.homePages!.homePageOwner,
          alternativePageId: app.homePages!.homePagePublic);
    }
    if ((privilegeLevel.index >= PrivilegeLevel.level2Privilege.index)) {
      return AccessDetermined.getPage(
          appId, app.homePages!.homePageLevel2Member,
          alternativePageId: app.homePages!.homePagePublic);
    }
    if ((privilegeLevel.index >= PrivilegeLevel.level1Privilege.index)) {
      return AccessDetermined.getPage(
          appId, app.homePages!.homePageLevel1Member,
          alternativePageId: app.homePages!.homePagePublic);
    }
    if ((privilegeLevel.index >= PrivilegeLevel.noPrivilege.index)) {
      return AccessDetermined.getPage(
          appId, app.homePages!.homePageSubscribedMember,
          alternativePageId: app.homePages!.homePagePublic);
    }
    return AccessDetermined.getPage(appId, app.homePages!.homePagePublic);
  }

  @override
  Future<AccessDetermined> withOtherPrivilege(AccessBloc accessBloc,
      AppModel app, PrivilegeLevel privilege, bool blocked) async {
    var newAccesses = await AccessHelper.extendAccesses2(
        accessBloc, member, accesses, app, true, privilege, blocked);
    var newApps = apps.map((v) => v).toList();
    newApps.removeWhere((element) => element.app.documentID == app.documentID);

    var homePage = await getHomepage(app, blocked, privilege);
    newApps.add(DeterminedApp(app, homePage));

    return Future.value(LoggedIn._(
      usr,
      member,
      postLoginAction,
      newApps,
      newAccesses,
      subscribedToApps,
      blockedMembers,
      playstoreApp: playstoreApp,
      newForceRefresh: forceRefresh,
    ));
  }

  LoggedIn withSubscriptions(List<String> newSubscribedToApps) {
    return LoggedIn._(
      usr,
      member,
      postLoginAction,
      apps,
      accesses,
      newSubscribedToApps,
      blockedMembers,
      playstoreApp: playstoreApp,
      newForceRefresh: forceRefresh,
    );
  }

  Future<void> refreshClaims() async {
    await usr.reload();
    await usr.getIdTokenResult(true);
  }

  static List<String> getSubscriptions(MemberModel member) {
    if (member.subscriptions == null) return [];

    return member.subscriptions!
        .map((memberSubscriptionModel) =>
            memberSubscriptionModel.app!.documentID)
        .toList();
  }

  static Future<MemberModel> acceptMembership(
      MemberModel member, AppModel app) async {
    if (isSubscibred(member, app)) return member;

    var subscriptions = member.subscriptions!;
    subscriptions
        .add(MemberSubscriptionModel(documentID: newRandomKey(), app: app));
    member = member.copyWith(subscriptions: subscriptions);
    var returnMe = await memberRepository()!.update(member);

    var accessModel =
        await accessRepository(appId: app.documentID)!.get(member.documentID);
    if (accessModel == null) {
      // create an access entry. creation with privilege level 0 is allowed
      await accessRepository(appId: app.documentID)!.add(AccessModel(
        documentID: member.documentID,
        appId: app.documentID,
        privilegeLevel: PrivilegeLevel.noPrivilege,
        points: 0,
      ));
    }

    return returnMe;
  }

  @override
  AccessDetermined updateMember(MemberModel member) {
    var newVersion = LoggedIn._(
      usr,
      member,
      postLoginAction,
      apps,
      accesses,
      getSubscriptions(member),
      blockedMembers,
      playstoreApp: playstoreApp,
      newForceRefresh: forceRefresh,
    );
    return newVersion;
  }

  static bool isSubscibred(MemberModel? member, AppModel app) {
    if (member == null) return false;
    if (member.subscriptions == null) return false;
    // if (member.subscriptions.length == 0) return false;

    var matches = member.subscriptions!.where((subscription) =>
        subscription.app != null
            ? subscription.app!.documentID == app.documentID
            : false);
    return matches.isNotEmpty;
  }

  @override
  AccessDetermined newVersion() {
    var newVersion = LoggedIn._(usr, member, postLoginAction, apps, accesses,
        subscribedToApps, blockedMembers,
        playstoreApp: playstoreApp, newForceRefresh: forceRefresh + 1);
    return newVersion;
  }

  @override
  Future<PageModel?> reterminedHomePageForAppId(AppModel app) async {
    var privilegeLevel = _privilegeLevel(app.documentID, accesses);
    var appIsBlocked = _isBlocked(app.documentID, accesses);
    var homePage = await getHomepage(app, appIsBlocked, privilegeLevel);
    return homePage;
  }

  List<String> registerBlockedMember(String otherMember) {
    if (!isBlockedMember(otherMember)) {
      var myMemberId = member.documentID;
      MaintainBlocked.registerMemberAsBlocked(myMemberId,
          otherMember); // not waiting, we keep in memory blocked members
      blockedMembers.add(otherMember);
    }
    return blockedMembers;
  }

  List<String> unRegisterBlockedMember(String otherMember) {
    if (isBlockedMember(otherMember)) {
      var myMemberId = member.documentID;
      MaintainBlocked.unRegisterMemberAsBlocked(myMemberId,
          otherMember); // not waiting, we keep in memory blocked members
      blockedMembers.remove(otherMember);
    }
    return blockedMembers;
  }

  bool isBlockedMember(String otherMember) {
    return (blockedMembers.contains(otherMember));
  }

  List<String> getBlocked() {
    return blockedMembers;
  }

  @override
  int get hashCode =>
      playstoreApp.hashCode ^
      apps.hashCode ^
      accesses.hashCode ^
      isProcessing.hashCode ^
      tempMessage.hashCode ^
      usr.hashCode ^
      member.hashCode ^
      postLoginAction.hashCode ^
      subscribedToApps.hashCode ^
      blockedMembers.hashCode ^
      newVersion.hashCode;
}
