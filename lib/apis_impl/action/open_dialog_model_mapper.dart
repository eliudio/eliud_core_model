import 'package:eliud_core_model/apis/action_api/action_entity.dart';
import 'package:eliud_core_model/apis/action_api/action_model.dart';
import 'package:eliud_core_model/apis/action_api/action_model_mapper.dart';
import 'package:eliud_core_model/model/app_model.dart';

import 'open_dialog.dart';

class OpenDialogModelMapper implements ActionModelMapper {
  @override
  Future<ActionModel> fromEntity(AppModel app, ActionEntity entity) =>
      OpenDialog.fromEntity(app, entity as OpenDialogEntity);

  @override
  Future<ActionModel> fromEntityPlus(AppModel app, ActionEntity entity) =>
      OpenDialog.fromEntityPlus(app, entity as OpenDialogEntity);

  @override
  ActionEntity fromMap(Map map) => OpenDialogEntity.fromMap(map);
}
