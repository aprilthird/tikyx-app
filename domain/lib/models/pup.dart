class Pup {
  final int id;
  final String ownerId;
  final String address;
  final double latitude;
  final double longitude;
  final String? authImageUrl;
  final String? locationImage1Url;
  final String? locationImage2Url;
  final String? locationImage3Url;
  final String? locationImage4Url;
  final String createdAt;

  Pup({
    required this.id,
    required this.ownerId,
    required this.address,
    required this.latitude,
    required this.longitude,
    this.authImageUrl,
    this.locationImage1Url,
    this.locationImage2Url,
    this.locationImage3Url,
    this.locationImage4Url,
    required this.createdAt,
  });

  factory Pup.fromJson(Map<String, dynamic> json) {
    return Pup(
      id: json['id'],
      ownerId: json['id_owner'],
      address: json['address'],
      longitude: json['loc_long'],
      latitude: json['loc_lat'],
      authImageUrl: json['photo_munic'],
      locationImage1Url: json['photo_pup_1'],
      locationImage2Url: json['photo_pup_2'],
      locationImage3Url: json['photo_pup_3'],
      locationImage4Url: json['photo_pup_4'],
      createdAt: json['created_at'],
    );
  }
}
