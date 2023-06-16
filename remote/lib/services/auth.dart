import 'package:remote/config/api.dart';
import 'package:remote/helpers/api.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  static Future<Session> signIn(String phoneNumber) async {
    var apiInstance = await ApiInstance.getInstance();
    var client = apiInstance.getClient();
    var response = await client.auth.signInWithPassword(
      password: "123456",
      email: "jeffreyrm96@gmail.com",
    );
    return response.session!;
  }
}
