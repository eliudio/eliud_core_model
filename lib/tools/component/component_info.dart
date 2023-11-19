import 'package:eliud_core_model/apis/apis.dart';
import 'package:eliud_core_model/model/app_model.dart';
import 'package:eliud_core_model/model/background_model.dart';
import 'package:eliud_core_model/model/body_component_model.dart';
import 'package:eliud_core_model/model/grid_view_model.dart';
import 'package:eliud_core_model/style/frontend/has_page_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../decoration/decorations.dart';
import '../etc/has_fab.dart';

class ComponentInfo {
  final List<BodyComponentModel>? componentModels;
  final Map<String, dynamic>? parameters;
  final List<Widget> widgets;
  final HasFab? hasFab;
  final Layout layout;
  final BackgroundModel? backgroundOverride;
  final GridViewModel? gridView;

  ComponentInfo(this.componentModels, this.parameters, this.widgets,
      this.hasFab, this.layout, this.backgroundOverride, this.gridView);

  static HasFab? _getFab(List<Widget?> components) {
    HasFab? hasFab;
    for (var element in components) {
      if (element is HasFab) {
        hasFab = element as HasFab?;
      }
    }
    return hasFab;
  }

  static ComponentInfo getComponentInfo(
      BuildContext context,
      AppModel app,
      List<BodyComponentModel>? componentModels,
      Map<String, dynamic>? parameters,
/*
      AccessDetermined accessDetermined,
*/
      Layout layout,
      BackgroundModel? background,
      GridViewModel? gridView) {
    if (componentModels == null) throw Exception("componentModels is null");
    var widgets = <Widget>[];
    for (var model in componentModels) {
      var key = GlobalKey();
      var bodyComponent = Decorations.instance().createDecoratedBodyComponent(
          app,
          context,
          key,
          () => Apis.apis().getRegistryApi().component(context, app,
              /*accessDetermined,*/ model.componentName!, model.componentId!,
              key: key, parameters: parameters),
          model)();
      widgets.add(bodyComponent);
    }

    var hasFab = _getFab(widgets);
    return ComponentInfo(componentModels, parameters, widgets, hasFab, layout,
        background, gridView);
  }
}
