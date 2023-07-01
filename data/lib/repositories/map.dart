import 'dart:developer';

import 'package:domain/models/place_autocomplete.dart';
import 'package:domain/models/place_details.dart';
import 'package:remote/services/map.dart';

class MapRepository {
  static Future<List<PlaceAutocomplete>> getAutocompletePlaces(
      String search) async {
    try {
      return await MapService.getAutocompletePlaces(search);
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  static Future<PlaceDetails?> getPlaceDetails(String placeId) async {
    try {
      return await MapService.getPlaceDetails(placeId);
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
