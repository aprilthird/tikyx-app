import 'package:cross_file/cross_file.dart';
import 'package:domain/models/gender.dart';
import 'package:domain/models/nationality.dart';

class Seller {
  int? id;
  String name;
  String? profileImageUrl;
  String userId;
  int? referralId;
  int genderId;
  int nationalityId;
  String workCity;
  String type;
  String? idFrontImageUrl;
  String? idBackImageUrl;
  bool? verified;
  String? createdAt;
  Gender? gender;
  Nationality? nationality;

  XFile? profileImageFile;
  XFile? idFrontImageFile;
  XFile? idBackImageFile;

  Seller({
    this.id,
    required this.name,
    this.profileImageUrl,
    required this.userId,
    this.referralId,
    required this.genderId,
    required this.nationalityId,
    required this.workCity,
    required this.type,
    this.idFrontImageUrl,
    this.idBackImageUrl,
    this.verified,
    this.createdAt,
    this.gender,
    this.nationality,
  });

  factory Seller.fromJson(Map<String, dynamic> json) {
    final output = Seller(
      id: json['id'],
      name: json['name'],
      profileImageUrl: json['profile_image'],
      userId: json['id_user'],
      referralId: json['id_referral_of'],
      genderId: json['genre'],
      nationalityId: json['nationality'],
      workCity: json['work_city'],
      type: json['type'],
      idFrontImageUrl: json['photo_id_front'],
      idBackImageUrl: json['photo_id_back'],
      verified: json['verified'],
      createdAt: json['created_at'],
    );
    // if (json['genre'] != null) {
    //   output.gender = Gender(
    //     id: json['genre']['id'],
    //     name: json['genre']['name'],
    //     createdAt: json['genre']['created_at'],
    //   );
    // }
    // if (json['nationality'] != null) {
    //   output.nationality = Nationality(
    //     id: json['nationality']['id'],
    //     name: json['nationality']['name'],
    //     createdAt: json['nationality']['created_at'],
    //   );
    // }
    return output;
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'type': type,
      'id_user': userId,
      'genre': genderId,
      'nationality': nationalityId,
      'work_city': workCity,
      'id_referral_of': referralId,
      'profile_image': profileImageUrl,
      'photo_id_front': idFrontImageUrl,
      'photo_id_back': idBackImageUrl,
    };
  }
}
