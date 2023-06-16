import 'dart:developer';

import 'package:domain/models/user.dart';
import 'package:flutter/services.dart';
import 'package:local/storage/token.dart';
import 'package:local/storage/user.dart';
import 'package:remote/services/auth.dart';

class AuthRepository {
  static Future signIn(String phoneNumber) async {
    try {
      final session = await AuthService.signIn(phoneNumber);
      await TokenStorage.saveAccessToken(session.accessToken);
      final user = User(
        id: session.user.id,
        aud: session.user.aud,
        createdAt: session.user.createdAt,
        email: session.user.email,
        phoneNumber: session.user.phone,
        role: session.user.role,
        lastSignInAt: session.user.lastSignInAt,
      );
      await UserStorage.saveCurrentUser(user);
    } catch (e) {
      log(e.toString());
    }
  }
}
