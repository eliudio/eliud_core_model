/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 decoration_color_entity.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:collection';
import 'dart:convert';
import 'package:eliud_core_model/tools/base/entity_base.dart';
import 'package:eliud_core_model/model/entity_export.dart';

class DecorationColorEntity implements EntityBase {
  final RgbEntity? color;
  final double? stop;

  DecorationColorEntity({
    this.color,
    this.stop,
  });

  DecorationColorEntity copyWith({
    String? documentID,
    RgbEntity? color,
    double? stop,
  }) {
    return DecorationColorEntity(
      color: color ?? this.color,
      stop: stop ?? this.stop,
    );
  }

  List<Object?> get props => [
        color,
        stop,
      ];

  @override
  String toString() {
    return 'DecorationColorEntity{color: $color, stop: $stop}';
  }

  static DecorationColorEntity? fromMap(Object? o,
      {Map<String, String>? newDocumentIds}) {
    if (o == null) return null;
    var map = o as Map<String, dynamic>;

    var colorFromMap = map['color'];
    if (colorFromMap != null) {
      colorFromMap =
          RgbEntity.fromMap(colorFromMap, newDocumentIds: newDocumentIds);
    }

    return DecorationColorEntity(
      color: colorFromMap,
      stop: double.tryParse(map['stop'].toString()),
    );
  }

  @override
  Map<String, Object?> toDocument() {
    final Map<String, dynamic>? colorMap =
        color != null ? color!.toDocument() : null;

    Map<String, Object?> theDocument = HashMap();
    if (color != null) {
      theDocument["color"] = colorMap;
    } else {
      theDocument["color"] = null;
    }
    if (stop != null) {
      theDocument["stop"] = stop;
    } else {
      theDocument["stop"] = null;
    }
    return theDocument;
  }

  @override
  DecorationColorEntity switchAppId({required String newAppId}) {
    var newEntity = copyWith();
    return newEntity;
  }

  static DecorationColorEntity? fromJsonString(String json,
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
