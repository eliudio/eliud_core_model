/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 model/abstract_repository_singleton.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import '../model/access_repository.dart';
import '../model/app_policy_repository.dart';
import '../model/backend_request_repository.dart';
import '../model/blocking_repository.dart';
import '../model/blocking_dashboard_repository.dart';
import '../model/member_claim_repository.dart';
import '../model/member_dashboard_repository.dart';
import 'package:eliud_core_main/tools/etc/member_collection_info.dart';

AccessRepository? accessRepository({String? appId}) =>
    AbstractRepositorySingleton.singleton.accessRepository(appId);
AppPolicyRepository? appPolicyRepository({String? appId}) =>
    AbstractRepositorySingleton.singleton.appPolicyRepository(appId);
BackendRequestRepository? backendRequestRepository({String? appId}) =>
    AbstractRepositorySingleton.singleton.backendRequestRepository(appId);
BlockingRepository? blockingRepository({String? appId}) =>
    AbstractRepositorySingleton.singleton.blockingRepository();
BlockingDashboardRepository? blockingDashboardRepository({String? appId}) =>
    AbstractRepositorySingleton.singleton.blockingDashboardRepository(appId);
MemberClaimRepository? memberClaimRepository({String? appId}) =>
    AbstractRepositorySingleton.singleton.memberClaimRepository();
MemberDashboardRepository? memberDashboardRepository({String? appId}) =>
    AbstractRepositorySingleton.singleton.memberDashboardRepository(appId);

abstract class AbstractRepositorySingleton {
  static List<MemberCollectionInfo> collections = [
    MemberCollectionInfo('access', 'documentID'),
    MemberCollectionInfo('memberclaim', 'authorId'),
  ];
  static late AbstractRepositorySingleton singleton;

  AccessRepository? accessRepository(String? appId);
  AppPolicyRepository? appPolicyRepository(String? appId);
  BackendRequestRepository? backendRequestRepository(String? appId);
  BlockingRepository? blockingRepository();
  BlockingDashboardRepository? blockingDashboardRepository(String? appId);
  MemberClaimRepository? memberClaimRepository();
  MemberDashboardRepository? memberDashboardRepository(String? appId);

  void flush(String? appId) {
    accessRepository(appId)!.flush();
    appPolicyRepository(appId)!.flush();
    backendRequestRepository(appId)!.flush();
    blockingDashboardRepository(appId)!.flush();
    memberDashboardRepository(appId)!.flush();
  }
}
