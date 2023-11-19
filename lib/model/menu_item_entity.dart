/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 menu_item_entity.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:collection';
import 'dart:convert';
import 'package:eliud_core_model/tools/base/entity_base.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_core_model/model/entity_export.dart';

class MenuItemEntity implements EntityBase {
  final String? text;
  final String? description;
  final IconEntity? icon;
  final ActionEntity? action;

  MenuItemEntity({
    this.text,
    this.description,
    this.icon,
    this.action,
  });

  MenuItemEntity copyWith({
    String? documentID,
    String? text,
    String? description,
    IconEntity? icon,
    ActionEntity? action,
  }) {
    return MenuItemEntity(
      text: text ?? this.text,
      description: description ?? this.description,
      icon: icon ?? this.icon,
      action: action ?? this.action,
    );
  }

  List<Object?> get props => [
        text,
        description,
        icon,
        action,
      ];

  @override
  String toString() {
    return 'MenuItemEntity{text: $text, description: $description, icon: $icon, action: $action}';
  }

  static MenuItemEntity? fromMap(Object? o,
      {Map<String, String>? newDocumentIds}) {
    if (o == null) return null;
    var map = o as Map<String, dynamic>;

    var iconFromMap = map['icon'];
    if (iconFromMap != null) {
      iconFromMap =
          IconEntity.fromMap(iconFromMap, newDocumentIds: newDocumentIds);
    }
    var actionFromMap = map['action'];
    if (actionFromMap != null) {
      actionFromMap =
          ActionEntity.fromMap(actionFromMap, newDocumentIds: newDocumentIds);
    }

    return MenuItemEntity(
      text: map['text'],
      description: map['description'],
      icon: iconFromMap,
      action: actionFromMap,
    );
  }

  @override
  Map<String, Object?> toDocument() {
    final Map<String, dynamic>? iconMap =
        icon != null ? icon!.toDocument() : null;
    final Map<String, dynamic>? actionMap =
        action != null ? action!.toDocument() : null;

    Map<String, Object?> theDocument = HashMap();
    if (text != null) {
      theDocument["text"] = text;
    } else {
      theDocument["text"] = null;
    }
    if (description != null) {
      theDocument["description"] = description;
    } else {
      theDocument["description"] = null;
    }
    if (icon != null) {
      theDocument["icon"] = iconMap;
    } else {
      theDocument["icon"] = null;
    }
    if (action != null) {
      theDocument["action"] = actionMap;
    } else {
      theDocument["action"] = null;
    }
    return theDocument;
  }

  @override
  MenuItemEntity switchAppId({required String newAppId}) {
    var newEntity = copyWith();
    return newEntity;
  }

  static MenuItemEntity? fromJsonString(String json,
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
