import 'dart:typed_data';
import 'package:eliud_core_model/model/app_model.dart';
import 'package:eliud_core_model/model/member_medium_model.dart';
import 'package:eliud_core_model/style/frontend/has_progress_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class MemberImageModelWidget extends StatefulWidget {
  final MemberMediumModel memberMediumModel;
  final double? width;
  final double? height;
  final bool showThumbnail;
  final Widget? defaultWidget;

  const MemberImageModelWidget({
    super.key,
    required this.memberMediumModel,
    this.width,
    this.height,
    required this.showThumbnail,
    this.defaultWidget,
  });

  @override
  State<StatefulWidget> createState() {
    return _MemberImageModelState();
  }
}

class _MemberImageModelState extends State<MemberImageModelWidget> {
  @override
  Widget build(BuildContext context) {
    String? url;
    if (widget.showThumbnail) {
      url = widget.memberMediumModel.urlThumbnail;
    } else {
      url = widget.memberMediumModel.url;
    }
    if (url == null) {
      if (widget.defaultWidget != null) {
        return widget.defaultWidget!;
      }
    } else {
      return Image.network(
        url,
        width: widget.width,
        height: widget.height,
      );
    }
    throw Exception("Could not determine url");
  }
}

// This doesn't seem to work as it seems sometimes the wrong image is picked up. Weird
class FbStorageImageDoesntWork extends StatefulWidget {
  final AppModel app;
  final String ref;
  final double? width;
  final double? height;

  const FbStorageImageDoesntWork({
    super.key,
    required this.app,
    required this.ref,
    this.width,
    this.height,
  });

  @override
  State<StatefulWidget> createState() {
    return _FbStorageImageState();
  }
}

class _FbStorageImageState extends State<FbStorageImageDoesntWork> {
  Future<Uint8List?>? future;

  @override
  void initState() {
    future =
        firebase_storage.FirebaseStorage.instance.ref(widget.ref).getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Uint8List?>(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data != null) {
              return Image.memory(
                snapshot.data!,
                width: widget.width,
                height: widget.height,
              );
            } else {
              return Image.asset(
                  "assets/manypixels_co/404_Page_Not_Found _Flatline.png",
                  package: "eliud_pkg_feed");
            }
          }
          return progressIndicator(widget.app, context);
        });
  }
}
