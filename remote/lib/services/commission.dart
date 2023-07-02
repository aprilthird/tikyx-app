import 'package:domain/models/commission.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CommissionService {
  static const tableName = "commissions";

  static Future<List<Commission>> getAll() async {
    var client = Supabase.instance.client;
    final objectsList = await client.from(tableName).select();
    final List<Commission> resultList = [];
    for (var object in objectsList) {
      resultList.add(Commission.fromJson(object));
    }
    return resultList;
  }
}
