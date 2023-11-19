import 'package:eliud_core_model/apis/action_api/action_entity.dart';
import 'package:eliud_core_model/apis/action_api/action_model.dart';
import 'package:eliud_core_model/model/app_model.dart';
import 'package:eliud_core_model/model/display_conditions_model.dart';

import 'package:eliud_core_model/tools/base/model_base.dart';

// ********************************** GotoPage **********************************

class GotoPage extends ActionModel {
  final String pageID;

  GotoPage(super.app, {super.conditions, required String pageID})
      : pageID = pageID.toLowerCase(),
        super(actionType: GotoPageEntity.label);

  @override
  ActionEntity toEntity({String? appId}) {
    return GotoPageEntity(app.documentID,
        conditions: (conditions != null) ? conditions!.toEntity() : null,
        pageID: pageID);
  }

  static Future<ActionModel> fromEntity(
      AppModel app, GotoPageEntity entity) async {
    if (entity.appID == null) throw Exception('entity GotoPage.appID is null');
    if (entity.pageID == null) {
      throw Exception('entity GotoPage.pageID is null');
    }

    return GotoPage(app,
        conditions: await DisplayConditionsModel.fromEntity(entity.conditions),
        pageID: entity.pageID!);
  }

  static Future<ActionModel> fromEntityPlus(
      AppModel app, GotoPageEntity entity) async {
    return fromEntity(app, entity);
  }

  @override
  String message() {
    return 'Switching page';
  }

  @override
  String describe() => 'Goto page $pageID';

  @override
  String toString() => describe();

  @override
  Future<List<ModelReference>> collectReferences({
    String? appId,
  }) async {
    return [];
  }

  @override
  ActionModel copyWith(AppModel newApp) =>
      GotoPage(newApp, conditions: conditions, pageID: pageID);
}
