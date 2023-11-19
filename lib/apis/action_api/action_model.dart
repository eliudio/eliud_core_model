import 'package:eliud_core_model/apis/apis.dart';
import 'package:eliud_core_model/model/app_model.dart';
import 'package:eliud_core_model/model/display_conditions_model.dart';
import 'package:eliud_core_model/tools/base/model_base.dart';
import 'package:eliud_core_model/tools/main_abstract_repository_singleton.dart';
import 'package:flutter/cupertino.dart';

import 'action_entity.dart';

abstract class ActionModel {
  final AppModel app;

  // Action only accessible conditionally.
  // Be careful: the underlying page / dialog can also have StorageConditions, which also apply
  DisplayConditionsModel? conditions;
  final String? actionType;

  ActionModel(this.app, {this.conditions, this.actionType});

  ActionEntity toEntity({String? appId});

  Future<List<ModelReference>> collectReferences({String? appId});

  static Future<ActionModel?> fromEntity(ActionEntity? entity) async {
    if (entity == null) return null;

    var mapper = Apis.apis().getActionModelApi().getMapper(entity.actionType);
    if (mapper != null) {
      var app = await appRepository()!.get(entity.appID);

      if (app != null) {
        return mapper.fromEntity(app, entity);
      } else {
        var appId = entity.appID;
        throw Exception("ActionModel.fromEntity App with id $appId not found");
      }
    }

    return null;
  }

  static Future<ActionModel?> fromEntityPlus(ActionEntity? entity,
      {String? appId}) async {
    if (entity == null) return null;

    var mapper = Apis.apis().getActionModelApi().getMapper(entity.actionType);
    if (mapper != null) {
      var appRepo = appRepository();
      if (appRepo != null) {
        var app = await appRepo.get(entity.appID);
        if (app != null) {
          return mapper.fromEntityPlus(app, entity);
        } else {
          var appId = entity.appID;
          throw Exception(
              "ActionModel.fromEntityPlus App with id $appId not found");
        }
      }
    }

    return null;
  }

  String message();

  Future<bool> hasAccess(BuildContext context) async {
    return Apis.apis().getCoreApi().hasAccess(context, this);
  }

  // used for the action to describe itself. A bit like toString but as a Widget
  String describe();

  ActionModel copyWith(AppModel newApp);
}
