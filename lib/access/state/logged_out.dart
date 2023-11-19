import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eliud_core_model/model/access_model.dart';
import 'package:eliud_core_model/model/app_model.dart';
import 'package:eliud_core_model/model/member_model.dart';
import 'package:eliud_core_model/model/page_model.dart';
import 'package:eliud_core_model/tools/member_collection_info.dart';
import 'package:flutter/foundation.dart';

import '../access_bloc.dart';
import '../helper/access_helpers.dart';
import 'access_determined.dart';

class LoggedOut extends AccessDetermined {
  static Future<LoggedOut> getLoggedOut(
    AccessBloc accessBloc,
    List<AppModel> apps, {
    AppModel? playstoreApp,
  }) async {
    var determinedApps = await Future.wait(apps.map((app) async {
      var homePage = await getHomepage(app);
      return DeterminedApp(app, homePage);
    }).toList());

    var accesses =
        await AccessHelper.getAccesses(accessBloc, null, apps, false);
    var loggedOut =
        LoggedOut._(determinedApps, accesses, playstoreApp: playstoreApp);
    return loggedOut;
  }

  static Future<LoggedOut> getLoggedOut2(
    AccessBloc accessBloc,
    AppModel app, {
    AppModel? playstoreApp,
  }) async {
    var homePage = await getHomepage(app);
    var apps = [DeterminedApp(app, homePage)];
    var accesses =
        await AccessHelper.getAccesses(accessBloc, null, [app], false);
    var loggedOut = LoggedOut._(apps, accesses, playstoreApp: playstoreApp);
    return loggedOut;
  }

  LoggedOut._(super.apps, super.accesses,
      {super.playstoreApp,
      super.isProcessing,
      super.tempMessage,
      super.newForceRefresh});

  @override
  bool hasAccessToOtherApps() => false;

  @override
  bool isLoggedIn() => false;

  @override
  bool forceAcceptMembership(String appId) => false;

  @override
  bool memberIsOwner(String appId) => false;

  @override
  MemberModel? getMember() => null;

  @override
  PrivilegeLevel getPrivilegeLevel(String appId) => PrivilegeLevel.noPrivilege;

  @override
  bool isBlocked(String appId) => false;

  @override
  List<MemberCollectionInfo>? getMemberCollectionInfo() => null;

  @override
  List<Object?> get props => [accesses, apps, playstoreApp, isProcessing];

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LoggedOut &&
          runtimeType == other.runtimeType &&
          mapEquals(accesses, other.accesses) &&
          ListEquality().equals(apps, other.apps) &&
          playstoreApp == other.playstoreApp &&
          newVersion == other.newVersion &&
          tempMessage == other.tempMessage &&
          isProcessing == other.isProcessing;

  @override
  Future<LoggedOut> addApp(
      AccessBloc accessBloc, AppModel newCurrentApp) async {
    bool found = false;
    for (var determinedApp in apps) {
      if (determinedApp.app.documentID == newCurrentApp.documentID) {
        found = true;
        break;
      }
    }

    if (found) {
      return LoggedOut._(apps, accesses,
          playstoreApp: playstoreApp,
          isProcessing: isProcessing,
          newForceRefresh: forceRefresh);
    } else {
      return addApp2(accessBloc, accesses, apps, newCurrentApp);
    }
  }

  @override
  Future<LoggedOut> addApp2(
      AccessBloc accessBloc,
      Map<String, PagesAndDialogAccesss> accesses,
      List<DeterminedApp> apps,
      AppModel newCurrentApp) async {
    var homePage = await getHomepage(newCurrentApp);
    var newAccesses = await AccessHelper.extendAccesses(
        accessBloc, null, accesses, newCurrentApp, false);
    var newApps = apps.map((v) => v).toList();
    newApps.add(DeterminedApp(newCurrentApp, homePage));
    return Future.value(LoggedOut._(newApps, newAccesses,
        playstoreApp: playstoreApp, newForceRefresh: forceRefresh));
  }

  @override
  Future<LoggedOut> updateApp2(
      AccessBloc accessBloc, AppModel newCurrentApp) async {
    var homePage = await getHomepage(newCurrentApp);
    var newAccesses = await AccessHelper.extendAccesses(
        accessBloc, null, accesses, newCurrentApp, false);
    var newApps = apps.map((v) => v).toList();
    newApps.add(DeterminedApp(newCurrentApp, homePage));
    return Future.value(LoggedOut._(newApps, newAccesses,
        playstoreApp: playstoreApp, newForceRefresh: forceRefresh));
  }

  @override
  Future<LoggedOut> updateApps(
    AppModel newCurrentApp,
    List<DeterminedApp> newApps,
  ) {
    return Future.value(LoggedOut._(newApps, accesses,
        playstoreApp: playstoreApp, newForceRefresh: forceRefresh));
  }

/*
  @override
  Future<AccessDetermined> copyWithNewPage(PageModel page,
      {Map<String, dynamic>? parameters}) async {
    return LoggedOut._(
      currentApp,
      homePage,
      apps,
      accesses,
      OpenPageAction(page, parameters: parameters),
      playstoreApp: playstoreApp,
    );
  }

  @override
  Future<AccessDetermined> copyWithNewDialog(DialogModel dialog,
      {Map<String, dynamic>? parameters}) async {
    return LoggedOut._(
      currentApp,
      homePage,
      apps,
      accesses,
      OpenDialogAction(dialog, parameters: parameters),
      playstoreApp: playstoreApp,
    );
  }
*/

  static Future<PageModel?> getHomepage(AppModel app) =>
      AccessDetermined.getPage(app.documentID, app.homePages!.homePagePublic);

  @override
  AccessDetermined asNotProcessing() {
    return LoggedOut._(apps, accesses,
        playstoreApp: playstoreApp,
        isProcessing: false,
        newForceRefresh: forceRefresh);
  }

  @override
  AccessDetermined withTempMessage(String message) {
    return LoggedOut._(apps, accesses,
        playstoreApp: playstoreApp,
        isProcessing: isProcessing,
        tempMessage: message,
        newForceRefresh: forceRefresh);
  }

  @override
  AccessDetermined clearTempMessage() {
    return LoggedOut._(apps, accesses,
        playstoreApp: playstoreApp,
        isProcessing: isProcessing,
        tempMessage: null,
        newForceRefresh: forceRefresh);
  }

  @override
  AccessDetermined asProcessing() {
    return LoggedOut._(apps, accesses,
        playstoreApp: playstoreApp,
        isProcessing: true,
        newForceRefresh: forceRefresh);
  }

  @override
  AccessDetermined withNewAccesses(
      Map<String, PagesAndDialogAccesss> newAccesses) {
    return LoggedOut._(apps, newAccesses,
        playstoreApp: playstoreApp,
        isProcessing: isProcessing,
        newForceRefresh: forceRefresh);
  }

  @override
  Future<AccessDetermined> withOtherPrivilege(AccessBloc accessBloc,
      AppModel app, PrivilegeLevel privilege, bool blocked) async {
    accesses.removeWhere((key, value) => key == app.documentID);
    var newAccesses = await AccessHelper.extendAccesses2(
        accessBloc, null, accesses, app, false, privilege, blocked);
    return Future.value(LoggedOut._(apps, newAccesses,
        playstoreApp: playstoreApp, newForceRefresh: forceRefresh));
  }

  @override
  AccessDetermined newVersion() {
    var newVersion = LoggedOut._(apps, accesses,
        playstoreApp: playstoreApp,
        isProcessing: false,
        newForceRefresh: forceRefresh + 1);
    return newVersion;
  }

  @override
  Future<PageModel?> reterminedHomePageForAppId(AppModel app) async {
    return await getHomepage(app);
  }

  @override
  AccessDetermined updateMember(MemberModel member) => this;

  @override
  int get hashCode =>
      playstoreApp.hashCode ^
      apps.hashCode ^
      accesses.hashCode ^
      isProcessing.hashCode ^
      tempMessage.hashCode ^
      newVersion.hashCode;
}
