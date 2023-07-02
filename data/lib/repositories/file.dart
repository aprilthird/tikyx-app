import 'dart:developer';
import 'dart:typed_data';

import 'package:remote/services/file.dart';
import 'package:cross_file/cross_file.dart';

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

  static Future<void> searchFile(String bucketName, String filePath) async {
    try {
      var files = await FileService.searchFile(bucketName, filePath);
      for (var file in files) {
        log("${file.id} ${file.name} ${file.createdAt}");
      }
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  static Future<String> uploadFile(
      String bucketName, String path, XFile file) async {
    try {
      var publicUrl = await FileService.uploadFile(bucketName, path, file);
      return publicUrl;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  static Future<String> uploadFileAndRetrievePublicUrl(
      String bucketName, String path, XFile file) async {
    try {
      var publicUrl = await FileService.uploadFileAndRetrievePublicUrl(
          bucketName, path, file);
      return publicUrl;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  static Future<Uint8List> downloadFile(String bucketName, String path) async {
    try {
      var fileBytes = await FileService.downloadFile(bucketName, path);
      return fileBytes;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  static Future<void> deleteFile(String bucketName, String path) async {
    try {
      await FileService.deleteFile(bucketName, path);
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
