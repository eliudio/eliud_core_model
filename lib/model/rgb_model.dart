/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 rgb_model.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core_model/tools/base/model_base.dart';

import 'package:eliud_core_model/model/entity_export.dart';

import 'package:eliud_core_model/model/rgb_entity.dart';

class RgbModel {
  static const String packageName = 'eliud_core_model';
  static const String id = 'rgbs';

  // r is red, from 0 to 255. An out of range value is brought into range using modulo 255.
  int? r;

  // g is green, from 0 to 255. An out of range value is brought into range using modulo 255.
  int? g;

  // b is blue, from 0 to 255. An out of range value is brought into range using modulo 255.
  int? b;

  // opacity is alpha channel of this color as a double, with 0.0 being transparent and 1.0 being fully opaque.
  double? opacity;

  RgbModel({
    this.r,
    this.g,
    this.b,
    this.opacity,
  });

  RgbModel copyWith({
    int? r,
    int? g,
    int? b,
    double? opacity,
  }) {
    return RgbModel(
      r: r ?? this.r,
      g: g ?? this.g,
      b: b ?? this.b,
      opacity: opacity ?? this.opacity,
    );
  }

  @override
  int get hashCode => r.hashCode ^ g.hashCode ^ b.hashCode ^ opacity.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RgbModel &&
          runtimeType == other.runtimeType &&
          r == other.r &&
          g == other.g &&
          b == other.b &&
          opacity == other.opacity;

  @override
  String toString() {
    return 'RgbModel{r: $r, g: $g, b: $b, opacity: $opacity}';
  }

  Future<List<ModelReference>> collectReferences({String? appId}) async {
    List<ModelReference> referencesCollector = [];
    return referencesCollector;
  }

  RgbEntity toEntity({String? appId}) {
    return RgbEntity(
      r: (r != null) ? r : null,
      g: (g != null) ? g : null,
      b: (b != null) ? b : null,
      opacity: (opacity != null) ? opacity : null,
    );
  }

  static Future<RgbModel?> fromEntity(RgbEntity? entity) async {
    if (entity == null) return null;
    return RgbModel(
      r: entity.r,
      g: entity.g,
      b: entity.b,
      opacity: entity.opacity,
    );
  }

  static Future<RgbModel?> fromEntityPlus(RgbEntity? entity,
      {String? appId}) async {
    if (entity == null) return null;

    return RgbModel(
      r: entity.r,
      g: entity.g,
      b: entity.b,
      opacity: entity.opacity,
    );
  }
}
