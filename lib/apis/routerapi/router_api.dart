import 'package:flutter/cupertino.dart';
import '../action_api/action_model.dart';

abstract class RouterApi {
  static const String homeRoute = '/';
  static const String pageRoute = '/page';
  static const String messageRoute = '/message';
  static const String justASecond = '/justASecond';

  Future<void> navigateTo(BuildContext context, ActionModel action,
      {Map<String, dynamic>? parameters});
}
