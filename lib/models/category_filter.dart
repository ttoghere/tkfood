// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:tkfood/models/models.dart';

class CategoryFilter extends Equatable {
  final String id;
  final CategoryModel category;
  final bool value;
  const CategoryFilter({
    required this.id,
    required this.category,
    required this.value,
  });

  @override
  List<Object> get props => [id, category, value];

  CategoryFilter copyWith({
    String? id,
    CategoryModel? category,
    bool? value,
  }) {
    return CategoryFilter(
      id: id ?? this.id,
      category: category ?? this.category,
      value: value ?? this.value,
    );
  }

  static List<CategoryFilter> filters = CategoryModel.categories
      .map((e) => CategoryFilter(id: e.id, category: e, value: false))
      .toList();
}
