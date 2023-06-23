import 'dart:developer';

import 'package:domain/models/payment.dart';
import 'package:remote/services/payment.dart';

class PaymentRepository {
  static Future<List<Payment>> getAll() async {
    try {
      return PaymentService.getAll();
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
