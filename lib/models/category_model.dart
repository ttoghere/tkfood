import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class CategoryModel extends Equatable {
  final int id;
  final String name;
  final Image image;
  const CategoryModel({required this.id, required this.image, required this.name});
  @override
  List<Object?> get props => [
        id,
        name,
        image,
      ];
  static List<CategoryModel> categories = [
    CategoryModel(
      id: 1,
      image: Image.asset("assets/pizza.png"),
      name: "Pizza",
    ),
    CategoryModel(
      id: 2,
      image: Image.asset("assets/burger.png"),
      name: "Burger",
    ),
    CategoryModel(
      id: 3,
      image: Image.asset("assets/avocado.png"),
      name: "Salad",
    ),
    CategoryModel(
      id: 4,
      image: Image.asset("assets/pancake.png"),
      name: "Dessert",
    ),
    CategoryModel(
      id: 5,
      image: Image.asset("assets/juice.png"),
      name: "Drink",
    ),
  ];
}
