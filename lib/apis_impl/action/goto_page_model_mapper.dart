import 'package:eliud_core_model/apis/action_api/action_entity.dart';
import 'package:eliud_core_model/apis/action_api/action_model.dart';
import 'package:eliud_core_model/apis/action_api/action_model_mapper.dart';
import 'package:eliud_core_model/model/app_model.dart';
import 'goto_page.dart';

class GotoPageModelMapper implements ActionModelMapper {
  @override
  Future<ActionModel> fromEntity(AppModel app, ActionEntity entity) =>
      GotoPage.fromEntity(app, entity as GotoPageEntity);

  @override
  Future<ActionModel> fromEntityPlus(AppModel app, ActionEntity entity) =>
      GotoPage.fromEntityPlus(app, entity as GotoPageEntity);

  @override
  ActionEntity fromMap(Map map) => GotoPageEntity.fromMap(map);
}
