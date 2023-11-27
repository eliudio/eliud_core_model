/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 app_home_page_references_model.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core_helpers/base/model_base.dart';

import 'package:eliud_core_model/model/entity_export.dart';

import 'package:eliud_core_model/model/app_home_page_references_entity.dart';

class AppHomePageReferencesModel {
  static const String packageName = 'eliud_core_model';
  static const String id = 'appHomePageReferencess';

  // Entry page for blocked member
  String? homePageBlockedMember;

  // Entry page for public
  String? homePagePublic;

  // Entry page for subscribed member, i.e. for a person logged in but without privileges
  String? homePageSubscribedMember;

  // Entry page for level 1 privileged member
  String? homePageLevel1Member;

  // Entry page for level 2 privileged member
  String? homePageLevel2Member;

  // Entry page for the owner
  String? homePageOwner;

  AppHomePageReferencesModel({
    this.homePageBlockedMember,
    this.homePagePublic,
    this.homePageSubscribedMember,
    this.homePageLevel1Member,
    this.homePageLevel2Member,
    this.homePageOwner,
  });

  AppHomePageReferencesModel copyWith({
    String? homePageBlockedMember,
    String? homePagePublic,
    String? homePageSubscribedMember,
    String? homePageLevel1Member,
    String? homePageLevel2Member,
    String? homePageOwner,
  }) {
    return AppHomePageReferencesModel(
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

  @override
  int get hashCode =>
      homePageBlockedMember.hashCode ^
      homePagePublic.hashCode ^
      homePageSubscribedMember.hashCode ^
      homePageLevel1Member.hashCode ^
      homePageLevel2Member.hashCode ^
      homePageOwner.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppHomePageReferencesModel &&
          runtimeType == other.runtimeType &&
          homePageBlockedMember == other.homePageBlockedMember &&
          homePagePublic == other.homePagePublic &&
          homePageSubscribedMember == other.homePageSubscribedMember &&
          homePageLevel1Member == other.homePageLevel1Member &&
          homePageLevel2Member == other.homePageLevel2Member &&
          homePageOwner == other.homePageOwner;

  @override
  String toString() {
    return 'AppHomePageReferencesModel{homePageBlockedMember: $homePageBlockedMember, homePagePublic: $homePagePublic, homePageSubscribedMember: $homePageSubscribedMember, homePageLevel1Member: $homePageLevel1Member, homePageLevel2Member: $homePageLevel2Member, homePageOwner: $homePageOwner}';
  }

  Future<List<ModelReference>> collectReferences({String? appId}) async {
    List<ModelReference> referencesCollector = [];
    return referencesCollector;
  }

  AppHomePageReferencesEntity toEntity({String? appId}) {
    return AppHomePageReferencesEntity(
      homePageBlockedMember:
          (homePageBlockedMember != null) ? homePageBlockedMember : null,
      homePagePublic: (homePagePublic != null) ? homePagePublic : null,
      homePageSubscribedMember:
          (homePageSubscribedMember != null) ? homePageSubscribedMember : null,
      homePageLevel1Member:
          (homePageLevel1Member != null) ? homePageLevel1Member : null,
      homePageLevel2Member:
          (homePageLevel2Member != null) ? homePageLevel2Member : null,
      homePageOwner: (homePageOwner != null) ? homePageOwner : null,
    );
  }

  static Future<AppHomePageReferencesModel?> fromEntity(
      AppHomePageReferencesEntity? entity) async {
    if (entity == null) return null;
    return AppHomePageReferencesModel(
      homePageBlockedMember: entity.homePageBlockedMember,
      homePagePublic: entity.homePagePublic,
      homePageSubscribedMember: entity.homePageSubscribedMember,
      homePageLevel1Member: entity.homePageLevel1Member,
      homePageLevel2Member: entity.homePageLevel2Member,
      homePageOwner: entity.homePageOwner,
    );
  }

  static Future<AppHomePageReferencesModel?> fromEntityPlus(
      AppHomePageReferencesEntity? entity,
      {String? appId}) async {
    if (entity == null) return null;

    return AppHomePageReferencesModel(
      homePageBlockedMember: entity.homePageBlockedMember,
      homePagePublic: entity.homePagePublic,
      homePageSubscribedMember: entity.homePageSubscribedMember,
      homePageLevel1Member: entity.homePageLevel1Member,
      homePageLevel2Member: entity.homePageLevel2Member,
      homePageOwner: entity.homePageOwner,
    );
  }
}
