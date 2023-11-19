/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 public_medium_repository.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core_model/model/model_export.dart';
import 'package:eliud_core_model/model/entity_export.dart';

import 'dart:async';
import 'package:eliud_core_model/tools/query/query_tools.dart';
import 'package:eliud_core_model/tools/common_tools.dart';
import 'package:eliud_core_model/tools/base/repository_base.dart';

typedef PublicMediumModelTrigger = Function(List<PublicMediumModel?> list);
typedef PublicMediumChanged = Function(PublicMediumModel? value);
typedef PublicMediumErrorHandler = Function(dynamic o, dynamic e);

abstract class PublicMediumRepository
    extends RepositoryBase<PublicMediumModel, PublicMediumEntity> {
  @override
  Future<PublicMediumEntity> addEntity(
      String documentID, PublicMediumEntity value);
  @override
  Future<PublicMediumEntity> updateEntity(
      String documentID, PublicMediumEntity value);
  @override
  Future<PublicMediumModel> add(PublicMediumModel value);
  @override
  Future<void> delete(PublicMediumModel value);
  @override
  Future<PublicMediumModel?> get(String? id, {Function(Exception)? onError});
  @override
  Future<PublicMediumModel> update(PublicMediumModel value);

  @override
  Stream<List<PublicMediumModel?>> values(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  Stream<List<PublicMediumModel?>> valuesWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  Future<List<PublicMediumModel?>> valuesList(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  Future<List<PublicMediumModel?>> valuesListWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});

  @override
  StreamSubscription<List<PublicMediumModel?>> listen(
      PublicMediumModelTrigger trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  StreamSubscription<List<PublicMediumModel?>> listenWithDetails(
      PublicMediumModelTrigger trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  StreamSubscription<PublicMediumModel?> listenTo(
      String documentId, PublicMediumChanged changed,
      {PublicMediumErrorHandler? errorHandler});
  @override
  void flush();

  @override
  String? timeStampToString(dynamic timeStamp);

  @override
  dynamic getSubCollection(String documentId, String name);
  @override
  Future<PublicMediumModel?> changeValue(
      String documentId, String fieldName, num changeByThisValue);

  @override
  Future<void> deleteAll();
}
