/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 member_subscription_entity.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:collection';
import 'dart:convert';
import 'package:eliud_core_model/tools/base/entity_base.dart';

class MemberSubscriptionEntity implements EntityBase {
  final String? appId;

  MemberSubscriptionEntity({
    this.appId,
  });

  MemberSubscriptionEntity copyWith({
    String? documentID,
    String? appId,
  }) {
    return MemberSubscriptionEntity(
      appId: appId ?? this.appId,
    );
  }

  List<Object?> get props => [
        appId,
      ];

  @override
  String toString() {
    return 'MemberSubscriptionEntity{appId: $appId}';
  }

  static MemberSubscriptionEntity? fromMap(Object? o,
      {Map<String, String>? newDocumentIds}) {
    if (o == null) return null;
    var map = o as Map<String, dynamic>;

    return MemberSubscriptionEntity(
      appId: map['appId'],
    );
  }

  @override
  Map<String, Object?> toDocument() {
    Map<String, Object?> theDocument = HashMap();
    if (appId != null) {
      theDocument["appId"] = appId;
    } else {
      theDocument["appId"] = null;
    }
    return theDocument;
  }

  @override
  MemberSubscriptionEntity switchAppId({required String newAppId}) {
    var newEntity = copyWith();
    return newEntity;
  }

  static MemberSubscriptionEntity? fromJsonString(String json,
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
