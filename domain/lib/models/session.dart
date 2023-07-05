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

  factory Session.fromJson(Map<String, dynamic> json) {
    return Session(
      accessToken: json['access_token'],
      refreshToken: json['refresh_token'],
      expiresIn: json['expires_in'],
      expiresAt: json['expires_at'],
      tokenType: json['token_type'],
      providerToken: json['provider_token'],
      providerRefreshToken: json['provider_refresh_token'],
      user: AppUser.fromJson(json['user']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'access_token': accessToken,
      'refresh_token': refreshToken,
      'expires_in': expiresIn,
      'expires_at': expiresAt,
      'token_type': tokenType,
      'provider_token': providerToken,
      'provider_refresh_token': providerRefreshToken,
      'user': user.toJson(),
    };
  }
}
