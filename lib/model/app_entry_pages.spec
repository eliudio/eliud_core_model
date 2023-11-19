{
  "id": "AppEntryPages",
  "packageName": "eliud_core_model",
  "packageFriendlyName": "core",
  "generate": {
    "generateComponent": false,
    "generateRepository": true,
    "generateCache": true,
	  "hasPersistentRepository": false,
    "generateFirestoreRepository": false,
    "generateRepositorySingleton": false,
    "generateModel": true,
    "generateEntity": true,
    "generateForm": true,
    "generateList": true,
    "generateDropDownButton": true,
    "generateInternalComponent": false,
    "generateEmbeddedComponent": true
  },
  "fields": [
    {
      "fieldName": "documentID",
      "required": true,
      "displayName": "Document ID",
      "fieldType": "String",
      "group": "componentName",
      "defaultValue": "IDENTIFIER",
      "iconName": "vpn_key",
      "hidden": true
    },
    {
      "fieldName": "entryPage",
      "displayName": "Entry Page",
      "fieldType": "Page",
      "association": true,
      "optional": false,
      "iconName": "play_arrow",
      "group": "main"
    },
    {
      "fieldName": "minPrivilege",
      "remark": "Members with a privilege more or equal to this privilege have this homepage, unless a ",
      "fieldType": "int"
    }
  ],
  "groups": [
    {
        "group": "componentName",
        "description": "Component"
    },
    {
        "group": "componentId",
        "description": "Component spec"
    }
  ],
  "listFields": {
    "title": "Center(child: StyleRegistry.registry().styleWithApp(app).frontEndStyle().textStyle().text(app, context, value.entryPage!.documentID))",
    "subTitle": "value.entryPage!.title != null ? Center(child: StyleRegistry.registry().styleWithApp(app).frontEndStyle().textStyle().text(app, context, value.entryPage!.title!)) : Container()"
  }
}
