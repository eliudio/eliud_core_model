/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 model/repository_singleton.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'abstract_repository_singleton.dart';
import 'package:eliud_core_main/tools/main_abstract_repository_singleton.dart';
import 'dart:collection';
import '../model/access_firestore.dart';
import '../model/access_repository.dart';
import '../model/app_policy_firestore.dart';
import '../model/app_policy_repository.dart';
import '../model/app_policy_cache.dart';
import '../model/backend_request_firestore.dart';
import '../model/backend_request_repository.dart';
import '../model/backend_request_cache.dart';
import '../model/blocking_firestore.dart';
import '../model/blocking_repository.dart';
import '../model/blocking_cache.dart';
import '../model/blocking_dashboard_firestore.dart';
import '../model/blocking_dashboard_repository.dart';
import '../model/blocking_dashboard_cache.dart';
import '../model/member_claim_firestore.dart';
import '../model/member_claim_repository.dart';
import '../model/member_claim_cache.dart';
import '../model/member_dashboard_firestore.dart';
import '../model/member_dashboard_repository.dart';
import '../model/member_dashboard_cache.dart';

class RepositorySingleton extends AbstractRepositorySingleton {
  final _accessRepository = HashMap<String, AccessRepository>();
  final _appPolicyRepository = HashMap<String, AppPolicyRepository>();
  final _backendRequestRepository = HashMap<String, BackendRequestRepository>();
  final _blockingRepository = BlockingCache(BlockingFirestore());
  final _blockingDashboardRepository =
      HashMap<String, BlockingDashboardRepository>();
  final _memberClaimRepository = MemberClaimCache(MemberClaimFirestore());
  final _memberDashboardRepository =
      HashMap<String, MemberDashboardRepository>();

  @override
  AccessRepository? accessRepository(String? appId) {
    if ((appId != null) && (_accessRepository[appId] == null)) {
      _accessRepository[appId] = AccessFirestore(
          () => appRepository()!.getSubCollection(appId, 'access'), appId);
    }
    return _accessRepository[appId];
  }

  @override
  AppPolicyRepository? appPolicyRepository(String? appId) {
    if ((appId != null) && (_appPolicyRepository[appId] == null)) {
      _appPolicyRepository[appId] = AppPolicyCache(AppPolicyFirestore(
          () => appRepository()!.getSubCollection(appId, 'apppolicy'), appId));
    }
    return _appPolicyRepository[appId];
  }

  @override
  BackendRequestRepository? backendRequestRepository(String? appId) {
    if ((appId != null) && (_backendRequestRepository[appId] == null)) {
      _backendRequestRepository[appId] = BackendRequestCache(
          BackendRequestFirestore(
              () => appRepository()!.getSubCollection(appId, 'backendrequest'),
              appId));
    }
    return _backendRequestRepository[appId];
  }

  @override
  BlockingRepository? blockingRepository() {
    return _blockingRepository;
  }

  @override
  BlockingDashboardRepository? blockingDashboardRepository(String? appId) {
    if ((appId != null) && (_blockingDashboardRepository[appId] == null)) {
      _blockingDashboardRepository[appId] = BlockingDashboardCache(
          BlockingDashboardFirestore(
              () =>
                  appRepository()!.getSubCollection(appId, 'blockingdashboard'),
              appId));
    }
    return _blockingDashboardRepository[appId];
  }

  @override
  MemberClaimRepository? memberClaimRepository() {
    return _memberClaimRepository;
  }

  @override
  MemberDashboardRepository? memberDashboardRepository(String? appId) {
    if ((appId != null) && (_memberDashboardRepository[appId] == null)) {
      _memberDashboardRepository[appId] = MemberDashboardCache(
          MemberDashboardFirestore(
              () => appRepository()!.getSubCollection(appId, 'memberdashboard'),
              appId));
    }
    return _memberDashboardRepository[appId];
  }
}
