{
  "id": "DisplayConditions",
  "packageName": "eliud_core_model",
  "packageFriendlyName": "core",
  "isAppModel": true,
  "generate": {
    "generateComponent": false,
    "generateRepository": false,
    "generateCache": false,
    "hasPersistentRepository": false,
    "generateFirestoreRepository": false,
    "generateRepositorySingleton": false,
    "generateModel": true,
    "generateEntity": true,
    "generateForm": false,
    "generateList": false,
    "generateDropDownButton": false,
    "generateInternalComponent": false,
    "generateEmbeddedComponent": false
  },
  "fields": [
    {
      "fieldName": "privilegeLevelRequired",
      "displayName": "Privilege Level Required",
      "remark": "see firestore rules",
      "fieldType": "enum",
      "enumName": "PrivilegeLevelRequired",
      "enumValues" : [ "noPrivilegeRequired", "level1PrivilegeRequired", "level2PrivilegeRequired", "ownerPrivilegeRequired" ],
      "defaultValue": "0",
      "group": "conditional"
    },
    {
      "fieldName": "packageCondition",
      "displayName": "Package condition",
      "remark": "see firestore rules",
      "fieldType": "String",
      "iconName": "text_format",
      "conditional": "(state.value!.packageCondition == ReadCondition.PackageDecides)",
      "group": "conditional2"
    },
    {
      "fieldName": "conditionOverride",
      "displayName": "Condition override",
      "remark": "see firestore rules",
      "fieldType": "enum",
      "enumName": "ConditionOverride",
      "enumValues" : [ "exactPrivilege", "inclusiveForBlockedMembers", "exclusiveForBlockedMember" ],
      "group": "conditional3"
    }
  ],
  "groups": [
    {
        "group": "conditional",
        "description": "Conditional"
    },
    {
        "group": "conditional2",
        "description": "Plugin Condition",
        "conditional": "(state.value!.packageCondition == ReadCondition.PackageDecides)"
    },
    {
        "group": "conditional3",
        "description": "Conditional"
    }
  ]
}