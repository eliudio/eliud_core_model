/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 home_menu_repository.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core_model/model/model_export.dart';
import 'package:eliud_core_model/model/entity_export.dart';

import 'dart:async';
import 'package:eliud_core_model/tools/query/query_tools.dart';
import 'package:eliud_core_model/tools/common_tools.dart';
import 'package:eliud_core_model/tools/base/repository_base.dart';

typedef HomeMenuModelTrigger = Function(List<HomeMenuModel?> list);
typedef HomeMenuChanged = Function(HomeMenuModel? value);
typedef HomeMenuErrorHandler = Function(dynamic o, dynamic e);

abstract class HomeMenuRepository
    extends RepositoryBase<HomeMenuModel, HomeMenuEntity> {
  @override
  Future<HomeMenuEntity> addEntity(String documentID, HomeMenuEntity value);
  @override
  Future<HomeMenuEntity> updateEntity(String documentID, HomeMenuEntity value);
  @override
  Future<HomeMenuModel> add(HomeMenuModel value);
  @override
  Future<void> delete(HomeMenuModel value);
  @override
  Future<HomeMenuModel?> get(String? id, {Function(Exception)? onError});
  @override
  Future<HomeMenuModel> update(HomeMenuModel value);

  @override
  Stream<List<HomeMenuModel?>> values(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  Stream<List<HomeMenuModel?>> valuesWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  Future<List<HomeMenuModel?>> valuesList(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  Future<List<HomeMenuModel?>> valuesListWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});

  @override
  StreamSubscription<List<HomeMenuModel?>> listen(HomeMenuModelTrigger trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  StreamSubscription<List<HomeMenuModel?>> listenWithDetails(
      HomeMenuModelTrigger trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  StreamSubscription<HomeMenuModel?> listenTo(
      String documentId, HomeMenuChanged changed,
      {HomeMenuErrorHandler? errorHandler});
  @override
  void flush();

  @override
  String? timeStampToString(dynamic timeStamp);

  @override
  dynamic getSubCollection(String documentId, String name);
  @override
  Future<HomeMenuModel?> changeValue(
      String documentId, String fieldName, num changeByThisValue);

  @override
  Future<void> deleteAll();
}
