import 'package:domain/models/payment.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class PaymentService {
  static const tableName = "payments";

  static Future<List<Payment>> getAll() async {
    var client = Supabase.instance.client;
    final objectsList = await client.from(tableName).select();
    final List<Payment> resultList = [];
    for (var object in objectsList) {
      resultList.add(Payment.fromJson(object));
    }
    return resultList;
  }
}
