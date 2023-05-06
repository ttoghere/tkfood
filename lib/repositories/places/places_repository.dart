import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tkfood/models/place_autocomplete_model.dart';
import 'package:tkfood/models/place_model.dart';
import 'package:tkfood/repositories/places/base_places_repository.dart';

class PlacesRepository extends BasePlacesRepository {
  final String types = "geocode";
  final String androidMapsAPI = "AIzaSyByxhuIcCMjdV7T9dAB2P7iBMDLKCu7cjs";
  final String iosMapsAPI = "AIzaSyD3jONC01yeNiocqmNVr63uF5QqENL9P5c";

  @override
  Future<List<PlaceAutocomplete>> getAutocomplete(String searchInput) async {
    final String url =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$searchInput&types=$types&key=$iosMapsAPI';

    var response = await http.get(Uri.parse(url));
    var json = jsonDecode(response.body);
    var results = json['predictions'] as List;

    return results.map((place) => PlaceAutocomplete.fromJson(place)).toList();
  }

  @override
  Future<Place> getPlace(String placeId) async {
    final String url =
        'https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=$iosMapsAPI';

    var response = await http.get(Uri.parse(url));
    var json = jsonDecode(response.body);
    var results = json['result'] as Map<String, dynamic>;

    return Place.fromJson(results);
  }
}
