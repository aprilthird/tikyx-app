import 'package:remote/helpers/api.dart';
import 'package:domain/models/gender.dart';

class GenderService {
  static const tableName = "genre";

  static Future<List<Gender>> getAll() async {
    var apiInstance = await ApiInstance.getInstance();
    var client = apiInstance.getClient();
    final objectsList =
        await client.from(tableName).select<List<Map<String, dynamic>>>();
    final List<Gender> resultList = [];
    for (var object in objectsList) {
      resultList.add(Gender.fromJson(object));
    }
    return resultList;
  }
}
