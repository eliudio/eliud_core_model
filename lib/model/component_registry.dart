/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 model/component_registry.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import '../model/internal_component.dart';
import 'package:eliud_core_main/apis/registryapi/component/component_spec.dart';
import 'abstract_repository_singleton.dart';
import 'package:eliud_core_main/apis/registryapi/component/component_constructor.dart';
import 'package:eliud_core_main/apis/apis.dart';

import 'blocking_dashboard_component_selector.dart';
import 'member_dashboard_component_selector.dart';

/* 
 * Component registry contains a list of components
 */
class ComponentRegistry {
  /* 
   * Initialise the component registry
   */
  init(
    ComponentConstructor blockingDashboardComponentConstructorDefault,
    ComponentEditorConstructor blockingDashboardComponentEditorConstructor,
    ComponentConstructor memberDashboardComponentConstructorDefault,
    ComponentEditorConstructor memberDashboardComponentEditorConstructor,
  ) {
    Apis.apis().getRegistryApi().addInternalComponents('eliud_core_model', [
      "appPolicys",
      "blockings",
      "blockingDashboards",
      "memberDashboards",
    ]);

    Apis.apis().getRegistryApi().register(
        componentName: "eliud_core_model_internalWidgets",
        componentConstructor: ListComponentFactory());
    Apis.apis().getRegistryApi().addDropDownSupporter(
        "blockingDashboards", DropdownButtonComponentFactory());
    Apis.apis().getRegistryApi().register(
        componentName: "blockingDashboards",
        componentConstructor: blockingDashboardComponentConstructorDefault);
    Apis.apis().getRegistryApi().addDropDownSupporter(
        "memberDashboards", DropdownButtonComponentFactory());
    Apis.apis().getRegistryApi().register(
        componentName: "memberDashboards",
        componentConstructor: memberDashboardComponentConstructorDefault);
    Apis.apis().getRegistryApi().addComponentSpec('eliud_core_model', 'core', [
      ComponentSpec(
          'blockingDashboards',
          blockingDashboardComponentConstructorDefault,
          BlockingDashboardComponentSelector(),
          blockingDashboardComponentEditorConstructor,
          ({String? appId}) => blockingDashboardRepository(appId: appId)!),
      ComponentSpec(
          'memberDashboards',
          memberDashboardComponentConstructorDefault,
          MemberDashboardComponentSelector(),
          memberDashboardComponentEditorConstructor,
          ({String? appId}) => memberDashboardRepository(appId: appId)!),
    ]);
    Apis.apis().getRegistryApi().registerRetrieveRepository('eliud_core_model',
        'accesss', ({String? appId}) => accessRepository(appId: appId)!);
    Apis.apis().getRegistryApi().registerRetrieveRepository('eliud_core_model',
        'appPolicys', ({String? appId}) => appPolicyRepository(appId: appId)!);
    Apis.apis().getRegistryApi().registerRetrieveRepository(
        'eliud_core_model',
        'backendRequests',
        ({String? appId}) => backendRequestRepository(appId: appId)!);
    Apis.apis().getRegistryApi().registerRetrieveRepository(
        'eliud_core_model',
        'blockingDashboards',
        ({String? appId}) => blockingDashboardRepository(appId: appId)!);
    Apis.apis().getRegistryApi().registerRetrieveRepository(
        'eliud_core_model',
        'memberDashboards',
        ({String? appId}) => memberDashboardRepository(appId: appId)!);
  }
}
