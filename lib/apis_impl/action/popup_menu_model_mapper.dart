import 'package:eliud_core_model/apis/action_api/action_entity.dart';
import 'package:eliud_core_model/apis/action_api/action_model.dart';
import 'package:eliud_core_model/apis/action_api/action_model_mapper.dart';
import 'package:eliud_core_model/apis_impl/action/popup_menu.dart';
import 'package:eliud_core_model/model/app_model.dart';

class PopupMenuModelMapper implements ActionModelMapper {
  @override
  Future<ActionModel> fromEntity(AppModel app, ActionEntity entity) =>
      PopupMenu.fromEntity(app, entity as PopupMenuEntity);

  @override
  Future<ActionModel?> fromEntityPlus(AppModel app, ActionEntity entity) =>
      PopupMenu.fromEntityPlus(app, entity as PopupMenuEntity);

  @override
  ActionEntity fromMap(Map map) => PopupMenuEntity.fromMap(map);
}
