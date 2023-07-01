import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  static Future<Session> signInDevelopment(String phoneNumber) async {
    final client = Supabase.instance.client;
    var response = await client.auth.signInWithPassword(
      password: "jeffreyrm96",
      email: "jeffreyrm96@gmail.com",
    );
    // await client.auth.signInWithOtp();
    // await client.auth.verifyOTP(token: token, type: type);
    return response.session!;
  }

  static Future<void> signIn(String phoneNumber) async {
    final client = Supabase.instance.client;
    await client.auth.signInWithOtp(
      phone: phoneNumber,
    );
  }

  static Future<User> signUp(String phoneNumber) async {
    final client = Supabase.instance.client;
    var response = await client.auth.signUp(
      phone: phoneNumber,
      password: "password",
    );
    return response.user!;
  }

  static Future<Session> verifyOTP(String phoneNumber, String token) async {
    final client = Supabase.instance.client;
    var response = await client.auth
        .verifyOTP(token: token, phone: phoneNumber, type: OtpType.sms);
    return response.session!;
  }

  static Future<void> signOut() async {
    final client = Supabase.instance.client;
    await client.auth.signOut();
  }
}
