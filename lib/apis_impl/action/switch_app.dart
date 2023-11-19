import 'package:eliud_core_model/apis/action_api/action_entity.dart';
import 'package:eliud_core_model/apis/action_api/action_model.dart';
import 'package:eliud_core_model/model/app_model.dart';
import 'package:eliud_core_model/model/display_conditions_model.dart';
import 'package:eliud_core_model/tools/base/model_base.dart';

// ********************************** SwitchApp **********************************

class SwitchApp extends ActionModel {
  final String toAppID;

  SwitchApp(super.app, {super.conditions, required this.toAppID})
      : super(actionType: SwitchAppEntity.label);

  @override
  ActionEntity toEntity({String? appId}) {
    return SwitchAppEntity(appId,
        conditions: (conditions != null) ? conditions!.toEntity() : null,
        toAppID: toAppID);
  }

  @override
  Future<List<ModelReference>> collectReferences({
    String? appId,
  }) async {
    return [];
  }

  static Future<ActionModel> fromEntity(
      AppModel app, SwitchAppEntity entity) async {
    if (entity.appID == null) throw Exception('entity SwitchApp.appID is null');
    if (entity.toAppID == null) {
      throw Exception('entity SwitchApp.toAppID is null');
    }
    return SwitchApp(app,
        conditions: await DisplayConditionsModel.fromEntity(entity.conditions),
        toAppID: entity.toAppID!);
  }

  static Future<ActionModel> fromEntityPlus(
      AppModel app, SwitchAppEntity entity) async {
    return fromEntity(app, entity);
  }

  static String msg = 'Switching app';

  @override
  String message() {
    return msg;
  }

  @override
  String describe() => 'Switch to app $toAppID';

  @override
  ActionModel copyWith(AppModel newApp) =>
      SwitchApp(newApp, conditions: conditions, toAppID: toAppID);
}
