import 'package:remote/config/api.dart';
import 'package:remote/helpers/api.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  static Future<Session> signInDevelopment(String phoneNumber) async {
    var apiInstance = await ApiInstance.getInstance();
    var client = apiInstance.getClient();
    var response = await client.auth.signInWithPassword(
      password: "jeffreyrm96",
      email: "jeffreyrm96@gmail.com",
    );
    // await client.auth.signInWithOtp();
    // await client.auth.verifyOTP(token: token, type: type);
    return response.session!;
  }

  static Future<void> signIn(String phoneNumber) async {
    var apiInstance = await ApiInstance.getInstance();
    var client = apiInstance.getClient();
    await client.auth.signInWithOtp(
      phone: phoneNumber,
    );
  }

  static Future<User> signUp(String phoneNumber) async {
    var apiInstance = await ApiInstance.getInstance();
    var client = apiInstance.getClient();
    var response = await client.auth.signUp(
      phone: phoneNumber,
      password: "password",
    );
    return response.user!;
  }

  static Future<Session> verifyOTP(String phoneNumber, String token) async {
    var apiInstance = await ApiInstance.getInstance();
    var client = apiInstance.getClient();
    var response = await client.auth
        .verifyOTP(token: token, phone: phoneNumber, type: OtpType.sms);
    return response.session!;
  }
}
