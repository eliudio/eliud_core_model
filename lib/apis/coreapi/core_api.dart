import 'package:flutter/cupertino.dart';

import '../../../model/app_model.dart';
import '../../../model/member_model.dart';
import '../action_api/action_model.dart';

typedef BuildIt = Widget Function(BuildContext context);

abstract class CoreApi {
  bool memberIsOwner(BuildContext context, String appId);
  MemberModel? getMember(
    BuildContext context,
  );

  bool isLoggedIn(
    BuildContext context,
  );

  String? currentMemberId(
    BuildContext context,
  );

  /*
   * Alternative for / short for:
   *     return BlocBuilder<AccessBloc, AccessState>(
   *           builder: (context, accessState) {
   *         if (accessState is AccessDetermined) {
   *            builtId(context);
   *         } else {
   *            return StyleRegistry.registry()
   *               .styleWithApp(widget.app)
   *               .adminListStyle()
   *               .progressIndicator(widget.app, context);
   *         }
   *     });
   */
  Widget buildWhenAccessDetermined(AppModel app, BuildIt buildIt);

  Future<bool> hasAccess(BuildContext context, ActionModel action);
}
