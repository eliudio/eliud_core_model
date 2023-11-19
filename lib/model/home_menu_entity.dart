/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 home_menu_entity.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:collection';
import 'dart:convert';
import 'package:eliud_core_model/tools/base/entity_base.dart';
import 'package:eliud_core_model/model/entity_export.dart';

class HomeMenuEntity implements EntityBase {
  final String? appId;
  final String? name;
  final String? menuId;
  final RgbEntity? iconColorOverride;
  final BackgroundEntity? backgroundOverride;
  final RgbEntity? popupMenuBackgroundColorOverride;

  HomeMenuEntity({
    required this.appId,
    this.name,
    this.menuId,
    this.iconColorOverride,
    this.backgroundOverride,
    this.popupMenuBackgroundColorOverride,
  });

  HomeMenuEntity copyWith({
    String? documentID,
    String? appId,
    String? name,
    String? menuId,
    RgbEntity? iconColorOverride,
    BackgroundEntity? backgroundOverride,
    RgbEntity? popupMenuBackgroundColorOverride,
  }) {
    return HomeMenuEntity(
      appId: appId ?? this.appId,
      name: name ?? this.name,
      menuId: menuId ?? this.menuId,
      iconColorOverride: iconColorOverride ?? this.iconColorOverride,
      backgroundOverride: backgroundOverride ?? this.backgroundOverride,
      popupMenuBackgroundColorOverride: popupMenuBackgroundColorOverride ??
          this.popupMenuBackgroundColorOverride,
    );
  }

  List<Object?> get props => [
        appId,
        name,
        menuId,
        iconColorOverride,
        backgroundOverride,
        popupMenuBackgroundColorOverride,
      ];

  @override
  String toString() {
    return 'HomeMenuEntity{appId: $appId, name: $name, menuId: $menuId, iconColorOverride: $iconColorOverride, backgroundOverride: $backgroundOverride, popupMenuBackgroundColorOverride: $popupMenuBackgroundColorOverride}';
  }

  static HomeMenuEntity? fromMap(Object? o,
      {Map<String, String>? newDocumentIds}) {
    if (o == null) return null;
    var map = o as Map<String, dynamic>;

    var iconColorOverrideFromMap = map['iconColorOverride'];
    if (iconColorOverrideFromMap != null) {
      iconColorOverrideFromMap = RgbEntity.fromMap(iconColorOverrideFromMap,
          newDocumentIds: newDocumentIds);
    }
    var backgroundOverrideFromMap = map['backgroundOverride'];
    if (backgroundOverrideFromMap != null) {
      backgroundOverrideFromMap = BackgroundEntity.fromMap(
          backgroundOverrideFromMap,
          newDocumentIds: newDocumentIds);
    }
    var popupMenuBackgroundColorOverrideFromMap =
        map['popupMenuBackgroundColorOverride'];
    if (popupMenuBackgroundColorOverrideFromMap != null) {
      popupMenuBackgroundColorOverrideFromMap = RgbEntity.fromMap(
          popupMenuBackgroundColorOverrideFromMap,
          newDocumentIds: newDocumentIds);
    }

    return HomeMenuEntity(
      appId: map['appId'],
      name: map['name'],
      menuId: map['menuId'],
      iconColorOverride: iconColorOverrideFromMap,
      backgroundOverride: backgroundOverrideFromMap,
      popupMenuBackgroundColorOverride: popupMenuBackgroundColorOverrideFromMap,
    );
  }

  @override
  Map<String, Object?> toDocument() {
    final Map<String, dynamic>? iconColorOverrideMap =
        iconColorOverride != null ? iconColorOverride!.toDocument() : null;
    final Map<String, dynamic>? backgroundOverrideMap =
        backgroundOverride != null ? backgroundOverride!.toDocument() : null;
    final Map<String, dynamic>? popupMenuBackgroundColorOverrideMap =
        popupMenuBackgroundColorOverride != null
            ? popupMenuBackgroundColorOverride!.toDocument()
            : null;

    Map<String, Object?> theDocument = HashMap();
    if (appId != null) {
      theDocument["appId"] = appId;
    } else {
      theDocument["appId"] = null;
    }
    if (name != null) {
      theDocument["name"] = name;
    } else {
      theDocument["name"] = null;
    }
    if (menuId != null) {
      theDocument["menuId"] = menuId;
    } else {
      theDocument["menuId"] = null;
    }
    if (iconColorOverride != null) {
      theDocument["iconColorOverride"] = iconColorOverrideMap;
    } else {
      theDocument["iconColorOverride"] = null;
    }
    if (backgroundOverride != null) {
      theDocument["backgroundOverride"] = backgroundOverrideMap;
    } else {
      theDocument["backgroundOverride"] = null;
    }
    if (popupMenuBackgroundColorOverride != null) {
      theDocument["popupMenuBackgroundColorOverride"] =
          popupMenuBackgroundColorOverrideMap;
    } else {
      theDocument["popupMenuBackgroundColorOverride"] = null;
    }
    return theDocument;
  }

  @override
  HomeMenuEntity switchAppId({required String newAppId}) {
    var newEntity = copyWith(appId: newAppId);
    return newEntity;
  }

  static HomeMenuEntity? fromJsonString(String json,
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
