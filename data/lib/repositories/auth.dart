import 'dart:developer';

import 'package:data/repositories/seller.dart';
import 'package:domain/models/app_user.dart';
import 'package:domain/models/session.dart';
import 'package:flutter/services.dart';
import 'package:local/storage/session.dart';
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
        user: AppUser(
          id: result.user.id,
          aud: result.user.aud,
          phoneNumber: result.user.phone,
          role: result.user.role,
          lastSignInAt: result.user.lastSignInAt,
          createdAt: result.user.createdAt,
        ),
      );
      await SessionStorage.saveCurrentSession(session);
      await SellerRepository.getBySignedUserId(session.user.id);
      return session;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  static Future<bool> signIn(String phoneNumber) async {
    try {
      await AuthService.signIn(phoneNumber);
      return true;
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
        user: AppUser(
          id: result.user.id,
          aud: result.user.aud,
          phoneNumber: result.user.phone,
          role: result.user.role,
          lastSignInAt: result.user.lastSignInAt,
          createdAt: result.user.createdAt,
        ),
      );
      await SessionStorage.saveCurrentSession(session);
      return session;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  static Future<AppUser> signUp(String phoneNumber) async {
    try {
      final result = await AuthService.signUp(phoneNumber);
      return AppUser(
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

  static Future<void> signOut() async {
    try {
      await AuthService.signOut();
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  static Future<Session?> getCurrentSession() async {
    try {
      final session = SessionStorage.getCurrentSession();
      return session;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
