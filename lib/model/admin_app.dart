/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 model/admin_app.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core_model/tools/admin_app_base.dart';
import '../tools/bespoke_models.dart';

import 'package:eliud_core_model/model/abstract_repository_singleton.dart';
import 'package:eliud_core_model/model/model_export.dart';

class AdminApp extends AdminAppInstallerBase {
  final String appId;
  final DrawerModel _drawer;
  final DrawerModel _endDrawer;
  final AppBarModel _appBar;
  final HomeMenuModel _homeMenu;
  final RgbModel menuItemColor;
  final RgbModel selectedMenuItemColor;
  final RgbModel backgroundColor;

  /// Construct the AdminApp
  AdminApp(
      this.appId,
      this._drawer,
      this._endDrawer,
      this._appBar,
      this._homeMenu,
      this.menuItemColor,
      this.selectedMenuItemColor,
      this.backgroundColor);

  /// Retrieve the admin pages
  PageModel _appsPages() {
    List<BodyComponentModel> components = [];
    components.add(BodyComponentModel(
        documentID: "internalWidget-apps",
        componentName: "eliud_core_model_internalWidgets",
        componentId: "apps"));
    PageModel page = PageModel(
        conditions: StorageConditionsModel(
          privilegeLevelRequired:
              PrivilegeLevelRequiredSimple.ownerPrivilegeRequiredSimple,
        ),
        appId: appId,
        documentID: "eliud_core_model_apps_page",
        title: "Apps",
        description: "Apps",
        drawer: _drawer,
        endDrawer: _endDrawer,
        appBar: _appBar,
        homeMenu: _homeMenu,
        bodyComponents: components,
        layout: PageLayout.onlyTheFirstComponent);
    return page;
  }

  /// Retrieve the admin pages
  PageModel _appBarsPages() {
    List<BodyComponentModel> components = [];
    components.add(BodyComponentModel(
        documentID: "internalWidget-appBars",
        componentName: "eliud_core_model_internalWidgets",
        componentId: "appBars"));
    PageModel page = PageModel(
        conditions: StorageConditionsModel(
          privilegeLevelRequired:
              PrivilegeLevelRequiredSimple.ownerPrivilegeRequiredSimple,
        ),
        appId: appId,
        documentID: "eliud_core_model_appbars_page",
        title: "AppBars",
        description: "AppBars",
        drawer: _drawer,
        endDrawer: _endDrawer,
        appBar: _appBar,
        homeMenu: _homeMenu,
        bodyComponents: components,
        layout: PageLayout.onlyTheFirstComponent);
    return page;
  }

  /// Retrieve the admin pages
  PageModel _appPolicysPages() {
    List<BodyComponentModel> components = [];
    components.add(BodyComponentModel(
        documentID: "internalWidget-appPolicys",
        componentName: "eliud_core_model_internalWidgets",
        componentId: "appPolicys"));
    PageModel page = PageModel(
        conditions: StorageConditionsModel(
          privilegeLevelRequired:
              PrivilegeLevelRequiredSimple.ownerPrivilegeRequiredSimple,
        ),
        appId: appId,
        documentID: "eliud_core_model_apppolicys_page",
        title: "AppPolicys",
        description: "AppPolicys",
        drawer: _drawer,
        endDrawer: _endDrawer,
        appBar: _appBar,
        homeMenu: _homeMenu,
        bodyComponents: components,
        layout: PageLayout.onlyTheFirstComponent);
    return page;
  }

  /// Retrieve the admin pages
  PageModel _backendRequestsPages() {
    List<BodyComponentModel> components = [];
    components.add(BodyComponentModel(
        documentID: "internalWidget-backendRequests",
        componentName: "eliud_core_model_internalWidgets",
        componentId: "backendRequests"));
    PageModel page = PageModel(
        conditions: StorageConditionsModel(
          privilegeLevelRequired:
              PrivilegeLevelRequiredSimple.ownerPrivilegeRequiredSimple,
        ),
        appId: appId,
        documentID: "eliud_core_model_backendrequests_page",
        title: "BackendRequests",
        description: "BackendRequests",
        drawer: _drawer,
        endDrawer: _endDrawer,
        appBar: _appBar,
        homeMenu: _homeMenu,
        bodyComponents: components,
        layout: PageLayout.onlyTheFirstComponent);
    return page;
  }

  /// Retrieve the admin pages
  PageModel _blockingsPages() {
    List<BodyComponentModel> components = [];
    components.add(BodyComponentModel(
        documentID: "internalWidget-blockings",
        componentName: "eliud_core_model_internalWidgets",
        componentId: "blockings"));
    PageModel page = PageModel(
        conditions: StorageConditionsModel(
          privilegeLevelRequired:
              PrivilegeLevelRequiredSimple.ownerPrivilegeRequiredSimple,
        ),
        appId: appId,
        documentID: "eliud_core_model_blockings_page",
        title: "Blockings",
        description: "Blockings",
        drawer: _drawer,
        endDrawer: _endDrawer,
        appBar: _appBar,
        homeMenu: _homeMenu,
        bodyComponents: components,
        layout: PageLayout.onlyTheFirstComponent);
    return page;
  }

  /// Retrieve the admin pages
  PageModel _blockingDashboardsPages() {
    List<BodyComponentModel> components = [];
    components.add(BodyComponentModel(
        documentID: "internalWidget-blockingDashboards",
        componentName: "eliud_core_model_internalWidgets",
        componentId: "blockingDashboards"));
    PageModel page = PageModel(
        conditions: StorageConditionsModel(
          privilegeLevelRequired:
              PrivilegeLevelRequiredSimple.ownerPrivilegeRequiredSimple,
        ),
        appId: appId,
        documentID: "eliud_core_model_blockingdashboards_page",
        title: "BlockingDashboards",
        description: "BlockingDashboards",
        drawer: _drawer,
        endDrawer: _endDrawer,
        appBar: _appBar,
        homeMenu: _homeMenu,
        bodyComponents: components,
        layout: PageLayout.onlyTheFirstComponent);
    return page;
  }

  /// Retrieve the admin pages
  PageModel _dialogsPages() {
    List<BodyComponentModel> components = [];
    components.add(BodyComponentModel(
        documentID: "internalWidget-dialogs",
        componentName: "eliud_core_model_internalWidgets",
        componentId: "dialogs"));
    PageModel page = PageModel(
        conditions: StorageConditionsModel(
          privilegeLevelRequired:
              PrivilegeLevelRequiredSimple.ownerPrivilegeRequiredSimple,
        ),
        appId: appId,
        documentID: "eliud_core_model_dialogs_page",
        title: "Dialogs",
        description: "Dialogs",
        drawer: _drawer,
        endDrawer: _endDrawer,
        appBar: _appBar,
        homeMenu: _homeMenu,
        bodyComponents: components,
        layout: PageLayout.onlyTheFirstComponent);
    return page;
  }

  /// Retrieve the admin pages
  PageModel _drawersPages() {
    List<BodyComponentModel> components = [];
    components.add(BodyComponentModel(
        documentID: "internalWidget-drawers",
        componentName: "eliud_core_model_internalWidgets",
        componentId: "drawers"));
    PageModel page = PageModel(
        conditions: StorageConditionsModel(
          privilegeLevelRequired:
              PrivilegeLevelRequiredSimple.ownerPrivilegeRequiredSimple,
        ),
        appId: appId,
        documentID: "eliud_core_model_drawers_page",
        title: "Drawers",
        description: "Drawers",
        drawer: _drawer,
        endDrawer: _endDrawer,
        appBar: _appBar,
        homeMenu: _homeMenu,
        bodyComponents: components,
        layout: PageLayout.onlyTheFirstComponent);
    return page;
  }

  /// Retrieve the admin pages
  PageModel _gridViewsPages() {
    List<BodyComponentModel> components = [];
    components.add(BodyComponentModel(
        documentID: "internalWidget-gridViews",
        componentName: "eliud_core_model_internalWidgets",
        componentId: "gridViews"));
    PageModel page = PageModel(
        conditions: StorageConditionsModel(
          privilegeLevelRequired:
              PrivilegeLevelRequiredSimple.ownerPrivilegeRequiredSimple,
        ),
        appId: appId,
        documentID: "eliud_core_model_gridviews_page",
        title: "GridViews",
        description: "GridViews",
        drawer: _drawer,
        endDrawer: _endDrawer,
        appBar: _appBar,
        homeMenu: _homeMenu,
        bodyComponents: components,
        layout: PageLayout.onlyTheFirstComponent);
    return page;
  }

  /// Retrieve the admin pages
  PageModel _homeMenusPages() {
    List<BodyComponentModel> components = [];
    components.add(BodyComponentModel(
        documentID: "internalWidget-homeMenus",
        componentName: "eliud_core_model_internalWidgets",
        componentId: "homeMenus"));
    PageModel page = PageModel(
        conditions: StorageConditionsModel(
          privilegeLevelRequired:
              PrivilegeLevelRequiredSimple.ownerPrivilegeRequiredSimple,
        ),
        appId: appId,
        documentID: "eliud_core_model_homemenus_page",
        title: "HomeMenus",
        description: "HomeMenus",
        drawer: _drawer,
        endDrawer: _endDrawer,
        appBar: _appBar,
        homeMenu: _homeMenu,
        bodyComponents: components,
        layout: PageLayout.onlyTheFirstComponent);
    return page;
  }

  /// Retrieve the admin pages
  PageModel _membersPages() {
    List<BodyComponentModel> components = [];
    components.add(BodyComponentModel(
        documentID: "internalWidget-members",
        componentName: "eliud_core_model_internalWidgets",
        componentId: "members"));
    PageModel page = PageModel(
        conditions: StorageConditionsModel(
          privilegeLevelRequired:
              PrivilegeLevelRequiredSimple.ownerPrivilegeRequiredSimple,
        ),
        appId: appId,
        documentID: "eliud_core_model_members_page",
        title: "Members",
        description: "Members",
        drawer: _drawer,
        endDrawer: _endDrawer,
        appBar: _appBar,
        homeMenu: _homeMenu,
        bodyComponents: components,
        layout: PageLayout.onlyTheFirstComponent);
    return page;
  }

  /// Retrieve the admin pages
  PageModel _memberDashboardsPages() {
    List<BodyComponentModel> components = [];
    components.add(BodyComponentModel(
        documentID: "internalWidget-memberDashboards",
        componentName: "eliud_core_model_internalWidgets",
        componentId: "memberDashboards"));
    PageModel page = PageModel(
        conditions: StorageConditionsModel(
          privilegeLevelRequired:
              PrivilegeLevelRequiredSimple.ownerPrivilegeRequiredSimple,
        ),
        appId: appId,
        documentID: "eliud_core_model_memberdashboards_page",
        title: "MemberDashboards",
        description: "MemberDashboards",
        drawer: _drawer,
        endDrawer: _endDrawer,
        appBar: _appBar,
        homeMenu: _homeMenu,
        bodyComponents: components,
        layout: PageLayout.onlyTheFirstComponent);
    return page;
  }

  /// Retrieve the admin pages
  PageModel _memberPublicInfosPages() {
    List<BodyComponentModel> components = [];
    components.add(BodyComponentModel(
        documentID: "internalWidget-memberPublicInfos",
        componentName: "eliud_core_model_internalWidgets",
        componentId: "memberPublicInfos"));
    PageModel page = PageModel(
        conditions: StorageConditionsModel(
          privilegeLevelRequired:
              PrivilegeLevelRequiredSimple.ownerPrivilegeRequiredSimple,
        ),
        appId: appId,
        documentID: "eliud_core_model_memberpublicinfos_page",
        title: "MemberPublicInfos",
        description: "MemberPublicInfos",
        drawer: _drawer,
        endDrawer: _endDrawer,
        appBar: _appBar,
        homeMenu: _homeMenu,
        bodyComponents: components,
        layout: PageLayout.onlyTheFirstComponent);
    return page;
  }

  /// Retrieve the admin pages
  PageModel _menuDefsPages() {
    List<BodyComponentModel> components = [];
    components.add(BodyComponentModel(
        documentID: "internalWidget-menuDefs",
        componentName: "eliud_core_model_internalWidgets",
        componentId: "menuDefs"));
    PageModel page = PageModel(
        conditions: StorageConditionsModel(
          privilegeLevelRequired:
              PrivilegeLevelRequiredSimple.ownerPrivilegeRequiredSimple,
        ),
        appId: appId,
        documentID: "eliud_core_model_menudefs_page",
        title: "MenuDefs",
        description: "MenuDefs",
        drawer: _drawer,
        endDrawer: _endDrawer,
        appBar: _appBar,
        homeMenu: _homeMenu,
        bodyComponents: components,
        layout: PageLayout.onlyTheFirstComponent);
    return page;
  }

  /// Retrieve the admin pages
  PageModel _pagesPages() {
    List<BodyComponentModel> components = [];
    components.add(BodyComponentModel(
        documentID: "internalWidget-pages",
        componentName: "eliud_core_model_internalWidgets",
        componentId: "pages"));
    PageModel page = PageModel(
        conditions: StorageConditionsModel(
          privilegeLevelRequired:
              PrivilegeLevelRequiredSimple.ownerPrivilegeRequiredSimple,
        ),
        appId: appId,
        documentID: "eliud_core_model_pages_page",
        title: "Pages",
        description: "Pages",
        drawer: _drawer,
        endDrawer: _endDrawer,
        appBar: _appBar,
        homeMenu: _homeMenu,
        bodyComponents: components,
        layout: PageLayout.onlyTheFirstComponent);
    return page;
  }

  /// Retrieve the admin pages
  PageModel _platformMediumsPages() {
    List<BodyComponentModel> components = [];
    components.add(BodyComponentModel(
        documentID: "internalWidget-platformMediums",
        componentName: "eliud_core_model_internalWidgets",
        componentId: "platformMediums"));
    PageModel page = PageModel(
        conditions: StorageConditionsModel(
          privilegeLevelRequired:
              PrivilegeLevelRequiredSimple.ownerPrivilegeRequiredSimple,
        ),
        appId: appId,
        documentID: "eliud_core_model_platformmediums_page",
        title: "PlatformMediums",
        description: "PlatformMediums",
        drawer: _drawer,
        endDrawer: _endDrawer,
        appBar: _appBar,
        homeMenu: _homeMenu,
        bodyComponents: components,
        layout: PageLayout.onlyTheFirstComponent);
    return page;
  }

  /// Retrieve the admin pages
  PageModel _publicMediumsPages() {
    List<BodyComponentModel> components = [];
    components.add(BodyComponentModel(
        documentID: "internalWidget-publicMediums",
        componentName: "eliud_core_model_internalWidgets",
        componentId: "publicMediums"));
    PageModel page = PageModel(
        conditions: StorageConditionsModel(
          privilegeLevelRequired:
              PrivilegeLevelRequiredSimple.ownerPrivilegeRequiredSimple,
        ),
        appId: appId,
        documentID: "eliud_core_model_publicmediums_page",
        title: "PublicMediums",
        description: "PublicMediums",
        drawer: _drawer,
        endDrawer: _endDrawer,
        appBar: _appBar,
        homeMenu: _homeMenu,
        bodyComponents: components,
        layout: PageLayout.onlyTheFirstComponent);
    return page;
  }

  Future<void> _setupAdminPages() {
    return pageRepository(appId: appId)!
        .add(_appsPages())
        .then((_) => pageRepository(appId: appId)!.add(_appBarsPages()))
        .then((_) => pageRepository(appId: appId)!.add(_appPolicysPages()))
        .then((_) => pageRepository(appId: appId)!.add(_backendRequestsPages()))
        .then((_) => pageRepository(appId: appId)!.add(_blockingsPages()))
        .then((_) =>
            pageRepository(appId: appId)!.add(_blockingDashboardsPages()))
        .then((_) => pageRepository(appId: appId)!.add(_dialogsPages()))
        .then((_) => pageRepository(appId: appId)!.add(_drawersPages()))
        .then((_) => pageRepository(appId: appId)!.add(_gridViewsPages()))
        .then((_) => pageRepository(appId: appId)!.add(_homeMenusPages()))
        .then((_) => pageRepository(appId: appId)!.add(_membersPages()))
        .then(
            (_) => pageRepository(appId: appId)!.add(_memberDashboardsPages()))
        .then(
            (_) => pageRepository(appId: appId)!.add(_memberPublicInfosPages()))
        .then((_) => pageRepository(appId: appId)!.add(_menuDefsPages()))
        .then((_) => pageRepository(appId: appId)!.add(_pagesPages()))
        .then((_) => pageRepository(appId: appId)!.add(_platformMediumsPages()))
        .then((_) => pageRepository(appId: appId)!.add(_publicMediumsPages()));
  }

  /// Run the admin, i.e setup all admin pages
  @override
  Future<void> run() async {
    return _setupAdminPages();
  }
}

class AdminMenu extends AdminAppMenuInstallerBase {
  /// Construct the admin menu
  @override
  Future<MenuDefModel> menu(AppModel app) async {
    var menuItems = <MenuItemModel>[];

    menuItems.add(MenuItemModel(
        documentID: "Apps",
        text: "Apps",
        description: "Apps",
        icon: IconModel(codePoint: 0xe88a, fontFamily: "MaterialIcons"),
        action: GotoPage(app, pageID: "eliud_core_model_apps_page")));

    menuItems.add(MenuItemModel(
        documentID: "AppBars",
        text: "AppBars",
        description: "AppBars",
        icon: IconModel(codePoint: 0xe88a, fontFamily: "MaterialIcons"),
        action: GotoPage(app, pageID: "eliud_core_model_appbars_page")));

    menuItems.add(MenuItemModel(
        documentID: "AppPolicys",
        text: "AppPolicys",
        description: "AppPolicys",
        icon: IconModel(codePoint: 0xe88a, fontFamily: "MaterialIcons"),
        action: GotoPage(app, pageID: "eliud_core_model_apppolicys_page")));

    menuItems.add(MenuItemModel(
        documentID: "BackendRequests",
        text: "BackendRequests",
        description: "BackendRequests",
        icon: IconModel(codePoint: 0xe88a, fontFamily: "MaterialIcons"),
        action:
            GotoPage(app, pageID: "eliud_core_model_backendrequests_page")));

    menuItems.add(MenuItemModel(
        documentID: "Blockings",
        text: "Blockings",
        description: "Blockings",
        icon: IconModel(codePoint: 0xe88a, fontFamily: "MaterialIcons"),
        action: GotoPage(app, pageID: "eliud_core_model_blockings_page")));

    menuItems.add(MenuItemModel(
        documentID: "BlockingDashboards",
        text: "BlockingDashboards",
        description: "BlockingDashboards",
        icon: IconModel(codePoint: 0xe88a, fontFamily: "MaterialIcons"),
        action:
            GotoPage(app, pageID: "eliud_core_model_blockingdashboards_page")));

    menuItems.add(MenuItemModel(
        documentID: "Dialogs",
        text: "Dialogs",
        description: "Dialogs",
        icon: IconModel(codePoint: 0xe88a, fontFamily: "MaterialIcons"),
        action: GotoPage(app, pageID: "eliud_core_model_dialogs_page")));

    menuItems.add(MenuItemModel(
        documentID: "Drawers",
        text: "Drawers",
        description: "Drawers",
        icon: IconModel(codePoint: 0xe88a, fontFamily: "MaterialIcons"),
        action: GotoPage(app, pageID: "eliud_core_model_drawers_page")));

    menuItems.add(MenuItemModel(
        documentID: "GridViews",
        text: "GridViews",
        description: "GridViews",
        icon: IconModel(codePoint: 0xe88a, fontFamily: "MaterialIcons"),
        action: GotoPage(app, pageID: "eliud_core_model_gridviews_page")));

    menuItems.add(MenuItemModel(
        documentID: "HomeMenus",
        text: "HomeMenus",
        description: "HomeMenus",
        icon: IconModel(codePoint: 0xe88a, fontFamily: "MaterialIcons"),
        action: GotoPage(app, pageID: "eliud_core_model_homemenus_page")));

    menuItems.add(MenuItemModel(
        documentID: "Members",
        text: "Members",
        description: "Members",
        icon: IconModel(codePoint: 0xe88a, fontFamily: "MaterialIcons"),
        action: GotoPage(app, pageID: "eliud_core_model_members_page")));

    menuItems.add(MenuItemModel(
        documentID: "MemberDashboards",
        text: "MemberDashboards",
        description: "MemberDashboards",
        icon: IconModel(codePoint: 0xe88a, fontFamily: "MaterialIcons"),
        action:
            GotoPage(app, pageID: "eliud_core_model_memberdashboards_page")));

    menuItems.add(MenuItemModel(
        documentID: "MemberPublicInfos",
        text: "MemberPublicInfos",
        description: "MemberPublicInfos",
        icon: IconModel(codePoint: 0xe88a, fontFamily: "MaterialIcons"),
        action:
            GotoPage(app, pageID: "eliud_core_model_memberpublicinfos_page")));

    menuItems.add(MenuItemModel(
        documentID: "MenuDefs",
        text: "MenuDefs",
        description: "MenuDefs",
        icon: IconModel(codePoint: 0xe88a, fontFamily: "MaterialIcons"),
        action: GotoPage(app, pageID: "eliud_core_model_menudefs_page")));

    menuItems.add(MenuItemModel(
        documentID: "Pages",
        text: "Pages",
        description: "Pages",
        icon: IconModel(codePoint: 0xe88a, fontFamily: "MaterialIcons"),
        action: GotoPage(app, pageID: "eliud_core_model_pages_page")));

    menuItems.add(MenuItemModel(
        documentID: "PlatformMediums",
        text: "PlatformMediums",
        description: "PlatformMediums",
        icon: IconModel(codePoint: 0xe88a, fontFamily: "MaterialIcons"),
        action:
            GotoPage(app, pageID: "eliud_core_model_platformmediums_page")));

    menuItems.add(MenuItemModel(
        documentID: "PublicMediums",
        text: "PublicMediums",
        description: "PublicMediums",
        icon: IconModel(codePoint: 0xe88a, fontFamily: "MaterialIcons"),
        action: GotoPage(app, pageID: "eliud_core_model_publicmediums_page")));

    MenuDefModel menu = MenuDefModel(
        admin: true,
        documentID: "eliud_core_model_admin_menu",
        appId: app.documentID,
        name: "eliud_core_model",
        menuItems: menuItems);
    await menuDefRepository(appId: app.documentID)!.add(menu);
    return menu;
  }
}

class AdminAppWiper extends AdminAppWiperBase {
  /// Delete all admin pages
  @override
  Future<void> deleteAll(String appID) async {
    await blockingRepository()!.deleteAll();
    await memberClaimRepository()!.deleteAll();
    await memberPublicInfoRepository()!.deleteAll();
    await publicMediumRepository()!.deleteAll();
  }
}
