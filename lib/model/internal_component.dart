/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 model/internal_component.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core_main/apis/registryapi/component/component_constructor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliud_core_helpers/query/query_tools.dart';

import 'package:eliud_core_helpers/tools/has_fab.dart';

import 'package:eliud_core_model/model/app_policy_list_bloc.dart';
import 'package:eliud_core_model/model/app_policy_list.dart';
import 'package:eliud_core_model/model/app_policy_dropdown_button.dart';
import 'package:eliud_core_model/model/app_policy_list_event.dart';

import 'package:eliud_core_model/model/abstract_repository_singleton.dart';
import 'package:eliud_core_main/model/model_export.dart';

import 'package:eliud_core_model/model/blocking_list_bloc.dart';
import 'package:eliud_core_model/model/blocking_list.dart';
import 'package:eliud_core_model/model/blocking_dropdown_button.dart';
import 'package:eliud_core_model/model/blocking_list_event.dart';

import 'package:eliud_core_model/model/blocking_dashboard_list_bloc.dart';
import 'package:eliud_core_model/model/blocking_dashboard_list.dart';
import 'package:eliud_core_model/model/blocking_dashboard_dropdown_button.dart';
import 'package:eliud_core_model/model/blocking_dashboard_list_event.dart';

import 'package:eliud_core_model/model/member_dashboard_list_bloc.dart';
import 'package:eliud_core_model/model/member_dashboard_list.dart';
import 'package:eliud_core_model/model/member_dashboard_dropdown_button.dart';
import 'package:eliud_core_model/model/member_dashboard_list_event.dart';

class ListComponentFactory implements ComponentConstructor {
  @override
  Widget? createNew(
      {Key? key,
      required AppModel app,
      required String id,
      int? privilegeLevel,
      Map<String, dynamic>? parameters}) {
    return ListComponent(app: app, componentId: id);
  }

  @override
  dynamic getModel({required AppModel app, required String id}) {
    return null;
  }
}

typedef DropdownButtonChanged = Function(String? value, int? privilegeLevel);

class DropdownButtonComponentFactory implements ComponentDropDown {
  @override
  dynamic getModel({required AppModel app, required String id}) {
    return null;
  }

  @override
  bool supports(String id) {
    if (id == "appPolicys") return true;
    if (id == "blockings") return true;
    if (id == "blockingDashboards") return true;
    if (id == "memberDashboards") return true;
    return false;
  }

  @override
  Widget createNew(
      {Key? key,
      required AppModel app,
      required String id,
      int? privilegeLevel,
      Map<String, dynamic>? parameters,
      String? value,
      DropdownButtonChanged? trigger,
      bool? optional}) {
    if (id == "appPolicys") {
      return DropdownButtonComponent(
          app: app,
          componentId: id,
          value: value,
          privilegeLevel: privilegeLevel,
          trigger: trigger,
          optional: optional);
    }

    if (id == "blockings") {
      return DropdownButtonComponent(
          app: app,
          componentId: id,
          value: value,
          privilegeLevel: privilegeLevel,
          trigger: trigger,
          optional: optional);
    }

    if (id == "blockingDashboards") {
      return DropdownButtonComponent(
          app: app,
          componentId: id,
          value: value,
          privilegeLevel: privilegeLevel,
          trigger: trigger,
          optional: optional);
    }

    if (id == "memberDashboards") {
      return DropdownButtonComponent(
          app: app,
          componentId: id,
          value: value,
          privilegeLevel: privilegeLevel,
          trigger: trigger,
          optional: optional);
    }

    return Text("Id $id not found");
  }
}

class ListComponent extends StatelessWidget with HasFab {
  final AppModel app;
  final String? componentId;
  final Widget? widget;
  final int? privilegeLevel;

  @override
  Widget? fab(BuildContext context) {
    if ((widget != null) && (widget is HasFab)) {
      HasFab hasFab = widget as HasFab;
      return hasFab.fab(context);
    }
    return null;
  }

  ListComponent({required this.app, this.privilegeLevel, this.componentId})
      : widget = getWidget(componentId, app);

  @override
  Widget build(BuildContext context) {
    if (componentId == 'appPolicys') {
      return _appPolicyBuild(context);
    }
    if (componentId == 'blockings') {
      return _blockingBuild(context);
    }
    if (componentId == 'blockingDashboards') {
      return _blockingDashboardBuild(context);
    }
    if (componentId == 'memberDashboards') {
      return _memberDashboardBuild(context);
    }
    return Text('Component with componentId == $componentId not found');
  }

  static Widget getWidget(String? componentId, AppModel app) {
    if (componentId == 'appPolicys') {
      return AppPolicyListWidget(app: app);
    }
    if (componentId == 'blockings') {
      return BlockingListWidget(app: app);
    }
    if (componentId == 'blockingDashboards') {
      return BlockingDashboardListWidget(app: app);
    }
    if (componentId == 'memberDashboards') {
      return MemberDashboardListWidget(app: app);
    }
    return Container();
  }

  Widget _appPolicyBuild(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AppPolicyListBloc>(
          create: (context) => AppPolicyListBloc(
            eliudQuery: EliudQuery(theConditions: [
              EliudQueryCondition('conditions.privilegeLevelRequired',
                  isEqualTo: privilegeLevel ?? 0),
              EliudQueryCondition('appId', isEqualTo: app.documentID),
            ]),
            appPolicyRepository: appPolicyRepository(appId: app.documentID)!,
          )..add(LoadAppPolicyList()),
        )
      ],
      child: widget!,
    );
  }

  Widget _blockingBuild(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<BlockingListBloc>(
          create: (context) => BlockingListBloc(
            eliudQuery: EliudQuery(theConditions: [
              EliudQueryCondition('conditions.privilegeLevelRequired',
                  isEqualTo: privilegeLevel ?? 0),
              EliudQueryCondition('appId', isEqualTo: app.documentID),
            ]),
            blockingRepository: blockingRepository()!,
          )..add(LoadBlockingList()),
        )
      ],
      child: widget!,
    );
  }

  Widget _blockingDashboardBuild(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<BlockingDashboardListBloc>(
          create: (context) => BlockingDashboardListBloc(
            eliudQuery: EliudQuery(theConditions: [
              EliudQueryCondition('conditions.privilegeLevelRequired',
                  isEqualTo: privilegeLevel ?? 0),
              EliudQueryCondition('appId', isEqualTo: app.documentID),
            ]),
            blockingDashboardRepository:
                blockingDashboardRepository(appId: app.documentID)!,
          )..add(LoadBlockingDashboardList()),
        )
      ],
      child: widget!,
    );
  }

  Widget _memberDashboardBuild(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MemberDashboardListBloc>(
          create: (context) => MemberDashboardListBloc(
            eliudQuery: EliudQuery(theConditions: [
              EliudQueryCondition('conditions.privilegeLevelRequired',
                  isEqualTo: privilegeLevel ?? 0),
              EliudQueryCondition('appId', isEqualTo: app.documentID),
            ]),
            memberDashboardRepository:
                memberDashboardRepository(appId: app.documentID)!,
          )..add(LoadMemberDashboardList()),
        )
      ],
      child: widget!,
    );
  }
}

typedef Changed = Function(String? value, int? privilegeLevel);

class DropdownButtonComponent extends StatelessWidget {
  final AppModel app;
  final String? componentId;
  final String? value;
  final Changed? trigger;
  final bool? optional;
  final int? privilegeLevel;

  DropdownButtonComponent(
      {required this.app,
      this.componentId,
      this.privilegeLevel,
      this.value,
      this.trigger,
      this.optional});

  @override
  Widget build(BuildContext context) {
    if (componentId == 'appPolicys') {
      return _appPolicyBuild(context);
    }
    if (componentId == 'blockings') {
      return _blockingBuild(context);
    }
    if (componentId == 'blockingDashboards') {
      return _blockingDashboardBuild(context);
    }
    if (componentId == 'memberDashboards') {
      return _memberDashboardBuild(context);
    }
    return Text('Component with componentId == $componentId not found');
  }

  Widget _appPolicyBuild(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AppPolicyListBloc>(
          create: (context) => AppPolicyListBloc(
            eliudQuery: EliudQuery(theConditions: [
              EliudQueryCondition('conditions.privilegeLevelRequired',
                  isEqualTo: privilegeLevel ?? 0),
              EliudQueryCondition('appId', isEqualTo: app.documentID),
            ]),
            appPolicyRepository: appPolicyRepository(appId: app.documentID)!,
          )..add(LoadAppPolicyList()),
        )
      ],
      child: AppPolicyDropdownButtonWidget(
          app: app,
          value: value,
          privilegeLevel: privilegeLevel,
          trigger: trigger,
          optional: optional),
    );
  }

  Widget _blockingBuild(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<BlockingListBloc>(
          create: (context) => BlockingListBloc(
            eliudQuery: EliudQuery(theConditions: [
              EliudQueryCondition('conditions.privilegeLevelRequired',
                  isEqualTo: privilegeLevel ?? 0),
              EliudQueryCondition('appId', isEqualTo: app.documentID),
            ]),
            blockingRepository: blockingRepository()!,
          )..add(LoadBlockingList()),
        )
      ],
      child: BlockingDropdownButtonWidget(
          app: app,
          value: value,
          privilegeLevel: privilegeLevel,
          trigger: trigger,
          optional: optional),
    );
  }

  Widget _blockingDashboardBuild(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<BlockingDashboardListBloc>(
          create: (context) => BlockingDashboardListBloc(
            eliudQuery: EliudQuery(theConditions: [
              EliudQueryCondition('conditions.privilegeLevelRequired',
                  isEqualTo: privilegeLevel ?? 0),
              EliudQueryCondition('appId', isEqualTo: app.documentID),
            ]),
            blockingDashboardRepository:
                blockingDashboardRepository(appId: app.documentID)!,
          )..add(LoadBlockingDashboardList()),
        )
      ],
      child: BlockingDashboardDropdownButtonWidget(
          app: app,
          value: value,
          privilegeLevel: privilegeLevel,
          trigger: trigger,
          optional: optional),
    );
  }

  Widget _memberDashboardBuild(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MemberDashboardListBloc>(
          create: (context) => MemberDashboardListBloc(
            eliudQuery: EliudQuery(theConditions: [
              EliudQueryCondition('conditions.privilegeLevelRequired',
                  isEqualTo: privilegeLevel ?? 0),
              EliudQueryCondition('appId', isEqualTo: app.documentID),
            ]),
            memberDashboardRepository:
                memberDashboardRepository(appId: app.documentID)!,
          )..add(LoadMemberDashboardList()),
        )
      ],
      child: MemberDashboardDropdownButtonWidget(
          app: app,
          value: value,
          privilegeLevel: privilegeLevel,
          trigger: trigger,
          optional: optional),
    );
  }
}
