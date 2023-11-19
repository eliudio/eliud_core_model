import 'package:eliud_core_model/model/app_model.dart';
import 'package:eliud_core_model/model/background_model.dart';
import 'package:eliud_core_model/model/grid_view_model.dart';
import 'package:flutter/material.dart';

import '../style_registry.dart';

enum Layout { gridView, listView, onlyTheFirstComponent, unknown }

abstract class HasPageBody {
  Widget pageBody(AppModel app, BuildContext context,
      {BackgroundModel? backgroundOverride,
      required List<Widget> components,
      Layout? layout,
      GridViewModel? gridView});
}

Widget pageBody(AppModel app, BuildContext context,
        {BackgroundModel? backgroundOverride,
        required List<Widget> components,
        Layout? layout,
        GridViewModel? gridView}) =>
    StyleRegistry.registry()
        .styleWithApp(app)
        .frontEndStyle()
        .pageBodyStyle()
        .pageBody(app, context,
            backgroundOverride: backgroundOverride,
            components: components,
            layout: layout,
            gridView: gridView);

Widget pageBody2(AppModel app, BuildContext context,
        {BackgroundModel? backgroundOverride,
        required List<Widget> components,
        Layout? layout,
        GridViewModel? gridView}) =>
    StyleRegistry.registry()
        .styleWithApp(app)
        .frontEndStyle()
        .pageBodyStyle()
        .pageBody(app, context,
            backgroundOverride: backgroundOverride,
            components: components,
            layout: layout,
            gridView: gridView);
