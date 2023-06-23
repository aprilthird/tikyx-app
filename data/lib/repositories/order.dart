import 'dart:developer';

import 'package:domain/models/order.dart';
import 'package:remote/services/order.dart';

class OrderRepository {
  static Future<List<Order>> getAll() async {
    try {
      return OrderService.getAll();
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
