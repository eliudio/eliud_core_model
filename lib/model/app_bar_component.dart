/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 app_bar_component.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core_model/model/app_bar_component_bloc.dart';
import 'package:eliud_core_model/model/app_bar_component_event.dart';
import 'package:eliud_core_model/model/app_bar_model.dart';
import 'package:eliud_core_model/model/app_bar_component_state.dart';
import 'package:eliud_core_model/widgets/alert_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliud_core_model/style/style_registry.dart';
import 'abstract_repository_singleton.dart';
import 'package:eliud_core_model/widgets/alert_widget.dart';
import 'package:eliud_core_model/model/app_model.dart';

/*
 * AbstractAppBarComponent is the base class to extend / implement in case you need to implement a component
 */
abstract class AbstractAppBarComponent extends StatelessWidget {
  static String componentName = "appBars";
  final AppModel app;
  final String appBarId;

  /*
   * Construct AbstractAppBarComponent
   */
  AbstractAppBarComponent(
      {super.key, required this.app, required this.appBarId});

  /*
   * build the component
   */
  @override
  Widget build(BuildContext context) {
    return BlocProvider<AppBarComponentBloc>(
      create: (context) => AppBarComponentBloc(
          appBarRepository: appBarRepository(appId: app.documentID)!)
        ..add(FetchAppBarComponent(id: appBarId)),
      child: _appBarBlockBuilder(context),
    );
  }

  Widget _appBarBlockBuilder(BuildContext context) {
    return BlocBuilder<AppBarComponentBloc, AppBarComponentState>(
        builder: (context, state) {
      if (state is AppBarComponentLoaded) {
        return yourWidget(context, state.value);
      } else if (state is AppBarComponentPermissionDenied) {
        return Icon(
          Icons.highlight_off,
          color: Colors.red,
          size: 30.0,
        );
      } else if (state is AppBarComponentError) {
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
  Widget yourWidget(BuildContext context, AppBarModel value);
}
