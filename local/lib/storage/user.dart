import 'package:domain/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserStorage {
  static const String idKey = "CURRENT_USER_ID";
  static const String audKey = "CURRENT_USER_AUD";
  static const String createdAtKey = "CURRENT_USER_CREATED_AT";
  static const String phoneNumberKey = "CURRENT_USER_PHONE";
  static const String roleKey = "CURRENT_USER_ROLE";
  static const String lastSignInAtKey = "CURRENT_USER_LAST_IN";

  static Future saveCurrentUser(User user) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(idKey, user.id);
    await prefs.setString(idKey, user.aud);
    await prefs.setString(idKey, user.createdAt);
    if (user.phoneNumber != null) {
      await prefs.setString(idKey, user.phoneNumber!);
    }
    if (user.role != null) {
      await prefs.setString(idKey, user.role!);
    }
    if (user.lastSignInAt != null) {
      await prefs.setString(idKey, user.lastSignInAt!);
    }
  }

  static Future<User?> getCurrentUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final id = prefs.getString(idKey);
    final aud = prefs.getString(audKey);
    final createdAt = prefs.getString(createdAtKey);
    final phoneNumber = prefs.getString(phoneNumberKey);
    final role = prefs.getString(roleKey);
    final lastSignInAt = prefs.getString(lastSignInAtKey);
    if (id != null && aud != null && createdAt != null) {
      var user = User(
        id: id,
        aud: aud,
        createdAt: createdAt,
        phoneNumber: phoneNumber,
        role: role,
        lastSignInAt: lastSignInAt,
      );
      return user;
    }
    return null;
  }
}
