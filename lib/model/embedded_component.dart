/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 model/embedded_component.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core_helpers/etc/random.dart';
import 'package:eliud_core_helpers/helpers/common_tools.dart';
import 'package:eliud_core_helpers/query/query_tools.dart';
import 'package:eliud_core_main/model/app_model.dart';

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/app_entry_pages_list_bloc.dart';
import '../model/app_entry_pages_list.dart';
import '../model/app_entry_pages_list_event.dart';
import '../model/app_entry_pages_model.dart';
import '../model/app_entry_pages_entity.dart';
import '../model/app_entry_pages_repository.dart';

import '../model/member_medium_container_list_bloc.dart';
import '../model/member_medium_container_list.dart';
import '../model/member_medium_container_list_event.dart';
import '../model/member_medium_container_model.dart';
import '../model/member_medium_container_entity.dart';
import '../model/member_medium_container_repository.dart';

typedef AppEntryPagesListChanged = Function(List<AppEntryPagesModel> values);
typedef MemberMediumContainerListChanged = Function(
    List<MemberMediumContainerModel> values);

appEntryPagessList(app, context, value, trigger) =>
    EmbeddedComponentFactory.appEntryPagessList(app, context, value, trigger);
memberMediumContainersList(app, context, value, trigger) =>
    EmbeddedComponentFactory.memberMediumContainersList(
        app, context, value, trigger);

class EmbeddedComponentFactory {
/* 
 * appEntryPagessList function to construct a list of AppEntryPagesModel
 */
  static Widget appEntryPagessList(AppModel app, BuildContext context,
      List<AppEntryPagesModel> values, AppEntryPagesListChanged trigger) {
    AppEntryPagesInMemoryRepository inMemoryRepository =
        AppEntryPagesInMemoryRepository(
      trigger,
      values,
    );
    return MultiBlocProvider(
      providers: [
        BlocProvider<AppEntryPagesListBloc>(
          create: (context) => AppEntryPagesListBloc(
            appEntryPagesRepository: inMemoryRepository,
          )..add(LoadAppEntryPagesList()),
        )
      ],
      child: AppEntryPagesListWidget(app: app, isEmbedded: true),
    );
  }

/* 
 * memberMediumContainersList function to construct a list of MemberMediumContainerModel
 */
  static Widget memberMediumContainersList(
      AppModel app,
      BuildContext context,
      List<MemberMediumContainerModel> values,
      MemberMediumContainerListChanged trigger) {
    MemberMediumContainerInMemoryRepository inMemoryRepository =
        MemberMediumContainerInMemoryRepository(
      trigger,
      values,
    );
    return MultiBlocProvider(
      providers: [
        BlocProvider<MemberMediumContainerListBloc>(
          create: (context) => MemberMediumContainerListBloc(
            memberMediumContainerRepository: inMemoryRepository,
          )..add(LoadMemberMediumContainerList()),
        )
      ],
      child: MemberMediumContainerListWidget(app: app, isEmbedded: true),
    );
  }
}

/* 
 * AppEntryPagesInMemoryRepository is an in memory implementation of AppEntryPagesRepository
 */
class AppEntryPagesInMemoryRepository implements AppEntryPagesRepository {
  final List<AppEntryPagesModel> items;
  final AppEntryPagesListChanged trigger;
  Stream<List<AppEntryPagesModel>>? theValues;

  /* 
     * Construct the AppEntryPagesInMemoryRepository
     */
  AppEntryPagesInMemoryRepository(this.trigger, this.items) {
    List<List<AppEntryPagesModel>> myList = <List<AppEntryPagesModel>>[];
    myList.add(items);
    theValues = Stream<List<AppEntryPagesModel>>.fromIterable(myList);
  }

  int _index(String documentID) {
    int i = 0;
    for (final item in items) {
      if (item.documentID == documentID) {
        return i;
      }
      i++;
    }
    return -1;
  }

  /* 
     * Add an entity
     */
  @override
  Future<AppEntryPagesEntity> addEntity(
      String documentID, AppEntryPagesEntity value) {
    throw Exception('Not implemented');
  }

  /* 
     * Update an entity
     */
  @override
  Future<AppEntryPagesEntity> updateEntity(
      String documentID, AppEntryPagesEntity value) {
    throw Exception('Not implemented');
  }

  /* 
     * Update a model
     */
  @override
  Future<AppEntryPagesModel> add(AppEntryPagesModel value) {
    items.add(value.copyWith(documentID: newRandomKey()));
    trigger(items);
    return Future.value(value);
  }

  /* 
     * Delete a model
     */
  @override
  Future<void> delete(AppEntryPagesModel value) {
    int index = _index(value.documentID);
    if (index >= 0) items.removeAt(index);
    trigger(items);
    return Future.value();
  }

  /* 
     * Update a model
     */
  @override
  Future<AppEntryPagesModel> update(AppEntryPagesModel value) {
    int index = _index(value.documentID);
    if (index >= 0) {
      items.replaceRange(index, index + 1, [value]);
      trigger(items);
    }
    return Future.value(value);
  }

  /* 
     * Get a model
     */
  @override
  Future<AppEntryPagesModel> get(String? id, {Function(Exception)? onError}) {
    int index = _index(id!);
    var completer = Completer<AppEntryPagesModel>();
    completer.complete(items[index]);
    return completer.future;
  }

  /* 
     * Retrieve to a list of AppEntryPagesModel base on a query
     */
  @override
  Stream<List<AppEntryPagesModel>> values(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return theValues!;
  }

  /* 
     * Retrieve to a list of AppEntryPagesModel, including linked models base on a query
     */
  @override
  Stream<List<AppEntryPagesModel>> valuesWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return theValues!;
  }

  /* 
     * Subscribe to a list of AppEntryPagesModel base on a query
     */
  @override
  StreamSubscription<List<AppEntryPagesModel>> listen(trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return theValues!.listen((theList) => trigger(theList));
  }

  /* 
     * Subscribe to a list of AppEntryPagesModel, including linked models, base on a query
     */
  @override
  StreamSubscription<List<AppEntryPagesModel>> listenWithDetails(trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return theValues!.listen((theList) => trigger(theList));
  }

  /* 
     * Flush the repository
     */
  @override
  void flush() {}

  /* 
     * Retrieve the list of models
     */
  @override
  Future<List<AppEntryPagesModel>> valuesList(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return Future.value(items);
  }

  @override
  Future<List<AppEntryPagesModel>> valuesListWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return Future.value(items);
  }

  /* 
     * Retrieve a subcollection of this collection
     */
  @override
  getSubCollection(String documentId, String name) {
    throw UnimplementedError();
  }

  /* 
   * Retrieve a timestamp
   */
  @override
  String timeStampToString(timeStamp) {
    throw UnimplementedError();
  }

  /* 
   * Subscribe to 1 document / 1 model
   */
  @override
  StreamSubscription<AppEntryPagesModel> listenTo(
      String documentId, AppEntryPagesChanged changed,
      {AppEntryPagesErrorHandler? errorHandler}) {
    throw UnimplementedError();
  }

  @override
  Future<AppEntryPagesModel> changeValue(
      String documentId, String fieldName, num changeByThisValue) {
    throw UnimplementedError();
  }

  @override
  Future<AppEntryPagesEntity?> getEntity(String? id,
      {Function(Exception p1)? onError}) {
    throw UnimplementedError();
  }

  @override
  AppEntryPagesEntity? fromMap(Object? o,
      {Map<String, String>? newDocumentIds}) {
    throw UnimplementedError();
  }

  @override
  Future<void> deleteAll() async {}
}

/* 
 * MemberMediumContainerInMemoryRepository is an in memory implementation of MemberMediumContainerRepository
 */
class MemberMediumContainerInMemoryRepository
    implements MemberMediumContainerRepository {
  final List<MemberMediumContainerModel> items;
  final MemberMediumContainerListChanged trigger;
  Stream<List<MemberMediumContainerModel>>? theValues;

  /* 
     * Construct the MemberMediumContainerInMemoryRepository
     */
  MemberMediumContainerInMemoryRepository(this.trigger, this.items) {
    List<List<MemberMediumContainerModel>> myList =
        <List<MemberMediumContainerModel>>[];
    myList.add(items);
    theValues = Stream<List<MemberMediumContainerModel>>.fromIterable(myList);
  }

  int _index(String documentID) {
    int i = 0;
    for (final item in items) {
      if (item.documentID == documentID) {
        return i;
      }
      i++;
    }
    return -1;
  }

  /* 
     * Add an entity
     */
  @override
  Future<MemberMediumContainerEntity> addEntity(
      String documentID, MemberMediumContainerEntity value) {
    throw Exception('Not implemented');
  }

  /* 
     * Update an entity
     */
  @override
  Future<MemberMediumContainerEntity> updateEntity(
      String documentID, MemberMediumContainerEntity value) {
    throw Exception('Not implemented');
  }

  /* 
     * Update a model
     */
  @override
  Future<MemberMediumContainerModel> add(MemberMediumContainerModel value) {
    items.add(value.copyWith(documentID: newRandomKey()));
    trigger(items);
    return Future.value(value);
  }

  /* 
     * Delete a model
     */
  @override
  Future<void> delete(MemberMediumContainerModel value) {
    int index = _index(value.documentID);
    if (index >= 0) items.removeAt(index);
    trigger(items);
    return Future.value();
  }

  /* 
     * Update a model
     */
  @override
  Future<MemberMediumContainerModel> update(MemberMediumContainerModel value) {
    int index = _index(value.documentID);
    if (index >= 0) {
      items.replaceRange(index, index + 1, [value]);
      trigger(items);
    }
    return Future.value(value);
  }

  /* 
     * Get a model
     */
  @override
  Future<MemberMediumContainerModel> get(String? id,
      {Function(Exception)? onError}) {
    int index = _index(id!);
    var completer = Completer<MemberMediumContainerModel>();
    completer.complete(items[index]);
    return completer.future;
  }

  /* 
     * Retrieve to a list of MemberMediumContainerModel base on a query
     */
  @override
  Stream<List<MemberMediumContainerModel>> values(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return theValues!;
  }

  /* 
     * Retrieve to a list of MemberMediumContainerModel, including linked models base on a query
     */
  @override
  Stream<List<MemberMediumContainerModel>> valuesWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return theValues!;
  }

  /* 
     * Subscribe to a list of MemberMediumContainerModel base on a query
     */
  @override
  StreamSubscription<List<MemberMediumContainerModel>> listen(trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return theValues!.listen((theList) => trigger(theList));
  }

  /* 
     * Subscribe to a list of MemberMediumContainerModel, including linked models, base on a query
     */
  @override
  StreamSubscription<List<MemberMediumContainerModel>> listenWithDetails(
      trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return theValues!.listen((theList) => trigger(theList));
  }

  /* 
     * Flush the repository
     */
  @override
  void flush() {}

  /* 
     * Retrieve the list of models
     */
  @override
  Future<List<MemberMediumContainerModel>> valuesList(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return Future.value(items);
  }

  @override
  Future<List<MemberMediumContainerModel>> valuesListWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return Future.value(items);
  }

  /* 
     * Retrieve a subcollection of this collection
     */
  @override
  getSubCollection(String documentId, String name) {
    throw UnimplementedError();
  }

  /* 
   * Retrieve a timestamp
   */
  @override
  String timeStampToString(timeStamp) {
    throw UnimplementedError();
  }

  /* 
   * Subscribe to 1 document / 1 model
   */
  @override
  StreamSubscription<MemberMediumContainerModel> listenTo(
      String documentId, MemberMediumContainerChanged changed,
      {MemberMediumContainerErrorHandler? errorHandler}) {
    throw UnimplementedError();
  }

  @override
  Future<MemberMediumContainerModel> changeValue(
      String documentId, String fieldName, num changeByThisValue) {
    throw UnimplementedError();
  }

  @override
  Future<MemberMediumContainerEntity?> getEntity(String? id,
      {Function(Exception p1)? onError}) {
    throw UnimplementedError();
  }

  @override
  MemberMediumContainerEntity? fromMap(Object? o,
      {Map<String, String>? newDocumentIds}) {
    throw UnimplementedError();
  }

  @override
  Future<void> deleteAll() async {}
}
