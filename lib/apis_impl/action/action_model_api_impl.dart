import 'package:eliud_core_model/apis/action_api/action_model.dart';
import 'package:eliud_core_model/apis/action_api/action_model_api.dart';
import 'package:eliud_core_model/apis/action_api/action_model_mapper.dart';

import 'action_model_registry.dart';

typedef SetActionValue = Function(ActionModel value);

class ActionModelApiImpl extends ActionModelApi {
  @override
  void addMapper(String actionType, ActionModelMapper mapper) {
    ActionModelRegistry.registry()!.addMapper(actionType, mapper);
  }

  @override
  ActionModelMapper? getMapper(String? actionType) {
    return ActionModelRegistry.registry()!.getMapper(actionType);
  }
}
