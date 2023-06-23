import 'package:remote/helpers/api.dart';
import 'package:domain/models/order.dart';

class OrderService {
  static const tableName = "orders";

  static Future<List<Order>> getAll() async {
    var apiInstance = await ApiInstance.getInstance();
    var client = apiInstance.getClient();
    final objectsList =
        await client.from(tableName).select<List<Map<String, dynamic>>>();
    final List<Order> resultList = [];
    for (var object in objectsList) {
      resultList.add(Order.fromJson(object));
    }
    return resultList;
  }
}
