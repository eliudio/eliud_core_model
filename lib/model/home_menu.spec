{
  "id": "HomeMenu",
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
      "group": "general",
      "defaultValue": "IDENTIFIER",
      "iconName": "vpn_key"
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
      "group": "general",
      "fieldValidation": "    // This could be written in 1 line. However, this is to illustrate how to write multiple lines of code\n    if (value!.length == 0) {\n      return false;\n    } else {\n      return true;\n    }\n",
      "defaultValue": "Name",
      "iconName": "text_format"
    },
    {
      "fieldName": "menu",
      "displayName": "Menu",
      "fieldType": "MenuDef",
      "association": true,
      "group": "menu"
    },
    {
      "fieldName": "iconColorOverride",
      "displayName": "Icon Color",
      "defaultValue": "RgbModel(r: 255, g: 255, b: 255, opacity: 1.00)",
      "fieldType": "Rgb",
      "group": "colors",
      "iconName": "color_lens",
      "bespokeFormField": "RgbField(widget.app, \"Icon Color Override\", state.value!.iconColorOverride, _onIconColorOverrideChanged)"
    },
    {
      "fieldName": "backgroundOverride",
      "remark": "Override the style background",
      "displayName": "Background Override",
      "fieldType": "Background",
      "optional": true,
      "group": "background"
    },
    {
      "fieldName": "popupMenuBackgroundColorOverride",
      "displayName": "Popup Menu Background Color Override",
      "fieldType": "Rgb",
      "group": "popupMenuBackgroundColor",
      "iconName": "color_lens",
      "defaultValue": "RgbModel(r: 255, g: 255, b: 255, opacity: 1.00)",
      "bespokeFormField": "RgbField(widget.app, \"Popup Menu Background Color Override\", state.value!.popupMenuBackgroundColorOverride, _onPopupMenuBackgroundColorOverrideChanged)"
    }
  ],
  "groups": [
    {
        "group": "general",
        "description": "General"
    },
    {
        "group": "colors",
        "description": "Colors"
    },
    {
        "group": "menu",
        "description": "Menu"
    },
    {
        "group": "background",
        "description": "Background"
    },
    {
        "group": "popupMenuBackgroundColor",
        "description": "Popup Menu Background Color"
    }
  ],
  "listFields": {
    "title": "value.name != null ? Center(child: StyleRegistry.registry().styleWithApp(app).frontEndStyle().textStyle().text(app, context, value.name!)) : Container()"
  }
}
