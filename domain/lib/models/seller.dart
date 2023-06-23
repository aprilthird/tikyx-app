class Seller {
  final int id;
  final String name;
  final String? profileImageUrl;
  final int userId;
  final int? referralId;
  final String genderId;
  final String nationalityId;
  final String workCity;
  final String type;
  final String? idFrontImageUrl;
  final String? idBackImageUrl;
  final bool verified;
  final String createdAt;

  Seller({
    required this.id,
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
    required this.verified,
    required this.createdAt,
  });

  factory Seller.fromJson(Map<String, dynamic> json) {
    return Seller(
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
  }
}
