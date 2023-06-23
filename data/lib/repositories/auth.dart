import 'dart:developer';

import 'package:domain/models/user.dart';
import 'package:domain/models/session.dart';
import 'package:flutter/services.dart';
import 'package:local/storage/token.dart';
import 'package:local/storage/user.dart';
import 'package:remote/services/auth.dart';

class AuthRepository {
  static Future<Session> signInDevelopment(String phoneNumber) async {
    try {
      final result = await AuthService.signInDevelopment(phoneNumber);
      final session = Session(
        accessToken: result.accessToken,
        refreshToken: result.refreshToken,
        expiresIn: result.expiresIn,
        expiresAt: result.expiresAt,
        tokenType: result.tokenType,
        providerToken: result.providerToken,
        providerRefreshToken: result.providerRefreshToken,
        user: User(
          id: result.user.id,
          aud: result.user.aud,
          phoneNumber: result.user.phone,
          role: result.user.role,
          lastSignInAt: result.user.lastSignInAt,
          createdAt: result.user.createdAt,
        ),
      );
      await TokenStorage.saveAccessToken(session.accessToken);
      await UserStorage.saveCurrentUser(session.user);
      return session;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  static Future<void> signIn(String phoneNumber) async {
    try {
      await AuthService.signIn(phoneNumber);
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  static Future<Session> verifyOTP(String phoneNumber, String token) async {
    try {
      final result = await AuthService.verifyOTP(phoneNumber, token);
      final session = Session(
        accessToken: result.accessToken,
        refreshToken: result.refreshToken,
        expiresIn: result.expiresIn,
        expiresAt: result.expiresAt,
        tokenType: result.tokenType,
        providerToken: result.providerToken,
        providerRefreshToken: result.providerRefreshToken,
        user: User(
          id: result.user.id,
          aud: result.user.aud,
          phoneNumber: result.user.phone,
          role: result.user.role,
          lastSignInAt: result.user.lastSignInAt,
          createdAt: result.user.createdAt,
        ),
      );
      await TokenStorage.saveAccessToken(session.accessToken);
      await UserStorage.saveCurrentUser(session.user);
      return session;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  static Future<User> signUp(String phoneNumber) async {
    try {
      final result = await AuthService.signUp(phoneNumber);
      return User(
        id: result.id,
        aud: result.aud,
        createdAt: result.createdAt,
        phoneNumber: result.phone,
        role: result.role,
        lastSignInAt: result.lastSignInAt,
      );
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
