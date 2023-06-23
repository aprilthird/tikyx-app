import 'package:domain/models/user.dart';

class Session {
  final String accessToken;
  final String? refreshToken;
  final int? expiresIn;
  final int? expiresAt;
  final String? tokenType;
  final String? providerToken;
  final String? providerRefreshToken;
  final User user;

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
