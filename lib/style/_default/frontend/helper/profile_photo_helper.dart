import 'package:eliud_core_model/apis/apis.dart';
import 'package:eliud_core_model/model/app_model.dart';
import 'package:eliud_core_model/model/member_model.dart';
import 'package:eliud_core_model/model/member_public_info_model.dart';
import 'package:eliud_core_model/model/rgb_model.dart';
import 'package:eliud_core_model/style/frontend/has_profile_photo.dart';
import 'package:eliud_core_model/style/style_registry.dart';
import 'package:flutter/material.dart';
import '../../../../tools/etc/etc.dart';

class ProfilePhotoHelper {
  Widget getProfilePhotoButtonFromMember(
      BuildContext context, AppModel appModel,
      {MemberModel? member,
      required double radius,
      RgbModel? iconColor,
      VoidCallback? onPressed}) {
    if (member != null) {
      var url = member.photoURL;
      if ((appModel.anonymousProfilePhoto != null) && (url == null)) {
        url = appModel.anonymousProfilePhoto!.url;
      }
      if (url != null) {
        return getProfilePhotoButtonFromURL(context,
            radius: radius,
            url: url,
            iconColor: iconColor,
            onPressed: onPressed);
      }
    }
    return getProfilePhotoButtonFromURL(context,
        url: null, radius: radius, iconColor: iconColor, onPressed: onPressed);
  }

  Widget getProfilePhotoButtonFromPublicMember(BuildContext context,
      {MemberPublicInfoModel? member,
      required double radius,
      RgbModel? iconColor,
      VoidCallback? onPressed}) {
    if (member != null) {
      var url = member.photoURL;
      if (url != null) {
        return getProfilePhotoButtonFromURL(context,
            url: url,
            radius: radius,
            iconColor: iconColor,
            onPressed: onPressed);
      }
    }
    return getProfilePhotoButtonFromURL(context,
        url: null, radius: radius, iconColor: iconColor, onPressed: onPressed);
  }

  Widget getProfilePhotoButtonFromExternalProvider(
      AppModel app, BuildContext context,
      {required ExternalProfileURLProvider externalProfileURLProvider,
      BackupProfileURLProvider? fallBackURLProvider,
      required double radius,
      RgbModel? iconColor,
      VoidCallback? onPressed}) {
    return FutureBuilder<ProfileAttributes>(
        future: externalProfileURLProvider(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var profileAttributes = snapshot.data;
            if ((profileAttributes == null) ||
                (profileAttributes.url == null)) {
              return _defaultProfile(iconColor, onPressed, radius);
            } else {
              return _formatProfilePhotoButton(
                  Image.network(profileAttributes.url!),
                  iconColor,
                  radius,
                  onPressed);
            }
          }
          return StyleRegistry.registry()
              .styleWithApp(app)
              .frontEndStyle()
              .progressIndicatorStyle()
              .progressIndicator(app, context);
        });
  }

  Widget getProfilePhotoButtonFromCurrentMember(BuildContext context,
      {RgbModel? iconColor, required double radius, VoidCallback? onPressed}) {
    var member = Apis.apis().getCoreApi().getMember(context);
    if (member != null) {
      return getProfilePhotoButtonFromURL(context,
          url: member.photoURL,
          radius: radius,
          iconColor: iconColor,
          onPressed: onPressed);
    } else {
      return getProfilePhotoButtonFromURL(context,
          url: null,
          radius: radius,
          iconColor: iconColor,
          onPressed: onPressed);
    }
  }

  Widget getProfilePhotoButtonFromURL(BuildContext context,
      {String? url,
      required double radius,
      RgbModel? iconColor,
      VoidCallback? onPressed}) {
    if (url != null) {
      return _formatProfilePhotoButton(
          Image.network(url), iconColor, radius, onPressed);
    } else {
      return _defaultProfile(iconColor, onPressed, radius);
    }
  }

  Widget _defaultProfile(
      RgbModel? color, VoidCallback? onPressed, double radius) {
//    return ;
    return _formatProfilePhotoButton(
        Container(
          color: Color.fromRGBO(0, 0, 0, 0),
          width: 50,
          height: 50,
          child: Icon(Icons.person_outline),
        ),
        color,
        radius,
        onPressed);
  }

  Widget _formatProfilePhotoButton(Widget widget, RgbModel? iconColor,
      double radius, VoidCallback? onPressed) {
    return GestureDetector(
        onTap: onPressed,
        child: CircleAvatar(
            radius: radius,
            backgroundColor: iconColor == null
                ? Colors.black
                : RgbHelper.color(rgbo: iconColor), // border color
            child: CircleAvatar(
              radius: radius - 2,
              backgroundColor: Colors.white, // background color
              child: CircleAvatar(
                radius: radius - 4,
                backgroundColor: Colors.transparent,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: widget,
                ),
              ),
            )));
  }
}
