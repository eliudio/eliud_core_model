import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:eliud_core_model/apis/medium/medium_api.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:http/http.dart' as http;
import 'package:tuple/tuple.dart';

import '../etc/random.dart';
import 'basename_helper.dart';

class UploadInfo {
  final String url;
  final String ref;

  UploadInfo(this.url, this.ref);

  @override
  String toString() {
    return 'UploadInfo($url, $ref)';
  }

  /*
   * Upload member data to firebase storage
   */
  static Future<UploadInfo?> uploadData(
    String baseName,
    Uint8List fileData,
    String appId,
    String ownerId,
    String packageName,
    Map<String, String> customMetaData, {
    FeedbackProgress? feedbackProgress,
  }) async {
    return _uploadData(
      baseName,
      fileData,
      appId,
      ownerId,
      packageName,
      ownerId,
      customMetaData,
      feedbackProgress: feedbackProgress,
    );
  }

  /*
   * Upload temp data to firebase storage
   */
  static Future<UploadInfo?> uploadTempData(Uint8List fileData, String appId,
      String ownerId, String packageName, Map<String, String> customMetaData,
      {FeedbackProgress? feedbackProgress}) async {
    return _uploadData(newRandomKey(), fileData, appId, 'temp', packageName,
        ownerId, customMetaData,
        feedbackProgress: feedbackProgress);
  }

  /*
   * Upload data to firebase storage
   *
   * Usage: When you need to upload data (Uint8List) to firebase storage
   */
  static Future<UploadInfo?> _uploadData(
      String baseName,
      Uint8List fileData,
      String appId,
      String directory,
      String packageName,
      String ownerId,
      Map<String, String> customMetaData,
      {FeedbackProgress? feedbackProgress}) async {
    try {
      var ref = '$appId/$packageName/$directory/$baseName';
      var uploadTask = firebase_storage.FirebaseStorage.instance
          .ref(ref)
          .putData(
              fileData,
              firebase_storage.SettableMetadata(
                  customMetadata: customMetaData));
      uploadTask.snapshotEvents.listen((event) {
        if (feedbackProgress != null) {
          feedbackProgress(event.bytesTransferred / event.totalBytes);
        }
      });
      var uploadedTask = await uploadTask;
      var url = await uploadedTask.ref.getDownloadURL();
      return UploadInfo(url, ref);
    } on firebase_storage.FirebaseException catch (e) {
      throw Exception(
          'Exception during file upload. code = $e.code,  message = $e.message');
    }
  }

  /*
   * Upload a file to firebase storage
   *
   * Usage: When you need to upload a file to firebase storage
   *
   * domain is required for uploading files from a webapp
   *
   * returns tuple of
   * UploadInfo and
   * Uint8List: the bytes representation of the file
   */
  static Future<Tuple2<UploadInfo, Uint8List>> uploadFile(
      String memberMediumDocumentID,
      String filePath,
      String appId,
      String ownerId,
      String packageName,
      Map<String, String> customMetaData,
      {String? homeURL,
      FeedbackProgress? feedbackProgress}) async {
//    var file = File(filePath);
    try {
      var baseName = BaseNameHelper.baseName(memberMediumDocumentID, filePath);
      print('baseName = $baseName');
      var ref = '$appId/$packageName/$ownerId/$baseName';

      firebase_storage.UploadTask uploadTask;
      Uint8List bytes;
      if (kIsWeb) {
        // todo: make parameter
        var myUri =
            Uri.parse('${homeURL ?? 'https://minkey.io'}/assets/$filePath');
        final response = await http.get(myUri);
        print('uploadTask = ');
        bytes = response.bodyBytes;
      } else {
        bytes = File(filePath).readAsBytesSync();
      }
      uploadTask = firebase_storage.FirebaseStorage.instance.ref(ref).putData(
          bytes,
          firebase_storage.SettableMetadata(customMetadata: customMetaData));
      uploadTask.snapshotEvents.listen((event) {
        if (feedbackProgress != null) {
          feedbackProgress(event.bytesTransferred / event.totalBytes);
        }
      });
      var uploadedTask = await uploadTask;
      var url = await uploadedTask.ref.getDownloadURL();
      var uploadInfo = UploadInfo(url, ref);
      return Tuple2(uploadInfo, bytes);
    } on firebase_storage.FirebaseException catch (e) {
      throw Exception(
          'Exception during file upload. code = $e.code,  message = $e.message');
    }
  }
}
