import 'dart:developer';

import 'package:domain/models/seller.dart';
import 'package:remote/services/order.dart';
import 'package:remote/services/seller.dart';

class SellerRepository {
  static Future<Seller?> getByUserId(String userId) async {
    try {
      return SellerService.getByUserId(userId);
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
