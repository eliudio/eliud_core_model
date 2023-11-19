/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 page_repository.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:eliud_core_model/tools/query/query_tools.dart';
import 'package:eliud_core_model/tools/common_tools.dart';
import 'package:eliud_core_model/model/page_repository.dart';

import 'package:eliud_core_model/model/abstract_repository_singleton.dart';
import 'package:eliud_core_model/model/repository_export.dart';
import 'package:eliud_core_model/model/cache_export.dart';
import 'package:eliud_core_model/model/model_export.dart';
import 'package:eliud_core_model/model/entity_export.dart';

class PageCache implements PageRepository {
  final PageRepository reference;
  final Map<String?, PageModel?> fullCache = {};

  PageCache(this.reference);

  /// Add a PageModel to the repository, cached
  @override
  Future<PageModel> add(PageModel value) {
    return reference.add(value).then((newValue) {
      fullCache[value.documentID] = newValue;
      return newValue;
    });
  }

  /// Add a PageEntity to the repository, cached
  @override
  Future<PageEntity> addEntity(String documentID, PageEntity value) {
    return reference.addEntity(documentID, value);
  }

  /// Update a PageEntity in the repository, cached
  @override
  Future<PageEntity> updateEntity(String documentID, PageEntity value) {
    return reference.updateEntity(documentID, value);
  }

  /// Delete a PageModel from the repository, cached
  @override
  Future<void> delete(PageModel value) {
    fullCache.remove(value.documentID);
    reference.delete(value);
    return Future.value();
  }

  /// Retrieve a PageModel with it's id, cached
  @override
  Future<PageModel?> get(String? id, {Function(Exception)? onError}) async {
    var value = fullCache[id];
    if (value != null) return refreshRelations(value);
    value = await reference.get(id, onError: onError);
    fullCache[id] = value;
    return value;
  }

  /// Update a PageModel
  @override
  Future<PageModel> update(PageModel value) {
    return reference.update(value).then((newValue) {
      fullCache[value.documentID] = newValue;
      return newValue;
    });
  }

  /// Retrieve list of List<PageModel?>
  @override
  Stream<List<PageModel?>> values(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return reference.values(
        orderBy: orderBy,
        descending: descending,
        startAfter: startAfter,
        limit: limit,
        setLastDoc: setLastDoc,
        privilegeLevel: privilegeLevel,
        eliudQuery: eliudQuery);
  }

  @override
  Stream<List<PageModel?>> valuesWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return reference.valuesWithDetails(
        orderBy: orderBy,
        descending: descending,
        startAfter: startAfter,
        limit: limit,
        setLastDoc: setLastDoc,
        privilegeLevel: privilegeLevel,
        eliudQuery: eliudQuery);
  }

  @override
  Future<List<PageModel?>> valuesList(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) async {
    return await reference.valuesList(
        orderBy: orderBy,
        descending: descending,
        startAfter: startAfter,
        limit: limit,
        setLastDoc: setLastDoc,
        privilegeLevel: privilegeLevel,
        eliudQuery: eliudQuery);
  }

  @override
  Future<List<PageModel?>> valuesListWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) async {
    return await reference.valuesListWithDetails(
        orderBy: orderBy,
        descending: descending,
        startAfter: startAfter,
        limit: limit,
        setLastDoc: setLastDoc,
        privilegeLevel: privilegeLevel,
        eliudQuery: eliudQuery);
  }

  @override
  void flush() {
    fullCache.clear();
  }

  @override
  String? timeStampToString(dynamic timeStamp) {
    return reference.timeStampToString(timeStamp);
  }

  @override
  dynamic getSubCollection(String documentId, String name) {
    return reference.getSubCollection(documentId, name);
  }

  @override
  Future<PageModel> changeValue(
      String documentId, String fieldName, num changeByThisValue) {
    return reference
        .changeValue(documentId, fieldName, changeByThisValue)
        .then((newValue) {
      fullCache[documentId] = newValue;
      return newValue!;
    });
  }

  @override
  Future<PageEntity?> getEntity(String? id, {Function(Exception p1)? onError}) {
    return reference.getEntity(id, onError: onError);
  }

  @override
  PageEntity? fromMap(Object? o, {Map<String, String>? newDocumentIds}) {
    return reference.fromMap(o, newDocumentIds: newDocumentIds);
  }

  @override
  Future<void> deleteAll() {
    return reference.deleteAll();
  }

  @override
  StreamSubscription<List<PageModel?>> listen(trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return reference.listen(trigger,
        orderBy: orderBy,
        descending: descending,
        startAfter: startAfter,
        limit: limit,
        privilegeLevel: privilegeLevel,
        eliudQuery: eliudQuery);
  }

  @override
  StreamSubscription<List<PageModel?>> listenWithDetails(trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return reference.listenWithDetails(trigger,
        orderBy: orderBy,
        descending: descending,
        startAfter: startAfter,
        limit: limit,
        privilegeLevel: privilegeLevel,
        eliudQuery: eliudQuery);
  }

  @override
  StreamSubscription<PageModel?> listenTo(
      String documentId, PageChanged changed,
      {PageErrorHandler? errorHandler}) {
    return reference.listenTo(documentId, ((value) {
      if (value != null) {
        fullCache[value.documentID] = value;
      }
      changed(value);
    }), errorHandler: errorHandler);
  }

  static Future<PageModel> refreshRelations(PageModel model) async {
    AppBarModel? appBarHolder;
    if (model.appBar != null) {
      try {
        await appBarRepository(appId: model.appId)!
            .get(model.appBar!.documentID)
            .then((val) {
          appBarHolder = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    DrawerModel? drawerHolder;
    if (model.drawer != null) {
      try {
        await drawerRepository(appId: model.appId)!
            .get(model.drawer!.documentID)
            .then((val) {
          drawerHolder = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    DrawerModel? endDrawerHolder;
    if (model.endDrawer != null) {
      try {
        await drawerRepository(appId: model.appId)!
            .get(model.endDrawer!.documentID)
            .then((val) {
          endDrawerHolder = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    HomeMenuModel? homeMenuHolder;
    if (model.homeMenu != null) {
      try {
        await homeMenuRepository(appId: model.appId)!
            .get(model.homeMenu!.documentID)
            .then((val) {
          homeMenuHolder = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    GridViewModel? gridViewHolder;
    if (model.gridView != null) {
      try {
        await gridViewRepository(appId: model.appId)!
            .get(model.gridView!.documentID)
            .then((val) {
          gridViewHolder = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    List<BodyComponentModel>? bodyComponentsHolder;
    if (model.bodyComponents != null) {
      bodyComponentsHolder = List<BodyComponentModel>.from(
              await Future.wait(model.bodyComponents!.map((element) async {
        return await BodyComponentCache.refreshRelations(element);
      })))
          .toList();
    }

    return model.copyWith(
      appBar: appBarHolder,
      drawer: drawerHolder,
      endDrawer: endDrawerHolder,
      homeMenu: homeMenuHolder,
      gridView: gridViewHolder,
      bodyComponents: bodyComponentsHolder,
    );
  }
}
