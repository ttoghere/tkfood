import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tkfood/models/models.dart';
import 'package:tkfood/repositories/restaurant/restaurant_repository.dart';

part 'restaurant_event.dart';
part 'restaurant_state.dart';

class RestaurantBloc extends Bloc<RestaurantEvent, RestaurantState> {
  final RestaurantRepository _restaurantRepository;
  StreamSubscription? _restaurantSubscrpition;
  RestaurantBloc({required RestaurantRepository restaurantRepository})
      : _restaurantRepository = restaurantRepository,
        super(RestaurantLoading()) {
    on<LoadRestaurants>(_onLoadRestaurants);
    _restaurantSubscrpition = _restaurantRepository
        .getRestaurants()
        .listen((restaurants) => add(LoadRestaurants(restaurants)));
  }

  void _onLoadRestaurants(
      LoadRestaurants event, Emitter<RestaurantState> emit) {
    emit(RestaurantLoaded(event.restaurants));
  }

  @override
  Future<void> close() {
    _restaurantSubscrpition?.cancel();
    return super.close();
  }
}
