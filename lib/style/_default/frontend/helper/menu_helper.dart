import 'package:eliud_core_model/model/app_model.dart';
import 'package:eliud_core_model/model/rgb_model.dart';
import 'package:eliud_core_model/style/frontend/frontend_style.dart';
import 'package:eliud_core_model/style/frontend/types.dart';
import 'package:flutter/material.dart';

import '../../../../tools/etc/etc.dart';

class MenuHelper {
  final FrontEndStyle _frontEndStyle;

  MenuHelper(this._frontEndStyle);

  Future<void> openMenu(AppModel app, BuildContext context,
      {required RelativeRect position,
      required List<AbstractMenuItemAttributes> menuItems,
      RgbModel? popupMenuBackgroundColor}) async {
    var popupMenuItems = <PopupMenuItem<int>>[];
    var i = 0;
    for (var element in menuItems) {
      var label = element.label ?? '?';
      var p = PopupMenuItem<int>(
          value: i,
          child: element.isActive
              ? _frontEndStyle.textStyle().h3(app, context, label)
              : _frontEndStyle.textStyle().h4(app, context, label));
      popupMenuItems.add(p);
      i++;
    }

    final result = await showMenu<int>(
        context: context,
        position: position,
        items: popupMenuItems,
        elevation: 8.0,
        color: RgbHelper.color(rgbo: popupMenuBackgroundColor));
    if (result != null) {
      var item = menuItems[result];
      if (item is MenuItemAttributes) {
        item.onTap();
      } else if (item is MenuItemWithMenuItems) {
        await openMenu(app, context,
            position: position,
            menuItems: item.items,
            popupMenuBackgroundColor: popupMenuBackgroundColor);
      }
    }
  }
}
