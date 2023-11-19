/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 member_subscription_model.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core_model/tools/base/model_base.dart';
import 'package:eliud_core_model/model/app_model.dart';

import 'package:eliud_core_model/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_core_model/model/model_export.dart';
import 'package:eliud_core_model/model/entity_export.dart';

import 'package:eliud_core_model/model/member_subscription_entity.dart';

class MemberSubscriptionModel implements ModelBase {
  static const String packageName = 'eliud_core_model';
  static const String id = 'memberSubscriptions';

  @override
  String documentID;
  AppModel? app;

  MemberSubscriptionModel({
    required this.documentID,
    this.app,
  });

  @override
  MemberSubscriptionModel copyWith({
    String? documentID,
    AppModel? app,
  }) {
    return MemberSubscriptionModel(
      documentID: documentID ?? this.documentID,
      app: app ?? this.app,
    );
  }

  @override
  int get hashCode => documentID.hashCode ^ app.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MemberSubscriptionModel &&
          runtimeType == other.runtimeType &&
          documentID == other.documentID &&
          app == other.app;

  @override
  String toString() {
    return 'MemberSubscriptionModel{documentID: $documentID, app: $app}';
  }

  @override
  Future<List<ModelReference>> collectReferences({String? appId}) async {
    List<ModelReference> referencesCollector = [];
    if (app != null) {
      referencesCollector
          .add(ModelReference(AppModel.packageName, AppModel.id, app!));
    }
    if (app != null) {
      referencesCollector.addAll(await app!.collectReferences(appId: appId));
    }
    return referencesCollector;
  }

  @override
  MemberSubscriptionEntity toEntity({String? appId}) {
    return MemberSubscriptionEntity(
      appId: (app != null) ? app!.documentID : null,
    );
  }

  static Future<MemberSubscriptionModel?> fromEntity(
      String documentID, MemberSubscriptionEntity? entity) async {
    if (entity == null) return null;
    return MemberSubscriptionModel(
      documentID: documentID,
    );
  }

  static Future<MemberSubscriptionModel?> fromEntityPlus(
      String documentID, MemberSubscriptionEntity? entity,
      {String? appId}) async {
    if (entity == null) return null;

    AppModel? appHolder;
    if (entity.appId != null) {
      try {
        appHolder = await appRepository(appId: appId)!.get(entity.appId);
      } on Exception catch (e) {
        print('Error whilst trying to initialise app');
        print('Error whilst retrieving app with id ${entity.appId}');
        print('Exception: $e');
      }
    }

    return MemberSubscriptionModel(
      documentID: documentID,
      app: appHolder,
    );
  }
}
