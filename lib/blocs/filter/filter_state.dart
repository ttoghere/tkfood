part of 'filter_bloc.dart';

abstract class FilterState extends Equatable {
  const FilterState();

  @override
  List<Object?> get props => [];
}

class FilterLoading extends FilterState {}

class FilterLoaded extends FilterState {
  final FilterFilter filter;
  final List<Restaurant>? filteredRestaurants;

  const FilterLoaded(
      {this.filter = const FilterFilter(),
      this.filteredRestaurants = const <Restaurant>[]});

  @override
  List<Object?> get props => [filter, filteredRestaurants];
}

/*
                      var categories = state.filter.categoryFilters
                          .where((element) => element.value)
                          .map((e) => e.category.name)
                          .toList();
                      var prices = state.filter.priceFilters
                          .where((element) => element.value)
                          .map((e) => e.price.price)
                          .toList();
                      List<Restaurant> restaurants = Restaurant.restaurants
                          .where((element) =>
                              categories.any((e) => element.tags.contains(e)))
                          .where((element) => prices
                              .any((e) => element.priceCategory.contains(e)))
                          .toList();
 */