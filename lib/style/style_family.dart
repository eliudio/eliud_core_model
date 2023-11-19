import 'dart:async';

import 'package:eliud_core_model/model/app_model.dart';
import 'package:eliud_core_model/model/member_model.dart';
import 'package:eliud_core_model/style/style.dart';
import 'package:equatable/equatable.dart';

typedef StylesTrigger = Function(List<Style> list);
typedef CurrentStyleTrigger = Function();

abstract class StyleFamily extends Equatable {
  final String familyName;
  final bool canInsert;

  StyleFamily(this.familyName, this.canInsert);

  Style? getStyle(AppModel currentApp, String styleName);

  /*
   * Implement this methods in your style family to support inserts.
   * This will be used from for example when eliud_pkg_create StyleFamily::canInsert
   * is true and will be used in combination with Style::update(...)
   */
  Future<Style?> defaultNew(String appId, String newName) => Future.value(null);

  /*
   * Retrieve all styles supported by this family
   */
  StreamSubscription<dynamic>? listenToStyles(
      String appId, StylesTrigger stylesTrigger);

  /*
   * Subscribe for a change of the current style
   */
  void subscribeForChange(CurrentStyleTrigger currentStyleTrigger);

  /*
   * Delete style
   */
  Future<void> delete(AppModel app, Style style);

  /*
   * Update style
   */
  Future<void> update(AppModel app, Style style);

  /*
   * Create a new style
   */
  Future<Style> newStyle(AppModel app, String newName);

  /* inform the style family that there user switched to a new app and
   * hence need to prepare, ie. have styles in memory, ...
   */
  Future<void> addApp(MemberModel? currentMember, AppModel app);

  @override
  List<Object?> get props => [familyName, canInsert];

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StyleFamily &&
          runtimeType == other.runtimeType &&
          familyName == other.familyName &&
          canInsert == other.canInsert;

  @override
  int get hashCode => familyName.hashCode ^ canInsert.hashCode;
}
