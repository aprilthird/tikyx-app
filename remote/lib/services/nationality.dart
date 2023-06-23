import 'package:remote/helpers/api.dart';
import 'package:domain/models/nationality.dart';

class NationalityService {
  static const tableName = "nationality";

  static Future<List<Nationality>> getAll() async {
    var apiInstance = await ApiInstance.getInstance();
    var client = apiInstance.getClient();
    final objectsList =
        await client.from(tableName).select<List<Map<String, dynamic>>>();
    final List<Nationality> resultList = [];
    for (var object in objectsList) {
      resultList.add(Nationality.fromJson(object));
    }
    return resultList;
  }
}
