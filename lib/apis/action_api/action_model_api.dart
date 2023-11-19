import 'action_model_mapper.dart';

abstract class ActionModelApi {
  void addMapper(String actionType, ActionModelMapper mapper);
  ActionModelMapper? getMapper(String? actionType);
}
