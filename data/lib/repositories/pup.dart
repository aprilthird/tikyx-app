import 'dart:developer';

import 'package:domain/models/pup.dart';
import 'package:remote/services/pup.dart';

class PupRepository {
  static Future<List<Pup>> getAll() async {
    try {
      return PupService.getAll();
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  static Future<Pup> create(Pup pup) async {
    try {
      return PupService.create(pup);
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  static Future<Pup> update(Pup pup) async {
    try {
      return PupService.update(pup);
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
