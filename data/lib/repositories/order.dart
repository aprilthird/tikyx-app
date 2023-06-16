import 'package:domain/models/order.dart';
import 'package:remote/services/order.dart';

class OrderRepository {
  static Future<List<Order>> getAll() async {
    return OrderService.getAll();
  }
}
