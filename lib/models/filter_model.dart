// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:tkfood/models/models.dart';

class FilterFilter extends Equatable {
  final List<CategoryFilter> categoryFilters;
  final List<PriceFilter> priceFilters;
 const FilterFilter({
   this.categoryFilters = const <CategoryFilter>[],
   this.priceFilters = const <PriceFilter>[],
  });

  @override
  List<Object> get props => [categoryFilters, priceFilters];

  FilterFilter copyWith({
    List<CategoryFilter>? categoryFilters,
    List<PriceFilter>? priceFilters,
  }) {
    return FilterFilter(
      categoryFilters: categoryFilters ?? this.categoryFilters,
      priceFilters: priceFilters ?? this.priceFilters,
    );
  }
}
