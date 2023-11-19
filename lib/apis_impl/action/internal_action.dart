import 'package:eliud_core_model/apis/action_api/action_entity.dart';
import 'package:eliud_core_model/apis/action_api/action_model.dart';
import 'package:eliud_core_model/model/app_model.dart';
import 'package:eliud_core_model/model/display_conditions_model.dart';
import 'package:eliud_core_model/tools/base/model_base.dart';

// ********************************** InternalAction **********************************

/*
 * LoginLogout = Login when logged out, Logout when logged in.
 * OtherApps = Allows to specify that n internal action is to switch to other apps where this user has been registered before. It will translate into a specific SwitchApp action
 */
enum InternalActionEnum { login, logout, goHome, otherApps, unknown }

class InternalAction extends ActionModel {
  final InternalActionEnum? internalActionEnum;

  InternalAction(super.app, {super.conditions, this.internalActionEnum})
      : super(actionType: InternalActionEntity.label);

  @override
  ActionEntity toEntity({String? appId}) {
    return InternalActionEntity(appId,
        conditions: (conditions != null) ? conditions!.toEntity() : null,
        action: internalActionEnum.toString());
  }

  @override
  Future<List<ModelReference>> collectReferences({
    String? appId,
  }) async {
    return [];
  }

  static Future<ActionModel> fromEntity(
      AppModel app, InternalActionEntity entity) async {
    var internalAction = entity.action;
    if (entity.appID == null) {
      throw Exception('entity InternalAction.appID is null');
    }
    if (internalAction != null) {
      if (internalAction.toLowerCase() ==
          InternalActionEnum.login.toString().toLowerCase()) {
        return InternalAction(app,
            internalActionEnum: InternalActionEnum.login);
      }
      if (internalAction.toLowerCase() ==
          InternalActionEnum.logout.toString().toLowerCase()) {
        return InternalAction(app,
            internalActionEnum: InternalActionEnum.logout);
      }
      if (internalAction.toLowerCase() ==
          InternalActionEnum.goHome.toString().toLowerCase()) {
        return InternalAction(app,
            internalActionEnum: InternalActionEnum.goHome);
      }
      if (internalAction.toLowerCase() ==
          InternalActionEnum.otherApps.toString().toLowerCase()) {
        return InternalAction(app,
            internalActionEnum: InternalActionEnum.otherApps);
      }
    }
    return InternalAction(app,
        conditions: await DisplayConditionsModel.fromEntity(entity.conditions),
        internalActionEnum: InternalActionEnum.unknown);
  }

  static Future<ActionModel> fromEntityPlus(
      AppModel app, InternalActionEntity entity) async {
    return fromEntity(app, entity);
  }

  static String unknownMsg = "What's happening?";

  @override
  String message() {
    switch (internalActionEnum) {
      case InternalActionEnum.login:
        return 'Logging in';
      case InternalActionEnum.logout:
        return 'Logging out';
      case InternalActionEnum.goHome:
        return 'Go Home';
      case InternalActionEnum.otherApps:
        return 'Other apps';
      case InternalActionEnum.unknown:
        return unknownMsg;
      case null:
        break;
    }
    return unknownMsg;
  }

  @override
  String describe() {
    switch (internalActionEnum) {
      case InternalActionEnum.login:
        return 'Login';
      case InternalActionEnum.logout:
        return 'Logout';
      case InternalActionEnum.goHome:
        return 'Go Home';
      case InternalActionEnum.otherApps:
        return 'Other apps';
      case InternalActionEnum.unknown:
        break;
      case null:
        break;
    }
    return '?';
  }

  @override
  ActionModel copyWith(AppModel newApp) => InternalAction(newApp,
      conditions: conditions, internalActionEnum: internalActionEnum);
}
