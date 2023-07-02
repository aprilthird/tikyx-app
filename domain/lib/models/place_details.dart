class PlaceDetails {
  final double locationLatitude;
  final double locationLongitude;

  const PlaceDetails({
    required this.locationLatitude,
    required this.locationLongitude,
  });

  factory PlaceDetails.fromJson(Map<String, dynamic> json) {
    return PlaceDetails(
      locationLatitude: json['lat'],
      locationLongitude: json['lng'],
    );
  }
}
