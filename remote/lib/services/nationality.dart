import 'package:remote/helpers/api.dart';
import 'package:domain/models/nationality.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class NationalityService {
  static const tableName = "nationality";

  static Future<List<Nationality>> getAll() async {
    var client = Supabase.instance.client;
    final objectsList = await client.from(tableName).select();
    final List<Nationality> resultList = [];
    for (var object in objectsList) {
      resultList.add(Nationality.fromJson(object));
    }
    return resultList;
  }

  static Future<Nationality> getById(int id) async {
    var client = Supabase.instance.client;
    final objectsList = await client.from(tableName).select().eq('id', id);
    return Nationality.fromJson(objectsList[0]);
  }
}
