/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 dialog_repository.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core_model/model/model_export.dart';
import 'package:eliud_core_model/model/entity_export.dart';

import 'dart:async';
import 'package:eliud_core_model/tools/query/query_tools.dart';
import 'package:eliud_core_model/tools/common_tools.dart';
import 'package:eliud_core_model/tools/base/repository_base.dart';

typedef DialogModelTrigger = Function(List<DialogModel?> list);
typedef DialogChanged = Function(DialogModel? value);
typedef DialogErrorHandler = Function(dynamic o, dynamic e);

abstract class DialogRepository
    extends RepositoryBase<DialogModel, DialogEntity> {
  @override
  Future<DialogEntity> addEntity(String documentID, DialogEntity value);
  @override
  Future<DialogEntity> updateEntity(String documentID, DialogEntity value);
  @override
  Future<DialogModel> add(DialogModel value);
  @override
  Future<void> delete(DialogModel value);
  @override
  Future<DialogModel?> get(String? id, {Function(Exception)? onError});
  @override
  Future<DialogModel> update(DialogModel value);

  @override
  Stream<List<DialogModel?>> values(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  Stream<List<DialogModel?>> valuesWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  Future<List<DialogModel?>> valuesList(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  Future<List<DialogModel?>> valuesListWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});

  @override
  StreamSubscription<List<DialogModel?>> listen(DialogModelTrigger trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  StreamSubscription<List<DialogModel?>> listenWithDetails(
      DialogModelTrigger trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  StreamSubscription<DialogModel?> listenTo(
      String documentId, DialogChanged changed,
      {DialogErrorHandler? errorHandler});
  @override
  void flush();

  @override
  String? timeStampToString(dynamic timeStamp);

  @override
  dynamic getSubCollection(String documentId, String name);
  @override
  Future<DialogModel?> changeValue(
      String documentId, String fieldName, num changeByThisValue);

  @override
  Future<void> deleteAll();
}
