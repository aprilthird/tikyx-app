import 'package:remote/helpers/api.dart';
import 'package:domain/models/order.dart';

class OrderService {
  static const orderTable = "orders";

  static Future<List<Order>> getAll() async {
    var apiInstance = await ApiInstance.getInstance();
    var client = apiInstance.getClient();
    final objectsList =
        await client.from(orderTable).select<List<Map<String, dynamic>>>();
    final List<Order> ordersList = [];
    for (var object in objectsList) {
      ordersList.add(Order.fromJson(object));
    }
    return ordersList;
  }
}
