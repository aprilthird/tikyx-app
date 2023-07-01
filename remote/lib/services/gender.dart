import 'package:domain/models/gender.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class GenderService {
  static const tableName = "genre";

  static Future<List<Gender>> getAll() async {
    var client = Supabase.instance.client;
    final objectsList = await client.from(tableName).select();
    final List<Gender> resultList = [];
    for (var object in objectsList) {
      resultList.add(Gender.fromJson(object));
    }
    return resultList;
  }

  static Future<Gender> getById(int id) async {
    var client = Supabase.instance.client;
    final objectsList = await client.from(tableName).select().eq('id', id);
    return Gender.fromJson(objectsList[0]);
  }
}
