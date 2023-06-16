import 'package:shared_preferences/shared_preferences.dart';

class TokenStorage {
  static const String accessTokenKey = "ACCESS_TOKEN";

  static Future saveAccessToken(String accessToken) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(accessTokenKey, accessToken);
  }

  static Future<String?> getAccessToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final accessToken = prefs.getString(accessTokenKey);
    return accessToken;
  }
}
