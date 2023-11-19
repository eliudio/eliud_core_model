import 'package:eliud_core_model/apis/action_api/action_entity.dart';
import 'package:eliud_core_model/apis/action_api/action_model.dart';
import 'package:eliud_core_model/apis/action_api/action_model_mapper.dart';
import 'package:eliud_core_model/model/app_model.dart';

import 'internal_action.dart';

class InternalActionModelMapper implements ActionModelMapper {
  @override
  Future<ActionModel> fromEntity(AppModel app, ActionEntity entity) =>
      InternalAction.fromEntity(app, entity as InternalActionEntity);

  @override
  Future<ActionModel> fromEntityPlus(AppModel app, ActionEntity entity) =>
      InternalAction.fromEntityPlus(app, entity as InternalActionEntity);

  @override
  ActionEntity fromMap(Map map) => InternalActionEntity.fromMap(map);
}
