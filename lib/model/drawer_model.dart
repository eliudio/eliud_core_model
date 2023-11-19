/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 drawer_model.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core_model/tools/base/model_base.dart';

import 'package:eliud_core_model/model/abstract_repository_singleton.dart';
import 'package:eliud_core_model/model/model_export.dart';
import 'package:eliud_core_model/model/entity_export.dart';

import 'package:eliud_core_model/model/drawer_entity.dart';

class DrawerModel implements ModelBase, WithAppId {
  static const String packageName = 'eliud_core_model';
  static const String id = 'drawers';

  @override
  String documentID;
  @override
  String appId;
  String? name;
  BackgroundModel? backgroundOverride;
  String? headerText;
  String? secondHeaderText;

  // Header height, 0 for default
  double? headerHeight;
  RgbModel? popupMenuBackgroundColor;
  BackgroundModel? headerBackgroundOverride;
  RgbModel? popupMenuBackgroundColorOverride;
  MenuDefModel? menu;

  DrawerModel({
    required this.documentID,
    required this.appId,
    this.name,
    this.backgroundOverride,
    this.headerText,
    this.secondHeaderText,
    this.headerHeight,
    this.popupMenuBackgroundColor,
    this.headerBackgroundOverride,
    this.popupMenuBackgroundColorOverride,
    this.menu,
  });

  @override
  DrawerModel copyWith({
    String? documentID,
    String? appId,
    String? name,
    BackgroundModel? backgroundOverride,
    String? headerText,
    String? secondHeaderText,
    double? headerHeight,
    RgbModel? popupMenuBackgroundColor,
    BackgroundModel? headerBackgroundOverride,
    RgbModel? popupMenuBackgroundColorOverride,
    MenuDefModel? menu,
  }) {
    return DrawerModel(
      documentID: documentID ?? this.documentID,
      appId: appId ?? this.appId,
      name: name ?? this.name,
      backgroundOverride: backgroundOverride ?? this.backgroundOverride,
      headerText: headerText ?? this.headerText,
      secondHeaderText: secondHeaderText ?? this.secondHeaderText,
      headerHeight: headerHeight ?? this.headerHeight,
      popupMenuBackgroundColor:
          popupMenuBackgroundColor ?? this.popupMenuBackgroundColor,
      headerBackgroundOverride:
          headerBackgroundOverride ?? this.headerBackgroundOverride,
      popupMenuBackgroundColorOverride: popupMenuBackgroundColorOverride ??
          this.popupMenuBackgroundColorOverride,
      menu: menu ?? this.menu,
    );
  }

  @override
  int get hashCode =>
      documentID.hashCode ^
      appId.hashCode ^
      name.hashCode ^
      backgroundOverride.hashCode ^
      headerText.hashCode ^
      secondHeaderText.hashCode ^
      headerHeight.hashCode ^
      popupMenuBackgroundColor.hashCode ^
      headerBackgroundOverride.hashCode ^
      popupMenuBackgroundColorOverride.hashCode ^
      menu.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DrawerModel &&
          runtimeType == other.runtimeType &&
          documentID == other.documentID &&
          appId == other.appId &&
          name == other.name &&
          backgroundOverride == other.backgroundOverride &&
          headerText == other.headerText &&
          secondHeaderText == other.secondHeaderText &&
          headerHeight == other.headerHeight &&
          popupMenuBackgroundColor == other.popupMenuBackgroundColor &&
          headerBackgroundOverride == other.headerBackgroundOverride &&
          popupMenuBackgroundColorOverride ==
              other.popupMenuBackgroundColorOverride &&
          menu == other.menu;

  @override
  String toString() {
    return 'DrawerModel{documentID: $documentID, appId: $appId, name: $name, backgroundOverride: $backgroundOverride, headerText: $headerText, secondHeaderText: $secondHeaderText, headerHeight: $headerHeight, popupMenuBackgroundColor: $popupMenuBackgroundColor, headerBackgroundOverride: $headerBackgroundOverride, popupMenuBackgroundColorOverride: $popupMenuBackgroundColorOverride, menu: $menu}';
  }

  @override
  Future<List<ModelReference>> collectReferences({String? appId}) async {
    List<ModelReference> referencesCollector = [];
    if (menu != null) {
      referencesCollector.add(
          ModelReference(MenuDefModel.packageName, MenuDefModel.id, menu!));
    }
    if (backgroundOverride != null) {
      referencesCollector
          .addAll(await backgroundOverride!.collectReferences(appId: appId));
    }
    if (popupMenuBackgroundColor != null) {
      referencesCollector.addAll(
          await popupMenuBackgroundColor!.collectReferences(appId: appId));
    }
    if (headerBackgroundOverride != null) {
      referencesCollector.addAll(
          await headerBackgroundOverride!.collectReferences(appId: appId));
    }
    if (popupMenuBackgroundColorOverride != null) {
      referencesCollector.addAll(await popupMenuBackgroundColorOverride!
          .collectReferences(appId: appId));
    }
    if (menu != null) {
      referencesCollector.addAll(await menu!.collectReferences(appId: appId));
    }
    return referencesCollector;
  }

  @override
  DrawerEntity toEntity({String? appId}) {
    return DrawerEntity(
      appId: appId,
      name: (name != null) ? name : null,
      backgroundOverride: (backgroundOverride != null)
          ? backgroundOverride!.toEntity(appId: appId)
          : null,
      headerText: (headerText != null) ? headerText : null,
      secondHeaderText: (secondHeaderText != null) ? secondHeaderText : null,
      headerHeight: (headerHeight != null) ? headerHeight : null,
      popupMenuBackgroundColor: (popupMenuBackgroundColor != null)
          ? popupMenuBackgroundColor!.toEntity(appId: appId)
          : null,
      headerBackgroundOverride: (headerBackgroundOverride != null)
          ? headerBackgroundOverride!.toEntity(appId: appId)
          : null,
      popupMenuBackgroundColorOverride:
          (popupMenuBackgroundColorOverride != null)
              ? popupMenuBackgroundColorOverride!.toEntity(appId: appId)
              : null,
      menuId: (menu != null) ? menu!.documentID : null,
    );
  }

  static Future<DrawerModel?> fromEntity(
      String documentID, DrawerEntity? entity) async {
    if (entity == null) return null;
    return DrawerModel(
      documentID: documentID,
      appId: entity.appId ?? '',
      name: entity.name,
      backgroundOverride:
          await BackgroundModel.fromEntity(entity.backgroundOverride),
      headerText: entity.headerText,
      secondHeaderText: entity.secondHeaderText,
      headerHeight: entity.headerHeight,
      popupMenuBackgroundColor:
          await RgbModel.fromEntity(entity.popupMenuBackgroundColor),
      headerBackgroundOverride:
          await BackgroundModel.fromEntity(entity.headerBackgroundOverride),
      popupMenuBackgroundColorOverride:
          await RgbModel.fromEntity(entity.popupMenuBackgroundColorOverride),
    );
  }

  static Future<DrawerModel?> fromEntityPlus(
      String documentID, DrawerEntity? entity,
      {String? appId}) async {
    if (entity == null) return null;

    MenuDefModel? menuHolder;
    if (entity.menuId != null) {
      try {
        menuHolder = await menuDefRepository(appId: appId)!.get(entity.menuId);
      } on Exception catch (e) {
        print('Error whilst trying to initialise menu');
        print('Error whilst retrieving menuDef with id ${entity.menuId}');
        print('Exception: $e');
      }
    }

    return DrawerModel(
      documentID: documentID,
      appId: entity.appId ?? '',
      name: entity.name,
      backgroundOverride: await BackgroundModel.fromEntityPlus(
          entity.backgroundOverride,
          appId: appId),
      headerText: entity.headerText,
      secondHeaderText: entity.secondHeaderText,
      headerHeight: entity.headerHeight,
      popupMenuBackgroundColor: await RgbModel.fromEntityPlus(
          entity.popupMenuBackgroundColor,
          appId: appId),
      headerBackgroundOverride: await BackgroundModel.fromEntityPlus(
          entity.headerBackgroundOverride,
          appId: appId),
      popupMenuBackgroundColorOverride: await RgbModel.fromEntityPlus(
          entity.popupMenuBackgroundColorOverride,
          appId: appId),
      menu: menuHolder,
    );
  }
}
