class Nationality {
  final int id;
  final String name;
  final String createdAt;

  Nationality({
    required this.id,
    required this.name,
    required this.createdAt,
  });

  factory Nationality.fromJson(Map<String, dynamic> json) {
    return Nationality(
      id: json['id'],
      name: json['name'],
      createdAt: json['created_at'],
    );
  }
}
