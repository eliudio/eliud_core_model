/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 display_conditions_entity.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:collection';
import 'dart:convert';
import 'package:eliud_core_model/tools/base/entity_base.dart';

class DisplayConditionsEntity implements EntityBase {
  final int? privilegeLevelRequired;
  final String? packageCondition;
  final int? conditionOverride;

  DisplayConditionsEntity({
    this.privilegeLevelRequired,
    this.packageCondition,
    this.conditionOverride,
  });

  DisplayConditionsEntity copyWith({
    int? privilegeLevelRequired,
    String? packageCondition,
    int? conditionOverride,
  }) {
    return DisplayConditionsEntity(
      privilegeLevelRequired:
          privilegeLevelRequired ?? this.privilegeLevelRequired,
      packageCondition: packageCondition ?? this.packageCondition,
      conditionOverride: conditionOverride ?? this.conditionOverride,
    );
  }

  List<Object?> get props => [
        privilegeLevelRequired,
        packageCondition,
        conditionOverride,
      ];

  @override
  String toString() {
    return 'DisplayConditionsEntity{privilegeLevelRequired: $privilegeLevelRequired, packageCondition: $packageCondition, conditionOverride: $conditionOverride}';
  }

  static DisplayConditionsEntity? fromMap(Object? o,
      {Map<String, String>? newDocumentIds}) {
    if (o == null) return null;
    var map = o as Map<String, dynamic>;

    return DisplayConditionsEntity(
      privilegeLevelRequired: map['privilegeLevelRequired'],
      packageCondition: map['packageCondition'],
      conditionOverride: map['conditionOverride'],
    );
  }

  @override
  Map<String, Object?> toDocument() {
    Map<String, Object?> theDocument = HashMap();
    if (privilegeLevelRequired != null) {
      theDocument["privilegeLevelRequired"] = privilegeLevelRequired;
    } else {
      theDocument["privilegeLevelRequired"] = null;
    }
    if (packageCondition != null) {
      theDocument["packageCondition"] = packageCondition;
    } else {
      theDocument["packageCondition"] = null;
    }
    if (conditionOverride != null) {
      theDocument["conditionOverride"] = conditionOverride;
    } else {
      theDocument["conditionOverride"] = null;
    }
    return theDocument;
  }

  @override
  DisplayConditionsEntity switchAppId({required String newAppId}) {
    var newEntity = copyWith();
    return newEntity;
  }

  static DisplayConditionsEntity? fromJsonString(String json,
      {Map<String, String>? newDocumentIds}) {
    Map<String, dynamic>? generationSpecificationMap = jsonDecode(json);
    return fromMap(generationSpecificationMap, newDocumentIds: newDocumentIds);
  }

  String toJsonString() {
    return jsonEncode(toDocument());
  }

  @override
  Future<Map<String, Object?>> enrichedDocument(
      Map<String, Object?> theDocument) async {
    return theDocument;
  }
}
