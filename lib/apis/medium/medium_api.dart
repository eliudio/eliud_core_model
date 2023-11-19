import 'package:eliud_core_model/model/app_model.dart';
import 'package:eliud_core_model/model/member_medium_model.dart';
import 'package:eliud_core_model/model/platform_medium_model.dart';
import 'package:eliud_core_model/model/public_medium_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'access_rights.dart';

typedef FeedbackProgress = Function(double? progress);

/*
 * I asssume we want a member storage section on firebase storage. A bucket / directory.
 * I assume we want a model representation of these files which we can use
 * to reference from within a feed, from a gallery, etc...
 * I assume these photos are stored in /appId/memberId/...
 * I assume we might want to have a ui to allow to organise photos in a user image repository
 */
typedef MediumAvailable = void Function(dynamic mediumModel);
typedef AccessRightsProvider = AccessRights Function();

abstract class MediumApi {
  void showPhotos(BuildContext context, AppModel app,
      List<MemberMediumModel> media, int initialPage);
  void showPhotosUrls(
      BuildContext context, AppModel app, List<String> urls, int initialPage);
  void showPhotosPlatform(BuildContext context, AppModel app,
      List<PlatformMediumModel> media, int initialPage);
  void showPhotosPublic(BuildContext context, AppModel app,
      List<PublicMediumModel> media, int initialPage);
  Future<void> showVideo(
      BuildContext context, AppModel app, MemberMediumModel memberMediumModel);
  Future<void> showVideoPlatform(BuildContext context, AppModel app,
      PlatformMediumModel platformMediumModel);
  void takePhoto(
      BuildContext context,
      AppModel app,
      AccessRightsProvider accessRightsProvider,
      MediumAvailable feedbackFunction,
      FeedbackProgress? feedbackProgress,
      {bool? allowCrop});
  void takeVideo(
      BuildContext context,
      AppModel app,
      AccessRightsProvider accessRightsProvider,
      MediumAvailable feedbackFunction,
      FeedbackProgress? feedbackProgress);
  void uploadPhoto(
      BuildContext context,
      AppModel app,
      AccessRightsProvider accessRightsProvider,
      MediumAvailable feedbackFunction,
      FeedbackProgress? feedbackProgress,
      {bool? allowCrop});
  void uploadVideo(
      BuildContext context,
      AppModel app,
      AccessRightsProvider accessRightsProvider,
      MediumAvailable feedbackFunction,
      FeedbackProgress? feedbackProgress);
  bool hasCamera();
  bool hasAccessToAssets();
  bool hasAccessToLocalFilesystem();

  /* Allow to add an imnage / upload / ... */
  Widget getPublicPhotoWidget(
      {Key? key,
      required BuildContext context,
      required AppModel app,
      String?
          defaultImage, // asset location of default image which the user can choose
      required MediumAvailable feedbackFunction,
      required PublicMediumModel? initialImage,
      bool? allowCrop});
  Widget getPlatformPhotoWidget(
      {Key? key,
      required BuildContext context,
      required AppModel app,
      String?
          defaultImage, // asset location of default image which the user can choose
      required MediumAvailable feedbackFunction,
      required PlatformMediumModel? initialImage,
      bool? allowCrop});
  /*
   * Currently default / only access is public. Should expand the api to allow to change
   */
  Widget getMemberPhotoWidget(
      {Key? key,
      required BuildContext context,
      required AppModel app,
      String?
          defaultImage, // asset location of default image which the user can choose
      required MediumAvailable feedbackFunction,
      required MemberMediumModel? initialImage,
      bool? allowCrop});
  Widget embeddedVideo(
      BuildContext context, AppModel app, MemberMediumModel memberMediumModel);
}
