import 'dart:developer';

import 'package:domain/models/commission.dart';
import 'package:remote/services/commission.dart';

class CommissionRepository {
  static Future<List<Commission>> getAll() async {
    try {
      return CommissionService.getAll();
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
