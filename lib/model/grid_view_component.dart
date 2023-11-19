/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 grid_view_component.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core_model/model/grid_view_component_bloc.dart';
import 'package:eliud_core_model/model/grid_view_component_event.dart';
import 'package:eliud_core_model/model/grid_view_model.dart';
import 'package:eliud_core_model/model/grid_view_component_state.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliud_core_model/style/style_registry.dart';
import 'abstract_repository_singleton.dart';
import 'package:eliud_core_model/widgets/alert_widget.dart';
import 'package:eliud_core_model/model/app_model.dart';

/*
 * AbstractGridViewComponent is the base class to extend / implement in case you need to implement a component
 */
abstract class AbstractGridViewComponent extends StatelessWidget {
  static String componentName = "gridViews";
  final AppModel app;
  final String gridViewId;

  /*
   * Construct AbstractGridViewComponent
   */
  AbstractGridViewComponent(
      {super.key, required this.app, required this.gridViewId});

  /*
   * build the component
   */
  @override
  Widget build(BuildContext context) {
    return BlocProvider<GridViewComponentBloc>(
      create: (context) => GridViewComponentBloc(
          gridViewRepository: gridViewRepository(appId: app.documentID)!)
        ..add(FetchGridViewComponent(id: gridViewId)),
      child: _gridViewBlockBuilder(context),
    );
  }

  Widget _gridViewBlockBuilder(BuildContext context) {
    return BlocBuilder<GridViewComponentBloc, GridViewComponentState>(
        builder: (context, state) {
      if (state is GridViewComponentLoaded) {
        return yourWidget(context, state.value);
      } else if (state is GridViewComponentPermissionDenied) {
        return Icon(
          Icons.highlight_off,
          color: Colors.red,
          size: 30.0,
        );
      } else if (state is GridViewComponentError) {
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
  Widget yourWidget(BuildContext context, GridViewModel value);
}
