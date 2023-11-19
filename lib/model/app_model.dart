/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 app_model.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core_model/tools/base/model_base.dart';

import 'package:eliud_core_model/model/abstract_repository_singleton.dart';
import 'package:eliud_core_model/model/model_export.dart';
import 'package:eliud_core_model/model/entity_export.dart';

import 'package:eliud_core_model/model/app_entity.dart';

enum AppStatus { live, offline, invisible, unknown }

AppStatus toAppStatus(int? index) {
  switch (index) {
    case 0:
      return AppStatus.live;
    case 1:
      return AppStatus.offline;
    case 2:
      return AppStatus.invisible;
  }
  return AppStatus.unknown;
}

class AppModel implements ModelBase {
  static const String packageName = 'eliud_core_model';
  static const String id = 'apps';

  @override
  String documentID;
  String ownerID;
  String? title;

  // This is usual as information, but actually used by some component, e.g. HtmlWithPlatformMediumComponent / AbstractTextPlatform: a html text including a link will evaluate the link and if it's a link within the app / website, it'll open that page.
  String? homeURL;
  String? email;
  String? description;
  AppStatus? appStatus;
  PublicMediumModel? anonymousProfilePhoto;
  AppHomePageReferencesModel? homePages;
  PublicMediumModel? logo;
  String? styleFamily;
  String? styleName;

  // When set, any new joining member will have privilegeLevel = 1
  bool? autoPrivileged1;

  // Is Featured
  bool? isFeatured;

  // Allow member profile to update shipping address? If the app doesn't include shipping products, then this is obsolete
  bool? includeShippingAddress;

  // Allow member profile to update invoice address? If the app doesn't invoicing then this is obsolete
  bool? includeInvoiceAddress;

  // Allow member profile to show subscriptions? If the app isn't a playstore, like minkey, then this is obsolete
  bool? includeSubscriptions;
  String? welcomeMessage;

  AppModel({
    required this.documentID,
    required this.ownerID,
    this.title,
    this.homeURL,
    this.email,
    this.description,
    this.appStatus,
    this.anonymousProfilePhoto,
    this.homePages,
    this.logo,
    this.styleFamily,
    this.styleName,
    this.autoPrivileged1,
    this.isFeatured,
    this.includeShippingAddress,
    this.includeInvoiceAddress,
    this.includeSubscriptions,
    this.welcomeMessage,
  });

  @override
  AppModel copyWith({
    String? documentID,
    String? ownerID,
    String? title,
    String? homeURL,
    String? email,
    String? description,
    AppStatus? appStatus,
    PublicMediumModel? anonymousProfilePhoto,
    AppHomePageReferencesModel? homePages,
    PublicMediumModel? logo,
    String? styleFamily,
    String? styleName,
    bool? autoPrivileged1,
    bool? isFeatured,
    bool? includeShippingAddress,
    bool? includeInvoiceAddress,
    bool? includeSubscriptions,
    String? welcomeMessage,
  }) {
    return AppModel(
      documentID: documentID ?? this.documentID,
      ownerID: ownerID ?? this.ownerID,
      title: title ?? this.title,
      homeURL: homeURL ?? this.homeURL,
      email: email ?? this.email,
      description: description ?? this.description,
      appStatus: appStatus ?? this.appStatus,
      anonymousProfilePhoto:
          anonymousProfilePhoto ?? this.anonymousProfilePhoto,
      homePages: homePages ?? this.homePages,
      logo: logo ?? this.logo,
      styleFamily: styleFamily ?? this.styleFamily,
      styleName: styleName ?? this.styleName,
      autoPrivileged1: autoPrivileged1 ?? this.autoPrivileged1,
      isFeatured: isFeatured ?? this.isFeatured,
      includeShippingAddress:
          includeShippingAddress ?? this.includeShippingAddress,
      includeInvoiceAddress:
          includeInvoiceAddress ?? this.includeInvoiceAddress,
      includeSubscriptions: includeSubscriptions ?? this.includeSubscriptions,
      welcomeMessage: welcomeMessage ?? this.welcomeMessage,
    );
  }

  @override
  int get hashCode =>
      documentID.hashCode ^
      ownerID.hashCode ^
      title.hashCode ^
      homeURL.hashCode ^
      email.hashCode ^
      description.hashCode ^
      appStatus.hashCode ^
      anonymousProfilePhoto.hashCode ^
      homePages.hashCode ^
      logo.hashCode ^
      styleFamily.hashCode ^
      styleName.hashCode ^
      autoPrivileged1.hashCode ^
      isFeatured.hashCode ^
      includeShippingAddress.hashCode ^
      includeInvoiceAddress.hashCode ^
      includeSubscriptions.hashCode ^
      welcomeMessage.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppModel &&
          runtimeType == other.runtimeType &&
          documentID == other.documentID &&
          ownerID == other.ownerID &&
          title == other.title &&
          homeURL == other.homeURL &&
          email == other.email &&
          description == other.description &&
          appStatus == other.appStatus &&
          anonymousProfilePhoto == other.anonymousProfilePhoto &&
          homePages == other.homePages &&
          logo == other.logo &&
          styleFamily == other.styleFamily &&
          styleName == other.styleName &&
          autoPrivileged1 == other.autoPrivileged1 &&
          isFeatured == other.isFeatured &&
          includeShippingAddress == other.includeShippingAddress &&
          includeInvoiceAddress == other.includeInvoiceAddress &&
          includeSubscriptions == other.includeSubscriptions &&
          welcomeMessage == other.welcomeMessage;

  @override
  String toString() {
    return 'AppModel{documentID: $documentID, ownerID: $ownerID, title: $title, homeURL: $homeURL, email: $email, description: $description, appStatus: $appStatus, anonymousProfilePhoto: $anonymousProfilePhoto, homePages: $homePages, logo: $logo, styleFamily: $styleFamily, styleName: $styleName, autoPrivileged1: $autoPrivileged1, isFeatured: $isFeatured, includeShippingAddress: $includeShippingAddress, includeInvoiceAddress: $includeInvoiceAddress, includeSubscriptions: $includeSubscriptions, welcomeMessage: $welcomeMessage}';
  }

  @override
  Future<List<ModelReference>> collectReferences({String? appId}) async {
    List<ModelReference> referencesCollector = [];
    if (anonymousProfilePhoto != null) {
      referencesCollector.add(ModelReference(PublicMediumModel.packageName,
          PublicMediumModel.id, anonymousProfilePhoto!));
    }
    if (logo != null) {
      referencesCollector.add(ModelReference(
          PublicMediumModel.packageName, PublicMediumModel.id, logo!));
    }
    if (anonymousProfilePhoto != null) {
      referencesCollector
          .addAll(await anonymousProfilePhoto!.collectReferences(appId: appId));
    }
    if (homePages != null) {
      referencesCollector
          .addAll(await homePages!.collectReferences(appId: appId));
    }
    if (logo != null) {
      referencesCollector.addAll(await logo!.collectReferences(appId: appId));
    }
    return referencesCollector;
  }

  @override
  AppEntity toEntity({String? appId}) {
    return AppEntity(
      ownerID: ownerID,
      title: (title != null) ? title : null,
      homeURL: (homeURL != null) ? homeURL : null,
      email: (email != null) ? email : null,
      description: (description != null) ? description : null,
      appStatus: (appStatus != null) ? appStatus!.index : null,
      anonymousProfilePhotoId: (anonymousProfilePhoto != null)
          ? anonymousProfilePhoto!.documentID
          : null,
      homePages: (homePages != null) ? homePages!.toEntity(appId: appId) : null,
      logoId: (logo != null) ? logo!.documentID : null,
      styleFamily: (styleFamily != null) ? styleFamily : null,
      styleName: (styleName != null) ? styleName : null,
      autoPrivileged1: (autoPrivileged1 != null) ? autoPrivileged1 : null,
      isFeatured: (isFeatured != null) ? isFeatured : null,
      includeShippingAddress:
          (includeShippingAddress != null) ? includeShippingAddress : null,
      includeInvoiceAddress:
          (includeInvoiceAddress != null) ? includeInvoiceAddress : null,
      includeSubscriptions:
          (includeSubscriptions != null) ? includeSubscriptions : null,
      welcomeMessage: (welcomeMessage != null) ? welcomeMessage : null,
    );
  }

  static Future<AppModel?> fromEntity(
      String documentID, AppEntity? entity) async {
    if (entity == null) return null;
    return AppModel(
      documentID: documentID,
      ownerID: entity.ownerID ?? '',
      title: entity.title,
      homeURL: entity.homeURL,
      email: entity.email,
      description: entity.description,
      appStatus: toAppStatus(entity.appStatus),
      homePages: await AppHomePageReferencesModel.fromEntity(entity.homePages),
      styleFamily: entity.styleFamily,
      styleName: entity.styleName,
      autoPrivileged1: entity.autoPrivileged1,
      isFeatured: entity.isFeatured,
      includeShippingAddress: entity.includeShippingAddress,
      includeInvoiceAddress: entity.includeInvoiceAddress,
      includeSubscriptions: entity.includeSubscriptions,
      welcomeMessage: entity.welcomeMessage,
    );
  }

  static Future<AppModel?> fromEntityPlus(String documentID, AppEntity? entity,
      {String? appId}) async {
    if (entity == null) return null;

    PublicMediumModel? anonymousProfilePhotoHolder;
    if (entity.anonymousProfilePhotoId != null) {
      try {
        anonymousProfilePhotoHolder =
            await publicMediumRepository(appId: appId)!
                .get(entity.anonymousProfilePhotoId);
      } on Exception catch (e) {
        print('Error whilst trying to initialise anonymousProfilePhoto');
        print(
            'Error whilst retrieving publicMedium with id ${entity.anonymousProfilePhotoId}');
        print('Exception: $e');
      }
    }

    PublicMediumModel? logoHolder;
    if (entity.logoId != null) {
      try {
        logoHolder =
            await publicMediumRepository(appId: appId)!.get(entity.logoId);
      } on Exception catch (e) {
        print('Error whilst trying to initialise logo');
        print('Error whilst retrieving publicMedium with id ${entity.logoId}');
        print('Exception: $e');
      }
    }

    return AppModel(
      documentID: documentID,
      ownerID: entity.ownerID ?? '',
      title: entity.title,
      homeURL: entity.homeURL,
      email: entity.email,
      description: entity.description,
      appStatus: toAppStatus(entity.appStatus),
      anonymousProfilePhoto: anonymousProfilePhotoHolder,
      homePages: await AppHomePageReferencesModel.fromEntityPlus(
          entity.homePages,
          appId: appId),
      logo: logoHolder,
      styleFamily: entity.styleFamily,
      styleName: entity.styleName,
      autoPrivileged1: entity.autoPrivileged1,
      isFeatured: entity.isFeatured,
      includeShippingAddress: entity.includeShippingAddress,
      includeInvoiceAddress: entity.includeInvoiceAddress,
      includeSubscriptions: entity.includeSubscriptions,
      welcomeMessage: entity.welcomeMessage,
    );
  }
}
