/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 decoration_color_model.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core_model/tools/base/model_base.dart';

import 'package:eliud_core_model/model/model_export.dart';
import 'package:eliud_core_model/model/entity_export.dart';

import 'package:eliud_core_model/model/decoration_color_entity.dart';

class DecorationColorModel implements ModelBase {
  static const String packageName = 'eliud_core_model';
  static const String id = 'decorationColors';

  @override
  String documentID;
  RgbModel? color;
  double? stop;

  DecorationColorModel({
    required this.documentID,
    this.color,
    this.stop,
  });

  @override
  DecorationColorModel copyWith({
    String? documentID,
    RgbModel? color,
    double? stop,
  }) {
    return DecorationColorModel(
      documentID: documentID ?? this.documentID,
      color: color ?? this.color,
      stop: stop ?? this.stop,
    );
  }

  @override
  int get hashCode => documentID.hashCode ^ color.hashCode ^ stop.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DecorationColorModel &&
          runtimeType == other.runtimeType &&
          documentID == other.documentID &&
          color == other.color &&
          stop == other.stop;

  @override
  String toString() {
    return 'DecorationColorModel{documentID: $documentID, color: $color, stop: $stop}';
  }

  @override
  Future<List<ModelReference>> collectReferences({String? appId}) async {
    List<ModelReference> referencesCollector = [];
    if (color != null) {
      referencesCollector.addAll(await color!.collectReferences(appId: appId));
    }
    return referencesCollector;
  }

  @override
  DecorationColorEntity toEntity({String? appId}) {
    return DecorationColorEntity(
      color: (color != null) ? color!.toEntity(appId: appId) : null,
      stop: (stop != null) ? stop : null,
    );
  }

  static Future<DecorationColorModel?> fromEntity(
      String documentID, DecorationColorEntity? entity) async {
    if (entity == null) return null;
    return DecorationColorModel(
      documentID: documentID,
      color: await RgbModel.fromEntity(entity.color),
      stop: entity.stop,
    );
  }

  static Future<DecorationColorModel?> fromEntityPlus(
      String documentID, DecorationColorEntity? entity,
      {String? appId}) async {
    if (entity == null) return null;

    return DecorationColorModel(
      documentID: documentID,
      color: await RgbModel.fromEntityPlus(entity.color, appId: appId),
      stop: entity.stop,
    );
  }
}
