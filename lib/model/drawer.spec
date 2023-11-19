{
  "id": "Drawer",
  "packageName": "eliud_core_model",
  "packageFriendlyName": "core",
  "isAppModel": true,
  "generate": {
    "generateComponent": false,
    "generateRepository": true,
    "generateCache": true,
    "hasPersistentRepository": true,
    "generateFirestoreRepository": true,
    "generateRepositorySingleton": true,
    "generateModel": true,
    "generateEntity": true,
    "generateForm": true,
    "generateList": true,
    "generateDropDownButton": true,
    "generateInternalComponent": true,
    "generateEmbeddedComponent": false,
    "documentSubCollectionOf": "app"
  },
  "fields": [
    {
      "fieldName": "documentID",
      "required": true,
      "displayName": "Document ID",
      "fieldType": "String",
      "iconName": "vpn_key",
      "group": "general"
    },
    {
      "fieldName": "appId",
      "required": true,
      "displayName": "App ID",
      "fieldType": "String",
      "iconName": "vpn_key",
      "hidden": true,
      "group": "general"
    },
    {
      "fieldName": "name",
      "displayName": "Name",
      "fieldType": "String",
      "iconName": "text_format",
      "group": "general"
    },
    {
      "fieldName": "backgroundOverride",
      "displayName": "Background Override",
      "fieldType": "Background",
      "optional": true,
      "group": "background"
    },
    {
      "fieldName": "headerText",
      "displayName": "Header Text",
      "fieldType": "String",
      "group": "general"
    },
    {
      "fieldName": "secondHeaderText",
      "displayName": "Header Description",
      "fieldType": "String",
      "group": "general"
    },
    {
      "fieldName": "headerHeight",
      "displayName": "Header Height (0 for default)",
      "remark": "Header height, 0 for default",
      "group": "header",
      "iconName": "photo_size_select_large",
      "fieldType": "double"
    },
    {
      "fieldName": "popupMenuBackgroundColor",
      "displayName": "Popup Menu Background Color",
      "fieldType": "Rgb",
      "group": "popupMenuBackgroundColor",
      "iconName": "color_lens",
      "defaultValue": "RgbModel(r: 255, g: 255, b: 255, opacity: 1.00)",
      "bespokeFormField": "RgbField(widget.app, \"Popup Menu Background Color\", state.value!.popupMenuBackgroundColor, _onPopupMenuBackgroundColorChanged)"
    },
    {
      "fieldName": "headerBackgroundOverride",
      "displayName": "Header Background",
      "fieldType": "Background",
      "optional": true,
      "group": "headerBackground"
    },
    {
      "fieldName": "popupMenuBackgroundColorOverride",
      "displayName": "Popup Menu Background Color Override",
      "fieldType": "Rgb",
      "group": "popupMenuBackgroundColor",
      "iconName": "color_lens",
      "defaultValue": "RgbModel(r: 255, g: 255, b: 255, opacity: 1.00)",
      "bespokeFormField": "RgbField(widget.app, \"Popup Menu Background Color Override\", state.value!.popupMenuBackgroundColorOverride, _onPopupMenuBackgroundColorOverrideChanged)"
    },
    {
      "fieldName": "menu",
      "displayName": "Menu",
      "fieldType": "MenuDef",
      "association": true,
      "group": "menu"
    }
  ],
  "groups": [
    {
        "group": "general",
        "description": "General"
    },
    {
        "group": "header",
        "description": "Header"
    },
    {
        "group": "headerBackground",
        "description": "Header Background"
    },
    {
        "group": "itemColors",
        "description": "Menu Item Colors"
    },
    {
        "group": "background",
        "description": "Background"
    },
    {
        "group": "menu",
        "description": "Menu"
    }
  ],
  "listFields": {
    "title": "Center(child: StyleRegistry.registry().styleWithApp(app).frontEndStyle().textStyle().text(app, context, value.documentID))",
    "subTitle": "value.name != null ? Center(child: StyleRegistry.registry().styleWithApp(app).frontEndStyle().textStyle().text(app, context, value.name!)) : Container()"
  }
}