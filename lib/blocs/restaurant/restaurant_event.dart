part of 'restaurant_bloc.dart';

abstract class RestaurantEvent extends Equatable {
  const RestaurantEvent();

  @override
  List<Object> get props => [];
}

class LoadRestaurants extends RestaurantEvent {
  final List<Restaurant> restaurants;
  LoadRestaurants(this.restaurants);
  @override
  // TODO: implement props
  List<Object> get props => [restaurants];
}
