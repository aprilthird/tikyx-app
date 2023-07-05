import 'dart:convert';

import 'package:domain/models/session.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SessionStorage {
  static const String currentSessionKey = "CURRENT_SESSION";

  static Future saveCurrentSession(Session session) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final jsonString = jsonEncode(session.toJson());
    await prefs.setString(currentSessionKey, jsonString);
  }

  static Future<Session?> getCurrentSession() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(currentSessionKey);
    if (jsonString != null) {
      final jsonObject = jsonDecode(jsonString);
      final session = Session.fromJson(jsonObject);
      return session;
    }
    return null;
  }
}
