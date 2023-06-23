import 'dart:developer';
import 'dart:io';

import 'package:remote/services/file.dart';

class FileRepository {
  static Future<void> getBuckets() async {
    try {
      var buckets = await FileService.getBuckets();
      for (var bucket in buckets) {
        log("${bucket.id} ${bucket.name} ${bucket.createdAt}");
      }
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  static Future<void> getFiles(String bucketName) async {
    try {
      var files = await FileService.getFiles(bucketName);
      for (var file in files) {
        log("${file.id} ${file.name} ${file.createdAt}");
      }
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  static Future<String> uploadFile(
      String bucketName, String path, File file) async {
    try {
      var publicUrl = await FileService.uploadFile(bucketName, path, file);
      log(publicUrl);
      return publicUrl;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
