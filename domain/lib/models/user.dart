class User {
  final String id;
  final String aud;
  final String createdAt;
  final String? email;
  final String? phoneNumber;
  final String? role;
  final String? lastSignInAt;

  User({
    required this.id,
    required this.aud,
    required this.createdAt,
    this.email,
    this.phoneNumber,
    this.role,
    this.lastSignInAt,
  });
}
