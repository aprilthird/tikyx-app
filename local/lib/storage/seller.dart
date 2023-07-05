import 'dart:convert';

import 'package:domain/models/seller.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SellerStorage {
  static const String currentSellerKey = "CURRENT_SELLER";

  static Future saveCurrentSeller(Seller seller) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final jsonString = jsonEncode(seller.toJson());
    await prefs.setString(currentSellerKey, jsonString);
  }

  static Future<Seller?> getCurrentSeller() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(currentSellerKey);
    if (jsonString != null) {
      final jsonObject = jsonDecode(jsonString);
      final seller = Seller.fromJson(jsonObject);
      return seller;
    }
    return null;
  }
}
