import 'dart:developer';

import 'package:domain/models/gender.dart';
import 'package:remote/services/gender.dart';

class GenderRepository {
  static Future<List<Gender>> getAll() async {
    try {
      return GenderService.getAll();
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  static Future<Gender> getById(int id) async {
    try {
      return GenderService.getById(id);
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
