import 'package:eliud_core_model/model/app_model.dart';
import 'package:eliud_core_model/model/rgb_model.dart';
import 'package:eliud_core_model/style/frontend/frontend_style.dart';
import 'package:eliud_core_model/style/frontend/has_menu.dart';
import 'package:eliud_core_model/style/frontend/types.dart';
import 'package:flutter/material.dart';

import '../helper/menu_helper.dart';

class DefaultMenuImpl implements HasMenu {
  final FrontEndStyle _frontEndStyle;

  DefaultMenuImpl(this._frontEndStyle);

  @override
  Future<void> openMenu(AppModel app, BuildContext context,
      {required RelativeRect position,
      required List<AbstractMenuItemAttributes> menuItems,
      RgbModel? popupMenuBackgroundColorOverride}) async {
    return MenuHelper(_frontEndStyle).openMenu(app, context,
        position: position,
        menuItems: menuItems,
        popupMenuBackgroundColor: popupMenuBackgroundColorOverride);
  }
}
