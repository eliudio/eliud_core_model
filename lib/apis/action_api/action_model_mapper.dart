import 'package:eliud_core_model/apis/action_api/action_entity.dart';
import 'package:eliud_core_model/apis/action_api/action_model.dart';
import 'package:eliud_core_model/model/app_model.dart';

abstract class ActionModelMapper {
  Future<ActionModel?> fromEntity(AppModel app, ActionEntity entity);
  Future<ActionModel?> fromEntityPlus(AppModel app, ActionEntity entity);
  ActionEntity? fromMap(Map snap);
}
