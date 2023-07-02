import 'package:flutter/foundation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:cross_file/cross_file.dart';

class FileService {
  static Future<List<Bucket>> getBuckets() async {
    var client = Supabase.instance.client;
    var buckets = await client.storage.listBuckets();
    return buckets;
  }

  static Future<List<FileObject>> getFiles(String bucketName) async {
    var client = Supabase.instance.client;
    var files = await client.storage.from(bucketName).list();
    return files;
  }

  static Future<List<FileObject>> searchFile(
      String bucketName, String filePath) async {
    var client = Supabase.instance.client;
    var files = await client.storage.from(bucketName).list(
          searchOptions: SearchOptions(limit: 1, search: filePath),
        );
    return files;
  }

  static Future<String> uploadFileAndRetrievePublicUrl(
      String bucketName, String path, XFile file) async {
    var client = Supabase.instance.client;
    var fileBytes = await file.readAsBytes();
    await client.storage.from(bucketName).uploadBinary(path, fileBytes);
    return client.storage.from(bucketName).getPublicUrl(path);
  }

  static Future<String> uploadFile(
      String bucketName, String path, XFile file) async {
    var client = Supabase.instance.client;
    var fileBytes = await file.readAsBytes();
    return client.storage.from(bucketName).uploadBinary(path, fileBytes);
  }

  static Future<Uint8List> downloadFile(String bucketName, String path) async {
    var client = Supabase.instance.client;
    var fileBytes = await client.storage.from(bucketName).download(path);
    return fileBytes;
  }

  static Future<void> deleteFile(String bucketName, String path) async {
    var client = Supabase.instance.client;
    await client.storage.from(bucketName).remove([path]);
  }
}
