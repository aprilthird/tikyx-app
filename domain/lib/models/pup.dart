import 'package:cross_file/cross_file.dart';

class Pup {
  int? id;
  int? ownerId;
  String address;
  double latitude;
  double longitude;
  String? authImageUrl;
  String? locationImage1Url;
  String? locationImage2Url;
  String? locationImage3Url;
  String? locationImage4Url;
  String? createdAt;

  XFile? authImageFile;
  XFile? locationImageFile1;
  XFile? locationImageFile2;
  XFile? locationImageFile3;
  XFile? locationImageFile4;

  Pup({
    this.id,
    this.ownerId,
    required this.address,
    required this.latitude,
    required this.longitude,
    this.authImageUrl,
    this.locationImage1Url,
    this.locationImage2Url,
    this.locationImage3Url,
    this.locationImage4Url,
    this.createdAt,
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

  Map<String, dynamic> toJson() {
    return {
      'id_owner': ownerId,
      'address': address,
      'loc_lat': latitude,
      'loc_long': longitude,
      'photo_munic': authImageUrl,
      'photo_pup_1': locationImage1Url,
      'photo_pup_2': locationImage2Url,
      'photo_pup_3': locationImage3Url,
      'photo_pup_4': locationImage4Url,
    };
  }
}
