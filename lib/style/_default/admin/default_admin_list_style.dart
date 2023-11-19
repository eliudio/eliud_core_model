import 'package:eliud_core_model/model/app_model.dart';
import 'package:eliud_core_model/model/member_model.dart';
import 'package:eliud_core_model/style/admin/admin_list_style.dart';
import 'package:flutter/material.dart';

import '../../../tools/etc/etc.dart';

class DefaultAdminListStyle extends AdminListStyle {
  @override
  Widget floatingActionButton(
      AppModel app, BuildContext context, String heroTag, Widget child,
      {VoidCallback? onPressed}) {
    return FloatingActionButton(
        heroTag: heroTag, child: child, onPressed: onPressed);
  }

  @override
  Widget divider(AppModel app, BuildContext context) {
    return Divider(
      height: 1.0,
      thickness: 1.0,
    );
  }

  @override
  BoxDecoration? boxDecorator(
      AppModel app, BuildContext context, MemberModel? member) {
    //var accessState = AccessBloc.getState(context);
    return BoxDecorationHelper.boxDecoration(app, member, null);
  }

  @override
  Widget listItem(AppModel app, BuildContext context, String text) {
    return Text(
      text,
    );
  }

  @override
  Widget progressIndicator(AppModel app, BuildContext context,
      {Animation<Color>? valueColor}) {
    return Center(child: CircularProgressIndicator(valueColor: valueColor));
  }
}
