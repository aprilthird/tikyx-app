import 'dart:io';

import 'package:remote/helpers/api.dart';
import 'package:domain/models/order.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class FileService {
  static Future<List<Bucket>> getBuckets() async {
    var apiInstance = await ApiInstance.getInstance();
    var client = apiInstance.getClient();
    var buckets = await client.storage.listBuckets();
    return buckets;
  }

  static Future<List<FileObject>> getFiles(String bucketName) async {
    var apiInstance = await ApiInstance.getInstance();
    var client = apiInstance.getClient();
    var files = await client.storage.from(bucketName).list();
    return files;
  }

  static Future<String> uploadFile(
      String bucketName, String path, File file) async {
    var apiInstance = await ApiInstance.getInstance();
    var client = apiInstance.getClient();
    await client.storage.from(bucketName).upload(path, file);
    return client.storage.from(bucketName).getPublicUrl(path);
  }
}
