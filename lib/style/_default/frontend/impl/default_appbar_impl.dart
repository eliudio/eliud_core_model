import 'package:eliud_core_model/model/app_model.dart';
import 'package:eliud_core_model/model/background_model.dart';
import 'package:eliud_core_model/model/member_model.dart';
import 'package:eliud_core_model/model/rgb_model.dart';
import 'package:eliud_core_model/style/frontend/frontend_style.dart';
import 'package:eliud_core_model/style/frontend/has_appbar.dart';
import 'package:eliud_core_model/style/frontend/types.dart';
import 'package:flutter/material.dart';

import '../../../../tools/etc/etc.dart';
import '../../tools/colors.dart';
import '../helper/appbar_helper.dart';
import 'default_menu_impl.dart';

class DefaultAppBarImpl implements HasAppBar {
  final FrontEndStyle _frontEndStyle;

  DefaultAppBarImpl(this._frontEndStyle);

  @override
  PreferredSizeWidget appBar(AppModel app, BuildContext context,
      {required AppbarHeaderAttributes headerAttributes,
      required String pageName,
      required MemberModel? member,
      List<AbstractMenuItemAttributes>? items,
      BackgroundModel? backgroundOverride,
      RgbModel? menuBackgroundColorOverride,
      RgbModel? selectedIconColorOverride,
      RgbModel? iconColorOverride,
      VoidCallback? openDrawer,
      Key? key}) {
    var iconColor = iconColorOverride ?? EliudColors.black;
    var selectedIconColor = selectedIconColorOverride ?? EliudColors.green;
    var menuBackgroundColor = menuBackgroundColorOverride ?? EliudColors.white;

    var appBarHelper =
        AppBarHelper(_frontEndStyle, DefaultMenuImpl(_frontEndStyle));
    var title = appBarHelper.title(app, context, headerAttributes, pageName);

    var iconThemeData = IconThemeData(color: RgbHelper.color(rgbo: iconColor));

    // add menu items
    List<Widget>? buttons;
    if (items != null) {
      buttons = items
          .map((item) => appBarHelper.button(app, context, item,
              menuBackgroundColor, selectedIconColor, iconColor))
          .toList();
    } else {
      buttons = [];
    }

    // add profilePhoto
    if (member != null) {
      buttons.add(_frontEndStyle
          .profilePhotoStyle()
          .getProfilePhotoButtonFromMember(app, context,
              member: member,
              radius: 20,
              iconColor: EliudColors.white,
              onPressed: openDrawer));
    }

    return AppBar(
        key: key,
        iconTheme: iconThemeData,
        title: title,
        actions: buttons,
        flexibleSpace: Container(
            clipBehavior: BoxDecorationHelper.determineClipBehaviour(
                app, member, backgroundOverride),
            margin: BoxDecorationHelper.determineMargin(
                app, member, backgroundOverride),
            padding: BoxDecorationHelper.determinePadding(
                app, member, backgroundOverride),
            decoration: BoxDecorationHelper.boxDecoration(
                app, member, backgroundOverride)));
  }
}
