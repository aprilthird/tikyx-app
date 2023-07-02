import 'dart:developer';

import 'package:domain/models/seller.dart';
import 'package:domain/models/app_user.dart';
import 'package:remote/services/seller.dart';

class SellerRepository {
  static Future<List<Seller>> getAll() async {
    try {
      return SellerService.getAll();
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  static Future<Seller?> getByUserId(String userId) async {
    try {
      return SellerService.getByUserId(userId);
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  static Future<List<Seller>> searchByName(String name) async {
    try {
      return SellerService.searchByName(name);
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  static Future<List<AppUser>> searchByPhoneNumber(String phoneNumber) async {
    try {
      return SellerService.searchByPhoneNumber(phoneNumber);
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  static Future<Seller> create(Seller seller) async {
    try {
      return SellerService.create(seller);
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  static Future<Seller> update(Seller seller) async {
    try {
      return SellerService.update(seller);
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
