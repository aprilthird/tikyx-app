import 'package:remote/helpers/api.dart';
import 'package:domain/models/commission.dart';

class CommissionService {
  static const tableName = "commissions";

  static Future<List<Commission>> getAll() async {
    var apiInstance = await ApiInstance.getInstance();
    var client = apiInstance.getClient();
    final objectsList =
        await client.from(tableName).select<List<Map<String, dynamic>>>();
    final List<Commission> resultList = [];
    for (var object in objectsList) {
      resultList.add(Commission.fromJson(object));
    }
    return resultList;
  }
}
