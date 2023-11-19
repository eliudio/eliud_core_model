/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 public_medium_model.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core_model/tools/base/model_base.dart';

import 'package:eliud_core_model/model/abstract_repository_singleton.dart';
import 'package:eliud_core_model/model/entity_export.dart';

import 'package:eliud_core_model/model/public_medium_entity.dart';

import 'package:eliud_core_model/tools/helpers/medium_collect_references.dart';

enum PublicMediumType { photo, video, pdf, text, unknown }

PublicMediumType toPublicMediumType(int? index) {
  switch (index) {
    case 0:
      return PublicMediumType.photo;
    case 1:
      return PublicMediumType.video;
    case 2:
      return PublicMediumType.pdf;
    case 3:
      return PublicMediumType.text;
  }
  return PublicMediumType.unknown;
}

class PublicMediumModel implements ModelBase {
  static const String packageName = 'eliud_core_model';
  static const String id = 'publicMediums';

  @override
  String documentID;
  String authorId;
  String? base;
  String? ext;
  String? url;
  String? ref;
  String? urlThumbnail;
  String? refThumbnail;
  PublicMediumType? mediumType;
  int? mediumWidth;
  int? mediumHeight;
  int? thumbnailWidth;
  int? thumbnailHeight;

  // In case a medium has multiple related media, then we refer to the related media with this field. For example, for a pdf, we store images of all pages. These are referenced using a chain of these references.
  String? relatedMediumId;

  PublicMediumModel({
    required this.documentID,
    required this.authorId,
    this.base,
    this.ext,
    this.url,
    this.ref,
    this.urlThumbnail,
    this.refThumbnail,
    this.mediumType,
    this.mediumWidth,
    this.mediumHeight,
    this.thumbnailWidth,
    this.thumbnailHeight,
    this.relatedMediumId,
  });

  @override
  PublicMediumModel copyWith({
    String? documentID,
    String? authorId,
    String? base,
    String? ext,
    String? url,
    String? ref,
    String? urlThumbnail,
    String? refThumbnail,
    PublicMediumType? mediumType,
    int? mediumWidth,
    int? mediumHeight,
    int? thumbnailWidth,
    int? thumbnailHeight,
    String? relatedMediumId,
  }) {
    return PublicMediumModel(
      documentID: documentID ?? this.documentID,
      authorId: authorId ?? this.authorId,
      base: base ?? this.base,
      ext: ext ?? this.ext,
      url: url ?? this.url,
      ref: ref ?? this.ref,
      urlThumbnail: urlThumbnail ?? this.urlThumbnail,
      refThumbnail: refThumbnail ?? this.refThumbnail,
      mediumType: mediumType ?? this.mediumType,
      mediumWidth: mediumWidth ?? this.mediumWidth,
      mediumHeight: mediumHeight ?? this.mediumHeight,
      thumbnailWidth: thumbnailWidth ?? this.thumbnailWidth,
      thumbnailHeight: thumbnailHeight ?? this.thumbnailHeight,
      relatedMediumId: relatedMediumId ?? this.relatedMediumId,
    );
  }

  @override
  int get hashCode =>
      documentID.hashCode ^
      authorId.hashCode ^
      base.hashCode ^
      ext.hashCode ^
      url.hashCode ^
      ref.hashCode ^
      urlThumbnail.hashCode ^
      refThumbnail.hashCode ^
      mediumType.hashCode ^
      mediumWidth.hashCode ^
      mediumHeight.hashCode ^
      thumbnailWidth.hashCode ^
      thumbnailHeight.hashCode ^
      relatedMediumId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PublicMediumModel &&
          runtimeType == other.runtimeType &&
          documentID == other.documentID &&
          authorId == other.authorId &&
          base == other.base &&
          ext == other.ext &&
          url == other.url &&
          ref == other.ref &&
          urlThumbnail == other.urlThumbnail &&
          refThumbnail == other.refThumbnail &&
          mediumType == other.mediumType &&
          mediumWidth == other.mediumWidth &&
          mediumHeight == other.mediumHeight &&
          thumbnailWidth == other.thumbnailWidth &&
          thumbnailHeight == other.thumbnailHeight &&
          relatedMediumId == other.relatedMediumId;

  @override
  String toString() {
    return 'PublicMediumModel{documentID: $documentID, authorId: $authorId, base: $base, ext: $ext, url: $url, ref: $ref, urlThumbnail: $urlThumbnail, refThumbnail: $refThumbnail, mediumType: $mediumType, mediumWidth: $mediumWidth, mediumHeight: $mediumHeight, thumbnailWidth: $thumbnailWidth, thumbnailHeight: $thumbnailHeight, relatedMediumId: $relatedMediumId}';
  }

  @override
  Future<List<ModelReference>> collectReferences({String? appId}) async {
    List<ModelReference> referencesCollector = [];
    referencesCollector.addAll(await mediumCollectReferences(
        appId: appId,
        relatedMediumId: relatedMediumId,
        repo: publicMediumRepository(appId: appId)!,
        packageName: packageName,
        id: id));
    return referencesCollector;
  }

  @override
  PublicMediumEntity toEntity({String? appId}) {
    return PublicMediumEntity(
      authorId: authorId,
      base: (base != null) ? base : null,
      ext: (ext != null) ? ext : null,
      url: (url != null) ? url : null,
      ref: (ref != null) ? ref : null,
      urlThumbnail: (urlThumbnail != null) ? urlThumbnail : null,
      refThumbnail: (refThumbnail != null) ? refThumbnail : null,
      mediumType: (mediumType != null) ? mediumType!.index : null,
      mediumWidth: (mediumWidth != null) ? mediumWidth : null,
      mediumHeight: (mediumHeight != null) ? mediumHeight : null,
      thumbnailWidth: (thumbnailWidth != null) ? thumbnailWidth : null,
      thumbnailHeight: (thumbnailHeight != null) ? thumbnailHeight : null,
      relatedMediumId: (relatedMediumId != null) ? relatedMediumId : null,
    );
  }

  static Future<PublicMediumModel?> fromEntity(
      String documentID, PublicMediumEntity? entity) async {
    if (entity == null) return null;
    return PublicMediumModel(
      documentID: documentID,
      authorId: entity.authorId ?? '',
      base: entity.base,
      ext: entity.ext,
      url: entity.url,
      ref: entity.ref,
      urlThumbnail: entity.urlThumbnail,
      refThumbnail: entity.refThumbnail,
      mediumType: toPublicMediumType(entity.mediumType),
      mediumWidth: entity.mediumWidth,
      mediumHeight: entity.mediumHeight,
      thumbnailWidth: entity.thumbnailWidth,
      thumbnailHeight: entity.thumbnailHeight,
      relatedMediumId: entity.relatedMediumId,
    );
  }

  static Future<PublicMediumModel?> fromEntityPlus(
      String documentID, PublicMediumEntity? entity,
      {String? appId}) async {
    if (entity == null) return null;

    return PublicMediumModel(
      documentID: documentID,
      authorId: entity.authorId ?? '',
      base: entity.base,
      ext: entity.ext,
      url: entity.url,
      ref: entity.ref,
      urlThumbnail: entity.urlThumbnail,
      refThumbnail: entity.refThumbnail,
      mediumType: toPublicMediumType(entity.mediumType),
      mediumWidth: entity.mediumWidth,
      mediumHeight: entity.mediumHeight,
      thumbnailWidth: entity.thumbnailWidth,
      thumbnailHeight: entity.thumbnailHeight,
      relatedMediumId: entity.relatedMediumId,
    );
  }
}
