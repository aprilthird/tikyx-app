import 'package:domain/models/seller.dart';
import 'package:domain/models/app_user.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SellerService {
  static const tableName = "sellers";

  static Future<List<Seller>> getAll() async {
    var client = Supabase.instance.client;
    final objectsList = await client.from(tableName).select();
    final List<Seller> resultList = [];
    for (var object in objectsList) {
      resultList.add(Seller.fromJson(object));
    }
    return resultList;
  }

  static Future<List<Seller>> searchByName(String name) async {
    var client = Supabase.instance.client;
    final objectsList =
        await client.from(tableName).select().like('name', "%$name%");
    final List<Seller> resultList = [];
    for (var object in objectsList) {
      resultList.add(Seller.fromJson(object));
    }
    return resultList;
  }

  static Future<List<AppUser>> searchByPhoneNumber(String phoneNumber) async {
    var client = Supabase.instance.client;
    final objectsList = await client.from('profiles').select();
    final List<AppUser> resultList = [];
    for (var object in objectsList) {
      resultList.add(AppUser.fromJson(object));
    }
    return resultList;
  }

  static Future<Seller?> getByUserId(String userId) async {
    var client = Supabase.instance.client;
    final objectsList =
        await client.from(tableName).select().eq('id_user', userId);
    if (objectsList.isNotEmpty) {
      return Seller.fromJson(objectsList[0]);
    }
    return null;
  }

  static Future<Seller> create(Seller seller) async {
    var client = Supabase.instance.client;
    final objectsList = await client.from(tableName).insert(seller).select();
    return Seller.fromJson(objectsList[0]);
  }

  static Future<Seller> update(Seller seller) async {
    final client = Supabase.instance.client;
    final objectsList = await client
        .from(tableName)
        .update(seller.toJson())
        .eq('id', seller.id)
        .select();
    return Seller.fromJson(objectsList[0]);
  }
}
