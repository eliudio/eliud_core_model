/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 member_entity.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:collection';
import 'dart:convert';
import 'package:eliud_core_model/tools/etc/random.dart';
import 'package:eliud_core_model/tools/base/entity_base.dart';
import 'package:eliud_core_model/model/entity_export.dart';

class MemberEntity implements EntityBase {
  final String? name;
  final List<MemberSubscriptionEntity>? subscriptions;
  final List<String>? subscriptionsAsStrArr;
  final String? photoId;
  final String? photoURL;
  final String? shipStreet1;
  final String? shipStreet2;
  final String? shipCity;
  final String? shipState;
  final String? postcode;
  final String? country;
  final bool? invoiceSame;
  final String? invoiceStreet1;
  final String? invoiceStreet2;
  final String? invoiceCity;
  final String? invoiceState;
  final String? invoicePostcode;
  final String? invoiceCountry;
  final String? email;
  final bool? isAnonymous;

  MemberEntity({
    this.name,
    this.subscriptions,
    this.subscriptionsAsStrArr,
    this.photoId,
    this.photoURL,
    this.shipStreet1,
    this.shipStreet2,
    this.shipCity,
    this.shipState,
    this.postcode,
    this.country,
    this.invoiceSame,
    this.invoiceStreet1,
    this.invoiceStreet2,
    this.invoiceCity,
    this.invoiceState,
    this.invoicePostcode,
    this.invoiceCountry,
    this.email,
    this.isAnonymous,
  });

  MemberEntity copyWith({
    String? documentID,
    String? name,
    List<MemberSubscriptionEntity>? subscriptions,
    List<String>? subscriptionsAsStrArr,
    String? photoId,
    String? photoURL,
    String? shipStreet1,
    String? shipStreet2,
    String? shipCity,
    String? shipState,
    String? postcode,
    String? country,
    bool? invoiceSame,
    String? invoiceStreet1,
    String? invoiceStreet2,
    String? invoiceCity,
    String? invoiceState,
    String? invoicePostcode,
    String? invoiceCountry,
    String? email,
    bool? isAnonymous,
  }) {
    return MemberEntity(
      name: name ?? this.name,
      subscriptions: subscriptions ?? this.subscriptions,
      subscriptionsAsStrArr:
          subscriptionsAsStrArr ?? this.subscriptionsAsStrArr,
      photoId: photoId ?? this.photoId,
      photoURL: photoURL ?? this.photoURL,
      shipStreet1: shipStreet1 ?? this.shipStreet1,
      shipStreet2: shipStreet2 ?? this.shipStreet2,
      shipCity: shipCity ?? this.shipCity,
      shipState: shipState ?? this.shipState,
      postcode: postcode ?? this.postcode,
      country: country ?? this.country,
      invoiceSame: invoiceSame ?? this.invoiceSame,
      invoiceStreet1: invoiceStreet1 ?? this.invoiceStreet1,
      invoiceStreet2: invoiceStreet2 ?? this.invoiceStreet2,
      invoiceCity: invoiceCity ?? this.invoiceCity,
      invoiceState: invoiceState ?? this.invoiceState,
      invoicePostcode: invoicePostcode ?? this.invoicePostcode,
      invoiceCountry: invoiceCountry ?? this.invoiceCountry,
      email: email ?? this.email,
      isAnonymous: isAnonymous ?? this.isAnonymous,
    );
  }

  List<Object?> get props => [
        name,
        subscriptions,
        subscriptionsAsStrArr,
        photoId,
        photoURL,
        shipStreet1,
        shipStreet2,
        shipCity,
        shipState,
        postcode,
        country,
        invoiceSame,
        invoiceStreet1,
        invoiceStreet2,
        invoiceCity,
        invoiceState,
        invoicePostcode,
        invoiceCountry,
        email,
        isAnonymous,
      ];

  @override
  String toString() {
    String subscriptionsCsv =
        (subscriptions == null) ? '' : subscriptions!.join(', ');
    String subscriptionsAsStrArrCsv = (subscriptionsAsStrArr == null)
        ? ''
        : subscriptionsAsStrArr!.join(', ');

    return 'MemberEntity{name: $name, subscriptions: MemberSubscription[] { $subscriptionsCsv }, subscriptionsAsStrArr: String[] { $subscriptionsAsStrArrCsv }, photoId: $photoId, photoURL: $photoURL, shipStreet1: $shipStreet1, shipStreet2: $shipStreet2, shipCity: $shipCity, shipState: $shipState, postcode: $postcode, country: $country, invoiceSame: $invoiceSame, invoiceStreet1: $invoiceStreet1, invoiceStreet2: $invoiceStreet2, invoiceCity: $invoiceCity, invoiceState: $invoiceState, invoicePostcode: $invoicePostcode, invoiceCountry: $invoiceCountry, email: $email, isAnonymous: $isAnonymous}';
  }

  static MemberEntity? fromMap(Object? o,
      {Map<String, String>? newDocumentIds}) {
    if (o == null) return null;
    var map = o as Map<String, dynamic>;

    var subscriptionsFromMap = map['subscriptions'];
    List<MemberSubscriptionEntity> subscriptionsList;
    if (subscriptionsFromMap != null) {
      subscriptionsList = (map['subscriptions'] as List<dynamic>)
          .map((dynamic item) => MemberSubscriptionEntity.fromMap(item as Map,
              newDocumentIds: newDocumentIds)!)
          .toList();
    } else {
      subscriptionsList = [];
    }
    var photoIdNewDocmentId = map['photoId'];
    if ((newDocumentIds != null) && (photoIdNewDocmentId != null)) {
      var photoIdOldDocmentId = photoIdNewDocmentId;
      photoIdNewDocmentId = newRandomKey();
      newDocumentIds[photoIdOldDocmentId] = photoIdNewDocmentId;
    }

    return MemberEntity(
      name: map['name'],
      subscriptions: subscriptionsList,
      subscriptionsAsStrArr: map['subscriptionsAsStrArr'] == null
          ? null
          : List.from(map['subscriptionsAsStrArr']),
      photoId: photoIdNewDocmentId,
      photoURL: map['photoURL'],
      shipStreet1: map['shipStreet1'],
      shipStreet2: map['shipStreet2'],
      shipCity: map['shipCity'],
      shipState: map['shipState'],
      postcode: map['postcode'],
      country: map['country'],
      invoiceSame: map['invoiceSame'],
      invoiceStreet1: map['invoiceStreet1'],
      invoiceStreet2: map['invoiceStreet2'],
      invoiceCity: map['invoiceCity'],
      invoiceState: map['invoiceState'],
      invoicePostcode: map['invoicePostcode'],
      invoiceCountry: map['invoiceCountry'],
      email: map['email'],
      isAnonymous: map['isAnonymous'],
    );
  }

  @override
  Map<String, Object?> toDocument() {
    final List<Map<String?, dynamic>>? subscriptionsListMap =
        subscriptions != null
            ? subscriptions!.map((item) => item.toDocument()).toList()
            : null;

    Map<String, Object?> theDocument = HashMap();
    if (name != null) {
      theDocument["name"] = name;
    } else {
      theDocument["name"] = null;
    }
    if (subscriptions != null) {
      theDocument["subscriptions"] = subscriptionsListMap;
    } else {
      theDocument["subscriptions"] = null;
    }
    if (subscriptionsAsStrArr != null) {
      theDocument["subscriptionsAsStrArr"] = subscriptionsAsStrArr!.toList();
    } else {
      theDocument["subscriptionsAsStrArr"] = null;
    }
    if (photoId != null) {
      theDocument["photoId"] = photoId;
    } else {
      theDocument["photoId"] = null;
    }
    if (photoURL != null) {
      theDocument["photoURL"] = photoURL;
    } else {
      theDocument["photoURL"] = null;
    }
    if (shipStreet1 != null) {
      theDocument["shipStreet1"] = shipStreet1;
    } else {
      theDocument["shipStreet1"] = null;
    }
    if (shipStreet2 != null) {
      theDocument["shipStreet2"] = shipStreet2;
    } else {
      theDocument["shipStreet2"] = null;
    }
    if (shipCity != null) {
      theDocument["shipCity"] = shipCity;
    } else {
      theDocument["shipCity"] = null;
    }
    if (shipState != null) {
      theDocument["shipState"] = shipState;
    } else {
      theDocument["shipState"] = null;
    }
    if (postcode != null) {
      theDocument["postcode"] = postcode;
    } else {
      theDocument["postcode"] = null;
    }
    if (country != null) {
      theDocument["country"] = country;
    } else {
      theDocument["country"] = null;
    }
    if (invoiceSame != null) {
      theDocument["invoiceSame"] = invoiceSame;
    } else {
      theDocument["invoiceSame"] = null;
    }
    if (invoiceStreet1 != null) {
      theDocument["invoiceStreet1"] = invoiceStreet1;
    } else {
      theDocument["invoiceStreet1"] = null;
    }
    if (invoiceStreet2 != null) {
      theDocument["invoiceStreet2"] = invoiceStreet2;
    } else {
      theDocument["invoiceStreet2"] = null;
    }
    if (invoiceCity != null) {
      theDocument["invoiceCity"] = invoiceCity;
    } else {
      theDocument["invoiceCity"] = null;
    }
    if (invoiceState != null) {
      theDocument["invoiceState"] = invoiceState;
    } else {
      theDocument["invoiceState"] = null;
    }
    if (invoicePostcode != null) {
      theDocument["invoicePostcode"] = invoicePostcode;
    } else {
      theDocument["invoicePostcode"] = null;
    }
    if (invoiceCountry != null) {
      theDocument["invoiceCountry"] = invoiceCountry;
    } else {
      theDocument["invoiceCountry"] = null;
    }
    if (email != null) {
      theDocument["email"] = email;
    } else {
      theDocument["email"] = null;
    }
    if (isAnonymous != null) {
      theDocument["isAnonymous"] = isAnonymous;
    } else {
      theDocument["isAnonymous"] = null;
    }
    return theDocument;
  }

  @override
  MemberEntity switchAppId({required String newAppId}) {
    var newEntity = copyWith();
    return newEntity;
  }

  static MemberEntity? fromJsonString(String json,
      {Map<String, String>? newDocumentIds}) {
    Map<String, dynamic>? generationSpecificationMap = jsonDecode(json);
    return fromMap(generationSpecificationMap, newDocumentIds: newDocumentIds);
  }

  String toJsonString() {
    return jsonEncode(toDocument());
  }

  @override
  Future<Map<String, Object?>> enrichedDocument(
      Map<String, Object?> theDocument) async {
    return theDocument;
  }
}
