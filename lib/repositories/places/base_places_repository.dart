import 'package:tkfood/models/place_autocomplete_model.dart';
import 'package:tkfood/models/place_model.dart';

abstract class BasePlacesRepository {
  Future<List<PlaceAutocomplete>?> getAutocomplete(String searchInput);

  Future<Place?> getPlace(String placeId);
}
