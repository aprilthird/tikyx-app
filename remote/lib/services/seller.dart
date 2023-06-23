import 'package:domain/models/seller.dart';
import 'package:remote/helpers/api.dart';

class SellerService {
  static const tableName = "sellers";

  static Future<Seller?> getByUserId(String userId) async {
    var apiInstance = await ApiInstance.getInstance();
    var client = apiInstance.getClient();
    final objectsList = await client
        .from(tableName)
        .select<List<Map<String, dynamic>>>()
        .eq('user_id', userId);
    if (objectsList.isNotEmpty) {
      return Seller.fromJson(objectsList[0]);
    }
    return null;
  }
}
