import 'package:eliud_core_model/model/app_model.dart';
import 'package:eliud_core_model/style/frontend/has_divider.dart';
import 'package:flutter/material.dart';

class DefaultDividerImpl implements HasDivider {
  @override
  Widget divider(AppModel app, BuildContext context) {
    return Divider(
      height: 1.0,
      thickness: 1.0,
    );
  }

  @override
  Widget verticalDivider(AppModel app, BuildContext context, double height) {
    return Container(
      height: height,
      width: 1,
    );
  }
}
