/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 app_policy_component.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core_model/model/app_policy_component_bloc.dart';
import 'package:eliud_core_model/model/app_policy_component_event.dart';
import 'package:eliud_core_model/model/app_policy_model.dart';
import 'package:eliud_core_model/model/app_policy_component_state.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliud_core_main/apis/style/style_registry.dart';
import 'abstract_repository_singleton.dart';
import 'package:eliud_core_main/widgets/alert_widget.dart';
import 'package:eliud_core_main/model/app_model.dart';

/*
 * AbstractAppPolicyComponent is the base class to extend / implement in case you need to implement a component
 */
abstract class AbstractAppPolicyComponent extends StatelessWidget {
  static String componentName = "appPolicys";
  final AppModel app;
  final String appPolicyId;

  /*
   * Construct AbstractAppPolicyComponent
   */
  AbstractAppPolicyComponent(
      {super.key, required this.app, required this.appPolicyId});

  /*
   * build the component
   */
  @override
  Widget build(BuildContext context) {
    return BlocProvider<AppPolicyComponentBloc>(
      create: (context) => AppPolicyComponentBloc(
          appPolicyRepository: appPolicyRepository(appId: app.documentID)!)
        ..add(FetchAppPolicyComponent(id: appPolicyId)),
      child: _appPolicyBlockBuilder(context),
    );
  }

  Widget _appPolicyBlockBuilder(BuildContext context) {
    return BlocBuilder<AppPolicyComponentBloc, AppPolicyComponentState>(
        builder: (context, state) {
      if (state is AppPolicyComponentLoaded) {
        return yourWidget(context, state.value);
      } else if (state is AppPolicyComponentPermissionDenied) {
        return Icon(
          Icons.highlight_off,
          color: Colors.red,
          size: 30.0,
        );
      } else if (state is AppPolicyComponentError) {
        return AlertWidget(app: app, title: 'Error', content: state.message);
      } else {
        return Center(
          child: StyleRegistry.registry()
              .styleWithApp(app)
              .frontEndStyle()
              .progressIndicatorStyle()
              .progressIndicator(app, context),
        );
      }
    });
  }

  /*
   * Implement this method to provide your widget
   */
  Widget yourWidget(BuildContext context, AppPolicyModel value);
}
