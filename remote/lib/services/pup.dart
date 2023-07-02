import 'package:domain/models/pup.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class PupService {
  static const tableName = "pups";

  static Future<List<Pup>> getAll() async {
    final client = Supabase.instance.client;
    final objectsList = await client.from(tableName).select();
    final List<Pup> resultList = [];
    for (var object in objectsList) {
      resultList.add(Pup.fromJson(object));
    }
    return resultList;
  }

  static Future<Pup> create(Pup pup) async {
    final client = Supabase.instance.client;
    final objectsList = await client.from(tableName).insert(pup).select();
    return Pup.fromJson(objectsList[0]);
  }

  static Future<Pup> update(Pup pup) async {
    final client = Supabase.instance.client;
    final objectsList = await client
        .from(tableName)
        .update(pup.toJson())
        .eq('id', pup.id)
        .select();
    return Pup.fromJson(objectsList[0]);
  }
}
