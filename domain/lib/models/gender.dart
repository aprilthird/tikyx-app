class Gender {
  final String id;
  final String name;
  final String createdAt;

  Gender({
    required this.id,
    required this.name,
    required this.createdAt,
  });

  factory Gender.fromJson(Map<String, dynamic> json) {
    return Gender(
      id: json['id'],
      name: json['name'],
      createdAt: json['created_at'],
    );
  }
}
