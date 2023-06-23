import 'dart:developer';

import 'package:domain/models/nationality.dart';
import 'package:remote/services/nationality.dart';

class NationalityRepository {
  static Future<List<Nationality>> getAll() async {
    try {
      return NationalityService.getAll();
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
