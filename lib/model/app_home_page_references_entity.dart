/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 app_home_page_references_entity.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:collection';
import 'dart:convert';
import 'package:eliud_core_helpers/base/entity_base.dart';

class AppHomePageReferencesEntity implements EntityBase {
  final String? homePageBlockedMember;
  final String? homePagePublic;
  final String? homePageSubscribedMember;
  final String? homePageLevel1Member;
  final String? homePageLevel2Member;
  final String? homePageOwner;

  AppHomePageReferencesEntity({
    this.homePageBlockedMember,
    this.homePagePublic,
    this.homePageSubscribedMember,
    this.homePageLevel1Member,
    this.homePageLevel2Member,
    this.homePageOwner,
  });

  AppHomePageReferencesEntity copyWith({
    String? homePageBlockedMember,
    String? homePagePublic,
    String? homePageSubscribedMember,
    String? homePageLevel1Member,
    String? homePageLevel2Member,
    String? homePageOwner,
  }) {
    return AppHomePageReferencesEntity(
      homePageBlockedMember:
          homePageBlockedMember ?? this.homePageBlockedMember,
      homePagePublic: homePagePublic ?? this.homePagePublic,
      homePageSubscribedMember:
          homePageSubscribedMember ?? this.homePageSubscribedMember,
      homePageLevel1Member: homePageLevel1Member ?? this.homePageLevel1Member,
      homePageLevel2Member: homePageLevel2Member ?? this.homePageLevel2Member,
      homePageOwner: homePageOwner ?? this.homePageOwner,
    );
  }

  List<Object?> get props => [
        homePageBlockedMember,
        homePagePublic,
        homePageSubscribedMember,
        homePageLevel1Member,
        homePageLevel2Member,
        homePageOwner,
      ];

  @override
  String toString() {
    return 'AppHomePageReferencesEntity{homePageBlockedMember: $homePageBlockedMember, homePagePublic: $homePagePublic, homePageSubscribedMember: $homePageSubscribedMember, homePageLevel1Member: $homePageLevel1Member, homePageLevel2Member: $homePageLevel2Member, homePageOwner: $homePageOwner}';
  }

  static AppHomePageReferencesEntity? fromMap(Object? o,
      {Map<String, String>? newDocumentIds}) {
    if (o == null) return null;
    var map = o as Map<String, dynamic>;

    return AppHomePageReferencesEntity(
      homePageBlockedMember: map['homePageBlockedMember'],
      homePagePublic: map['homePagePublic'],
      homePageSubscribedMember: map['homePageSubscribedMember'],
      homePageLevel1Member: map['homePageLevel1Member'],
      homePageLevel2Member: map['homePageLevel2Member'],
      homePageOwner: map['homePageOwner'],
    );
  }

  @override
  Map<String, Object?> toDocument() {
    Map<String, Object?> theDocument = HashMap();
    if (homePageBlockedMember != null) {
      theDocument["homePageBlockedMember"] = homePageBlockedMember;
    } else {
      theDocument["homePageBlockedMember"] = null;
    }
    if (homePagePublic != null) {
      theDocument["homePagePublic"] = homePagePublic;
    } else {
      theDocument["homePagePublic"] = null;
    }
    if (homePageSubscribedMember != null) {
      theDocument["homePageSubscribedMember"] = homePageSubscribedMember;
    } else {
      theDocument["homePageSubscribedMember"] = null;
    }
    if (homePageLevel1Member != null) {
      theDocument["homePageLevel1Member"] = homePageLevel1Member;
    } else {
      theDocument["homePageLevel1Member"] = null;
    }
    if (homePageLevel2Member != null) {
      theDocument["homePageLevel2Member"] = homePageLevel2Member;
    } else {
      theDocument["homePageLevel2Member"] = null;
    }
    if (homePageOwner != null) {
      theDocument["homePageOwner"] = homePageOwner;
    } else {
      theDocument["homePageOwner"] = null;
    }
    return theDocument;
  }

  @override
  AppHomePageReferencesEntity switchAppId({required String newAppId}) {
    var newEntity = copyWith();
    return newEntity;
  }

  static AppHomePageReferencesEntity? fromJsonString(String json,
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
