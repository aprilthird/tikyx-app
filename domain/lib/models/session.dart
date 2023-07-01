import 'package:domain/models/app_user.dart';

class Session {
  final String accessToken;
  final String? refreshToken;
  final int? expiresIn;
  final int? expiresAt;
  final String? tokenType;
  final String? providerToken;
  final String? providerRefreshToken;
  final AppUser user;

  Session({
    required this.accessToken,
    this.refreshToken,
    this.expiresIn,
    this.expiresAt,
    required this.tokenType,
    this.providerToken,
    this.providerRefreshToken,
    required this.user,
  });
}
