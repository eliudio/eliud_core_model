/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 backend_request_entity.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:collection';
import 'dart:convert';
import 'package:eliud_core_model/tools/base/entity_base.dart';

class BackendRequestEntity implements EntityBase {
  final String? description;
  final String? appId;
  final String? authorId;
  final String? name;
  final String? sendTo;
  final List<Map<String, String>>? collections;
  final bool? processed;
  final int? requestType;

  BackendRequestEntity({
    this.description,
    required this.appId,
    this.authorId,
    this.name,
    this.sendTo,
    this.collections,
    this.processed,
    this.requestType,
  });

  BackendRequestEntity copyWith({
    String? documentID,
    String? description,
    String? appId,
    String? authorId,
    String? name,
    String? sendTo,
    List<Map<String, String>>? collections,
    bool? processed,
    int? requestType,
  }) {
    return BackendRequestEntity(
      description: description ?? this.description,
      appId: appId ?? this.appId,
      authorId: authorId ?? this.authorId,
      name: name ?? this.name,
      sendTo: sendTo ?? this.sendTo,
      collections: collections ?? this.collections,
      processed: processed ?? this.processed,
      requestType: requestType ?? this.requestType,
    );
  }

  List<Object?> get props => [
        description,
        appId,
        authorId,
        name,
        sendTo,
        collections,
        processed,
        requestType,
      ];

  @override
  String toString() {
    return 'BackendRequestEntity{description: $description, appId: $appId, authorId: $authorId, name: $name, sendTo: $sendTo, collections: $collections, processed: $processed, requestType: $requestType}';
  }

  static BackendRequestEntity? fromMap(Object? o,
      {Map<String, String>? newDocumentIds}) {
    if (o == null) return null;
    var map = o as Map<String, dynamic>;

    var collectionsFromMap = map['collections'];
    if (collectionsFromMap != null) {
      collectionsFromMap = map['collections'];
    }
    return BackendRequestEntity(
      description: map['description'],
      appId: map['appId'],
      authorId: map['authorId'],
      name: map['name'],
      sendTo: map['sendTo'],
      collections: collectionsFromMap,
      processed: map['processed'],
      requestType: map['requestType'],
    );
  }

  @override
  Map<String, Object?> toDocument() {
    Map<String, Object?> theDocument = HashMap();
    if (description != null) {
      theDocument["description"] = description;
    } else {
      theDocument["description"] = null;
    }
    if (appId != null) {
      theDocument["appId"] = appId;
    } else {
      theDocument["appId"] = null;
    }
    if (authorId != null) {
      theDocument["authorId"] = authorId;
    } else {
      theDocument["authorId"] = null;
    }
    if (name != null) {
      theDocument["name"] = name;
    } else {
      theDocument["name"] = null;
    }
    if (sendTo != null) {
      theDocument["sendTo"] = sendTo;
    } else {
      theDocument["sendTo"] = null;
    }
    theDocument['collections'] = collections;

    if (processed != null) {
      theDocument["processed"] = processed;
    } else {
      theDocument["processed"] = null;
    }
    if (requestType != null) {
      theDocument["requestType"] = requestType;
    } else {
      theDocument["requestType"] = null;
    }
    return theDocument;
  }

  @override
  BackendRequestEntity switchAppId({required String newAppId}) {
    var newEntity = copyWith(appId: newAppId);
    return newEntity;
  }

  static BackendRequestEntity? fromJsonString(String json,
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
