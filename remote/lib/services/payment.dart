import 'package:remote/helpers/api.dart';
import 'package:domain/models/payment.dart';

class PaymentService {
  static const tableName = "payments";

  static Future<List<Payment>> getAll() async {
    var apiInstance = await ApiInstance.getInstance();
    var client = apiInstance.getClient();
    final objectsList =
        await client.from(tableName).select<List<Map<String, dynamic>>>();
    final List<Payment> resultList = [];
    for (var object in objectsList) {
      resultList.add(Payment.fromJson(object));
    }
    return resultList;
  }
}
