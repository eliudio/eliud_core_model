import 'package:eliud_core_model/model/app_model.dart';
import 'package:eliud_core_model/model/member_medium_model.dart';
import 'package:eliud_core_model/model/storage_conditions_model.dart';
import 'package:eliud_core_model/tools/storage/medium_helper.dart';
import 'package:eliud_core_model/tools/storage/member_medium_helper.dart';
import 'package:eliud_core_model/tools/storage/platform_medium_helper.dart';
import 'package:eliud_core_model/tools/storage/public_medium_helper.dart';

abstract class AccessRights<T extends MediumHelper> {
  T getMediumHelper(AppModel app, String ownerId);
}

class MemberMediumAccessRights extends AccessRights<MemberMediumHelper> {
/*
  final List<String> readAccess;
*/
  MemberMediumAccessibleByGroup accessibleByGroup;
  List<String>? accessibleByMembers;

  MemberMediumAccessRights(/*this.readAccess*/ this.accessibleByGroup,
      {this.accessibleByMembers});

  @override
  MemberMediumHelper getMediumHelper(AppModel app, String ownerId) {
    return MemberMediumHelper(app, ownerId, /*readAccess*/ accessibleByGroup,
        accessibleByMembers: accessibleByMembers);
  }
}

class PlatformMediumAccessRights extends AccessRights<PlatformMediumHelper> {
  final PrivilegeLevelRequiredSimple privilegeLevelRequired;

  PlatformMediumAccessRights(this.privilegeLevelRequired);

  @override
  PlatformMediumHelper getMediumHelper(AppModel app, String ownerId) {
    return PlatformMediumHelper(app, ownerId, privilegeLevelRequired);
  }
}

class PublicMediumAccessRights extends AccessRights<PublicMediumHelper> {
  PublicMediumAccessRights();

  @override
  PublicMediumHelper getMediumHelper(AppModel app, String ownerId) {
    return PublicMediumHelper(app, ownerId);
  }
}
