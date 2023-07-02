import 'package:domain/models/order.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class OrderService {
  static const tableName = "orders";

  static Future<List<Order>> getAll() async {
    var client = Supabase.instance.client;
    final objectsList = await client.from(tableName).select();
    final List<Order> resultList = [];
    for (var object in objectsList) {
      resultList.add(Order.fromJson(object));
    }
    return resultList;
  }
}
