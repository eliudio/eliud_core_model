import 'package:eliud_core_model/apis/action_api/action_entity.dart';
import 'package:eliud_core_model/apis/action_api/action_model.dart';
import 'package:eliud_core_model/apis/action_api/action_model_mapper.dart';
import 'package:eliud_core_model/apis_impl/action/switch_app.dart';
import 'package:eliud_core_model/model/app_model.dart';

class SwitchAppModelMapper implements ActionModelMapper {
  @override
  Future<ActionModel> fromEntity(AppModel app, ActionEntity entity) =>
      SwitchApp.fromEntity(app, entity as SwitchAppEntity);

  @override
  Future<ActionModel> fromEntityPlus(AppModel app, ActionEntity entity) =>
      SwitchApp.fromEntityPlus(app, entity as SwitchAppEntity);

  @override
  ActionEntity fromMap(Map map) => SwitchAppEntity.fromMap(map);
}
