import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:domain/models/place_autocomplete.dart';
import 'package:domain/models/place_details.dart';
import 'package:remote/config/map.dart';

class MapService {
  static Future<List<PlaceAutocomplete>> getAutocompletePlaces(
      String search) async {
    final Map<String, dynamic> queries = {
      'input': search,
      'key': MapConfig.googleMapsApiKey,
    };
    final Map<String, String> headers = {
      "Access-Control-Allow-Origin": "*",
      'Content-Type': 'application/json',
      'Accept': '*/*'
    };
    final url = Uri.https(MapConfig.googleMapsApiUrl,
        MapConfig.googlePlacesAutocompletePath, queries);
    final response = await http.get(url, headers: headers);
    final List<PlaceAutocomplete> resultList = [];
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data['predictions'] != null) {
        final results = data['predictions'] as List<dynamic>;
        for (var object in results) {
          resultList.add(PlaceAutocomplete.fromJson(object));
        }
      }
    }
    return resultList;
  }

  static Future<PlaceDetails?> getPlaceDetails(String placeId) async {
    final Map<String, dynamic> queries = {
      'placeid': placeId,
      'fields': 'geometry',
      'key': MapConfig.googleMapsApiKey,
    };
    final url = Uri.https(
        MapConfig.googleMapsApiUrl, MapConfig.googlePlacesDetailsPath, queries);
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data['result'] != null) {
        final result = data['result'] as Map<String, dynamic>;
        if (result['geometry'] != null) {
          final geometry = result['geometry'] as Map<String, dynamic>;
          if (geometry['location'] != null) {
            final location = geometry['location'] as Map<String, dynamic>;
            return PlaceDetails.fromJson(location);
          }
        }
      }
    }
    return null;
  }
}
