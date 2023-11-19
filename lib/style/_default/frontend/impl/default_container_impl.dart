import 'package:eliud_core_model/model/app_model.dart';
import 'package:eliud_core_model/style/frontend/has_container.dart';
import 'package:eliud_core_model/style/frontend/has_divider.dart';
import 'package:eliud_core_model/style/frontend/has_text.dart';
import 'package:flutter/material.dart';

import '../../../../model/background_model.dart';

class DefaultContainerImpl implements HasContainer {
  @override
  Widget actionContainer(
    AppModel app,
    BuildContext context, {
    required Widget child,
    double? height,
    double? width,
    BackgroundModel? backgroundOverride,
  }) {
    return child;
  }

  @override
  Widget topicContainer(AppModel app, BuildContext context,
      {required List<Widget> children,
      DecorationImage? image,
      double? height,
      double? width,
      String? title,
      bool? collapsible,
      bool? collapsed = false,
      BackgroundModel? backgroundOverride}) {
    if (title != null) {
      var newChildren = [text(app, context, title), divider(app, context)];
      newChildren.addAll(children);
      children = newChildren;
    }
    return Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          image: image,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: children,
        ));
  }

  @override
  Widget simpleTopicContainer(AppModel app, BuildContext context,
      {required List<Widget> children,
      DecorationImage? image,
      double? height,
      double? width}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children,
    );
  }
}
