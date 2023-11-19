import 'dart:collection';
import 'package:eliud_core_model/apis/action_api/action_entity.dart';
import 'package:eliud_core_model/apis/action_api/action_model_mapper.dart';
import 'package:eliud_core_model/apis_impl/action/popup_menu_model_mapper.dart';
import 'package:eliud_core_model/apis_impl/action/switch_app_model_mapper.dart';

import 'goto_page_model_mapper.dart';
import 'internal_action_model_mapper.dart';
import 'open_dialog_model_mapper.dart';

class ActionModelRegistry {
  final Map<String, ActionModelMapper> mappers = HashMap();
  static ActionModelRegistry? _instance;

  ActionModelRegistry._internal() {
    // default mappers
    addMapper(GotoPageEntity.label, GotoPageModelMapper());
    addMapper(OpenDialogEntity.label, OpenDialogModelMapper());
    addMapper(SwitchAppEntity.label, SwitchAppModelMapper());
    addMapper(PopupMenuEntity.label, PopupMenuModelMapper());
    addMapper(InternalActionEntity.label, InternalActionModelMapper());
  }

  static ActionModelRegistry? registry() {
    _instance ??= ActionModelRegistry._internal();

    return _instance;
  }

  void addMapper(String actionType, ActionModelMapper mapper) {
    mappers[actionType] = mapper;
  }

  ActionModelMapper? getMapper(String? actionType) {
    return mappers[actionType!];
  }
}
