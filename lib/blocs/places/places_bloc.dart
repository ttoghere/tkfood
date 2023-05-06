import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tkfood/models/place_model.dart';
import 'package:tkfood/repositories/places/places_repository.dart';

part 'places_event.dart';
part 'places_state.dart';

class PlaceBloc extends Bloc<PlaceEvent, PlaceState> {
  final PlacesRepository _placesRepository;
  StreamSubscription? _placesSubscription;

  PlaceBloc({required PlacesRepository placesRepository})
      : _placesRepository = placesRepository,
        super(PlaceLoading());

  @override
  Stream<PlaceState> mapEventToState(
    PlaceEvent event,
  ) async* {
    if (event is LoadPlace) {
      yield* _mapLoadPlaceToState(event);
    }
  }

  Stream<PlaceState> _mapLoadPlaceToState(LoadPlace event) async* {
    yield PlaceLoading();
    try {
      _placesSubscription?.cancel();
      final Place place = await _placesRepository.getPlace(event.placeId);
      yield PlaceLoaded(place: place);
    } catch (_) {}
  }

  @override
  Future<void> close() {
    _placesSubscription?.cancel();
    return super.close();
  }
}
