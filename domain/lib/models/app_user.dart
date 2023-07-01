class AppUser {
  final String id;
  final String aud;
  final String? createdAt;
  final String? phoneNumber;
  final String? role;
  final String? lastSignInAt;

  AppUser({
    required this.id,
    required this.aud,
    this.createdAt,
    this.phoneNumber,
    this.role,
    this.lastSignInAt,
  });

  factory AppUser.fromJson(Map<String, dynamic> json) {
    return AppUser(
      id: json['id'],
      aud: json['aud'],
      role: json['role'],
      phoneNumber: json['phone_number'],
      // lastSignInAt: json['last_sign_in_at'],
      createdAt: json['created_at'],
    );
  }
}
