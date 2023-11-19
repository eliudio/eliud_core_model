import 'package:eliud_core_model/apis/action_api/action_entity.dart';
import 'package:eliud_core_model/apis/action_api/action_model.dart';
import 'package:eliud_core_model/model/app_model.dart';
import 'package:eliud_core_model/model/display_conditions_model.dart';

import 'package:eliud_core_model/tools/base/model_base.dart';

// ********************************** OpenDialog **********************************

class OpenDialog extends ActionModel {
  final String dialogID;

  OpenDialog(super.app, {super.conditions, required String dialogID})
      : dialogID = dialogID.toLowerCase(),
        super(actionType: OpenDialogEntity.label);

  @override
  ActionEntity toEntity({String? appId}) {
    return OpenDialogEntity(appId,
        conditions: (conditions != null) ? conditions!.toEntity() : null,
        dialogID: dialogID);
  }

  @override
  Future<List<ModelReference>> collectReferences({
    String? appId,
  }) async {
    return [];
  }

  static Future<ActionModel> fromEntity(
      AppModel app, OpenDialogEntity entity) async {
    if (entity.appID == null) {
      throw Exception('entity OpenDialog.appID is null');
    }
    if (entity.dialogID == null) {
      throw Exception('entity OpenDialog.dialogID is null');
    }
    return OpenDialog(app,
        conditions: await DisplayConditionsModel.fromEntity(entity.conditions),
        dialogID: entity.dialogID!);
  }

  static Future<ActionModel> fromEntityPlus(
      AppModel app, OpenDialogEntity entity) async {
    return fromEntity(app, entity);
  }

  @override
  String message() {
    return 'Open Dialog';
  }

  @override
  String describe() => 'Open dialog $dialogID';

  @override
  String toString() => describe();

  @override
  ActionModel copyWith(AppModel newApp) =>
      OpenDialog(newApp, conditions: conditions, dialogID: dialogID);
}
