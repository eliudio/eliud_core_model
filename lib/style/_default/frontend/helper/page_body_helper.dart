import 'package:eliud_core_model/apis/apis.dart';
import 'package:eliud_core_model/model/app_model.dart';
import 'package:eliud_core_model/model/background_model.dart';
import 'package:eliud_core_model/model/grid_view_model.dart';
import 'package:eliud_core_model/style/frontend/frontend_style.dart';
import 'package:eliud_core_model/style/frontend/has_page_body.dart';
import 'package:flutter/material.dart';

import '../../../../tools/etc/etc.dart';
import '../../../../tools/etc/grid_view_helper.dart';

class PageBodyHelper {
  final FrontEndStyle _frontEndStyle;

  PageBodyHelper(this._frontEndStyle);

  Widget pageBody(AppModel app, BuildContext context,
      {BackgroundModel? background,
      required List<Widget> components,
      Layout? layout,
      GridViewModel? gridView}) {
    try {
      if (components.isNotEmpty) {
        if (background == null) {
          return _container(context, components, layout, gridView);
        } else {
          return Stack(children: <Widget>[
            Container(
              clipBehavior: BoxDecorationHelper.determineClipBehaviour(
                  app, Apis.apis().getCoreApi().getMember(context), background),
              margin: BoxDecorationHelper.determineMargin(
                  app, Apis.apis().getCoreApi().getMember(context), background),
              padding: BoxDecorationHelper.determinePadding(
                  app, Apis.apis().getCoreApi().getMember(context), background),
              decoration: BoxDecorationHelper.boxDecoration(
                  app, Apis.apis().getCoreApi().getMember(context), background),
            ),
            _container(context, components, layout, gridView)
          ]);
        }
      }
      return Container(color: Colors.white);
    } catch (_) {
      return _frontEndStyle
          .textStyle()
          .text(app, context, "Error whilst constructing the body");
    }
  }

  Widget _container(BuildContext context, List<Widget> components,
      Layout? layout, GridViewModel? gridView) {
    // for PolicyPresentation /
//    if (components.length == 1) return _justTheFirst(components);
    switch (layout) {
      case Layout.gridView:
        return _gridView(context, components, gridView);
      case Layout.listView:
        return _listView(context, components);
      case Layout.onlyTheFirstComponent:
        return _justTheFirst(components);
      case Layout.unknown:
        return _listView(context, components);
      case null:
        break;
    }
    return _listView(context, components);
  }

  Widget _listView(BuildContext context, List<Widget?> components) {
    return ListView.builder(
      shrinkWrap: true,
      physics: ScrollPhysics(),
      itemCount: components.length,
      itemBuilder: (BuildContext context, int index) {
        return components[index]!;
      },
    );
  }

  Widget _justTheFirst(List<Widget> components) {
    return components[0];
  }

  Widget _gridView(
      BuildContext context, List<Widget> components, GridViewModel? model) {
    return GridViewHelper.container(context, components, model);
  }
}
