class PlaceAutocomplete {
  final String description;
  final String placeId;
  final String reference;
  String? mainText;
  String? secondaryText;

  PlaceAutocomplete({
    required this.description,
    required this.placeId,
    required this.reference,
    this.mainText,
    this.secondaryText,
  });

  factory PlaceAutocomplete.fromJson(Map<String, dynamic> json) {
    final output = PlaceAutocomplete(
      description: json['description'],
      placeId: json['place_id'],
      reference: json['reference'],
    );
    if (json['structured_formatting'] != null) {
      output.mainText = json['structured_formatting']['main_text'];
      output.secondaryText = json['structured_formatting']['secondary_text'];
    }
    return output;
  }
}
