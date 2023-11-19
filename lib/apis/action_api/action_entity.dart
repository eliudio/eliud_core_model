import 'package:eliud_core_model/apis/apis.dart';
import 'package:eliud_core_model/model/display_conditions_entity.dart';

abstract class ActionEntity {
  final String? appID;
  final String? actionType;

  final DisplayConditionsEntity? conditions;
/*
  final int readCondition;
  final int privilegeLevelRequired;
  final String packageCondition;
*/

  const ActionEntity(this.appID,
      {this.conditions,
      /*this.readCondition, this.privilegeLevelRequired, this.packageCondition, */ this.actionType});

  Map<String, Object?> toDocument();

  ActionEntity copyWith({String? appId});

  static ActionEntity fromMap(Map snap, {Map<String, String>? newDocumentIds}) {
    var actionType = snap['actionType'];
    if (actionType != null) {
      var mapper = Apis.apis().getActionModelApi().getMapper(actionType);
      if (mapper != null) {
        var fromSnap = Apis.apis()
            .getActionModelApi()
            .getMapper(actionType)!
            .fromMap(snap);
        if (fromSnap != null) {
          return fromSnap;
        } else {
          throw Exception("fromSnap is null");
        }
      } else {
        throw Exception("Mapper for $actionType is null");
      }
    } else {
      throw Exception("actionType is null");
    }
  }
}

class GotoPageEntity extends ActionEntity {
  static const String label = 'GotoPage';
  final String? pageID;

  const GotoPageEntity(super.appID, {super.conditions, this.pageID})
      : super(actionType: label);

  @override
  Map<String, Object?> toDocument() {
    return {
      'appID': appID,
      'actionType': actionType,
      'conditions': conditions == null ? null : conditions!.toDocument(),
      'pageID': pageID
    };
  }

  static ActionEntity fromMap(Map snap) {
    return GotoPageEntity(
      snap['appID'],
      conditions: DisplayConditionsEntity.fromMap(snap['conditions']),
      pageID: snap['pageID'],
    );
  }

  @override
  ActionEntity copyWith(
      {String? appId, DisplayConditionsEntity? conditions, String? pageID}) {
    return GotoPageEntity(appId ?? appID,
        conditions: conditions ?? this.conditions,
        pageID: pageID ?? this.pageID);
  }
}

class OpenDialogEntity extends ActionEntity {
  static const String label = 'Dialog';
  final String? dialogID;

  const OpenDialogEntity(super.appID, {super.conditions, this.dialogID})
      : super(actionType: label);

  @override
  Map<String, Object?> toDocument() {
    return {
      'appID': appID,
      'actionType': actionType,
      'conditions': conditions == null ? null : conditions!.toDocument(),
      'dialogID': dialogID
    };
  }

  static ActionEntity fromMap(Map snap) {
    return OpenDialogEntity(snap['appID'],
        conditions: DisplayConditionsEntity.fromMap(snap['conditions']),
        dialogID: snap['dialogID']);
  }

  @override
  ActionEntity copyWith(
      {String? appId, DisplayConditionsEntity? conditions, String? dialogID}) {
    return OpenDialogEntity(appId ?? appID,
        conditions: conditions ?? this.conditions,
        dialogID: dialogID ?? this.dialogID);
  }
}

class SwitchAppEntity extends ActionEntity {
  static const String label = 'SwitchApp';
  final String? toAppID;

  const SwitchAppEntity(super.appID, {super.conditions, this.toAppID})
      : super(actionType: label);

  @override
  Map<String, Object?> toDocument() {
    return {
      'appID': appID,
      'actionType': actionType,
      'conditions': conditions == null ? null : conditions!.toDocument(),
      'toAppID': toAppID,
    };
  }

  static ActionEntity fromMap(Map snap) {
    return SwitchAppEntity(snap['appID'],
        conditions: DisplayConditionsEntity.fromMap(snap['conditions']),
        toAppID: snap['toAppID']);
  }

  @override
  ActionEntity copyWith(
      {String? appId, DisplayConditionsEntity? conditions, String? toAppID}) {
    return SwitchAppEntity(appId ?? appID,
        conditions: conditions ?? this.conditions,
        toAppID: toAppID ?? this.toAppID);
  }
}

class PopupMenuEntity extends ActionEntity {
  static const String label = 'PopupMenu';
  final String? menuDefID;

  const PopupMenuEntity(super.appID, {super.conditions, this.menuDefID})
      : super(actionType: label);

  @override
  Map<String, Object?> toDocument() {
    return {
      'actionType': actionType,
      'appID': appID,
      'conditions': conditions == null ? null : conditions!.toDocument(),
      'menuDefID': menuDefID
    };
  }

  static ActionEntity fromMap(Map snap) {
    return PopupMenuEntity(snap['appID'],
        conditions: DisplayConditionsEntity.fromMap(snap['conditions']),
        menuDefID: snap['menuDefID']);
  }

  @override
  ActionEntity copyWith(
      {String? appId, DisplayConditionsEntity? conditions, String? menuDefID}) {
    return PopupMenuEntity(appId ?? appID,
        conditions: conditions ?? this.conditions,
        menuDefID: menuDefID ?? this.menuDefID);
  }
}

class InternalActionEntity extends ActionEntity {
  static const String label = 'InternalAction';
  final String? action;

  const InternalActionEntity(super.appID, {super.conditions, this.action})
      : super(actionType: label);

  @override
  Map<String, Object?> toDocument() {
    return {
      'actionType': actionType,
      'appID': appID,
      'conditions': conditions == null ? null : conditions!.toDocument(),
      'action': action
    };
  }

  static ActionEntity fromMap(Map snap) {
    return InternalActionEntity(snap['appID'],
        conditions: DisplayConditionsEntity.fromMap(snap['conditions']),
        action: snap['action']);
  }

  @override
  InternalActionEntity copyWith(
      {String? appId, DisplayConditionsEntity? conditions, String? action}) {
    return InternalActionEntity(appId ?? appID,
        conditions: conditions ?? this.conditions,
        action: action ?? this.action);
  }
}
