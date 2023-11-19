import 'package:eliud_core_model/apis_impl/action/goto_page.dart';
import 'package:eliud_core_model/model/app_model.dart';
import 'package:eliud_core_model/model/icon_model.dart';
import 'package:eliud_core_model/model/menu_item_model.dart';
import 'package:eliud_core_model/wizards/tools/document_identifier.dart';
import 'package:flutter/material.dart';

MenuItemModel menuItem(
        String uniqueId, AppModel app, pageID, text, IconData iconData) =>
    MenuItemModel(
        documentID: constructDocumentId(uniqueId: uniqueId, documentId: pageID),
        text: text,
        description: text,
        icon: IconModel(
            codePoint: iconData.codePoint,
            fontFamily: Icons.settings.fontFamily),
        action: GotoPage(app,
            pageID:
                constructDocumentId(uniqueId: uniqueId, documentId: pageID)));
