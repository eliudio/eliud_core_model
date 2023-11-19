import 'package:collection/collection.dart'; // You have to add this manually, for some reason it cannot be added automatically
import 'package:eliud_core_model/apis/action_api/action_model.dart';
import 'package:eliud_core_model/model/app_bar_model.dart';
import 'package:eliud_core_model/model/app_model.dart';
import 'package:eliud_core_model/model/drawer_model.dart';
import 'package:eliud_core_model/model/home_menu_model.dart';
import 'package:eliud_core_model/model/member_model.dart';
import 'package:eliud_core_model/model/menu_item_model.dart';
import 'package:eliud_core_model/model/public_medium_model.dart';
import 'package:flutter/material.dart';

enum MenuType { leftDrawerMenu, rightDrawerMenu, appBarMenu, bottomNavBarMenu }

typedef HomeMenuProvider = HomeMenuModel Function();
typedef AppBarProvider = AppBarModel Function();
typedef DrawerProvider = DrawerModel Function();

typedef NewAppTask = Future<void> Function();

abstract class NewAppWizardParameters {}

abstract class NewAppWizardInfo {
  final String newAppWizardName; // e.g. policy
  final String displayName;

  String getPackageName();

  NewAppWizardInfo(this.newAppWizardName, this.displayName);

  Widget wizardParametersWidget(
      AppModel app, BuildContext context, NewAppWizardParameters parameters);

  /*
   * A new instance of this wizard is initialised, e.g. because we create a new app
   * create the new parameters, allowing to maintain, update, and use during build
   *
   */
  NewAppWizardParameters newAppWizardParameters();

  /*
   * create a menu item for a specific menu
   *
   */
  List<MenuItemModel>? getMenuItemsFor(String uniqueId, AppModel app,
      NewAppWizardParameters parameters, MenuType type);

  /*
   * Create the tasks for creating the app, i.e. the portion of the app for which this wizard is for
   * See comments NewAppWizardInfo::getPageID
   * actionProvider is the function that is passed in to allow to retrieve actions from other wizards.
   * See comments NewAppWizardInfo::getAction
   *
   */
  List<NewAppTask>? getCreateTasks(
    String uniqueId,
    AppModel app,
    NewAppWizardParameters parameters,
    MemberModel member,
    HomeMenuProvider homeMenuProvider,
    AppBarProvider appBarProvider,
    DrawerProvider leftDrawerProvider,
    DrawerProvider rightDrawerProvider,
  );

  /*
   * adjust the app
   *
   */
  AppModel updateApp(
      String uniqueId, NewAppWizardParameters parameters, AppModel adjustMe);

  /*
   * Get pageID for a page type.
   *
   * Some pages require to have the page ID which could be provided by another wizard.
   * For example the member MembershipDashboardWizard needs the profilePageId and feedPageId
   * from the FeedWizard. The mechanism to do this is by
   *
   * - the wizard providing the page ID implementing this method and return the page ID for that type.
   *   In the example given the FeedWizard would implement this method for the types profilePageId and feedPageId
   *   The string for these types is a convention.
   *
   * - the wizard requesting that needs to know a page ID for a given page type requests the NewAppWizardRegistry
   *   for the pageID, using it's getPageID method
   *
   * For the page type we use a hard coded string, rather than using a const, to avoid introducing dependencies
   *
   */
  String? getPageID(
      String uniqueId, NewAppWizardParameters parameters, String pageType);

  /*
   * getAction serves the same purpose as getPageID but then for an action.
   *
   */
  ActionModel? getAction(
    String uniqueId,
    NewAppWizardParameters parameters,
    AppModel app,
    String actionType,
  );

  /*
   * getPublicMediumModel serves the same purpose as getPageID but then for a public image.
   *
   * known mediumType:
   * 'logo': implement when you wizard provides the logo for the app
   */
  PublicMediumModel? getPublicMediumModel(
      String uniqueId, NewAppWizardParameters parameters, String mediumType);

  @override
  String toString() {
    return '$runtimeType{newAppWizardName: $newAppWizardName, displayName: $displayName}';
  }
}

abstract class NewAppWizardInfoDefaultImpl extends NewAppWizardInfo {
  NewAppWizardInfoDefaultImpl(super.newAppWizardName, super.displayName);

  @override
  ActionModel? getAction(String uniqueId, NewAppWizardParameters parameters,
          AppModel app, String actionType) =>
      null;

  @override
  List<NewAppTask>? getCreateTasks(
    String uniqueId,
    AppModel app,
    NewAppWizardParameters parameters,
    MemberModel member,
    HomeMenuProvider homeMenuProvider,
    AppBarProvider appBarProvider,
    DrawerProvider leftDrawerProvider,
    DrawerProvider rightDrawerProvider,
  ) =>
      null;

  @override
  List<MenuItemModel>? getMenuItemsFor(String uniqueId, AppModel app,
          NewAppWizardParameters parameters, MenuType type) =>
      null;

  @override
  String? getPageID(String uniqueId, NewAppWizardParameters parameters,
          String pageType) =>
      null;

  @override
  PublicMediumModel? getPublicMediumModel(String uniqueId,
          NewAppWizardParameters parameters, String mediumType) =>
      null;

  @override
  AppModel updateApp(String uniqueId, NewAppWizardParameters parameters,
          AppModel adjustMe) =>
      adjustMe;

  @override
  Widget wizardParametersWidget(
      AppModel app, BuildContext context, NewAppWizardParameters parameters) {
    throw UnimplementedError();
  }
}

/*
 * Global registry with new app wizards
 */
class NewAppWizardRegistry {
  static NewAppWizardRegistry? _instance;

  NewAppWizardRegistry._internal();

  static NewAppWizardRegistry registry() {
    _instance ??= NewAppWizardRegistry._internal();
    if (_instance == null) {
      throw Exception('Can create NewAppWizardRegistry registry');
    }

    return _instance!;
  }

  List<NewAppWizardInfo> registeredNewAppWizardInfos = [];

  void register(NewAppWizardInfo newAppWizardInfo) {
    var found = registeredNewAppWizardInfos.firstWhereOrNull(
        (NewAppWizardInfo? element) =>
            element != null &&
            element.newAppWizardName == newAppWizardInfo.newAppWizardName);
    if (found != null) {
      throw Exception(
          "Adding $newAppWizardInfo clashes with existing entry $found. Both have the same newAppWizardName. These must be unique");
    }
    registeredNewAppWizardInfos.add(newAppWizardInfo);
  }
}
