// ignore_for_file: unrelated_type_equality_checks, non_constant_identifier_names, avoid_types_as_parameter_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:tkfood/models/models.dart';

class Restaurant extends Equatable {
  final String id;
  final String name;
  final String description;
  final String imageUrl;
  final String priceCategory;
  final List<String> tags;
  final List<CategoryModel> categoryModel;
  final List<OpeningHours> openingHours;
  final List<Product> products;
  final int deliveryTime;
  final double deliveryFee;
  final double distance;

  const Restaurant({
    required this.name,
    required this.imageUrl,
    required this.tags,
    required this.products,
    this.deliveryTime = 10,
    this.priceCategory = "\$",
    this.deliveryFee = 10,
    this.distance = 15,
    required this.openingHours,
    required this.categoryModel,
    required this.description,
    required this.id,
  });

  @override
  List<Object> get props {
    return [
      id,
      name,
      description,
      imageUrl,
      priceCategory,
      tags,
      categoryModel,
      openingHours,
      products,
      deliveryTime,
      deliveryFee,
      distance,
    ];
  }

  factory Restaurant.fromSnapshot(DocumentSnapshot snap) {
    return Restaurant(
      id: snap.id,
      name: snap['name'],
      imageUrl: snap['imageUrl'],
      description: snap['description'],
      tags: (snap['tags'] as List).map(
        (tag) {
          return tag as String;
        },
      ).toList(),
      categoryModel: (snap["categories"] as List)
          .map((e) => CategoryModel.fromSnapshot(e))
          .toList(),
      products: (snap['products'] as List).map(
        (product) {
          return Product.fromSnapshot(product);
        },
      ).toList(),
      openingHours: (snap['openingHours'] as List).map(
        (openingHour) {
          return OpeningHours.fromSnapshot(openingHour);
        },
      ).toList(),
    );
  }
  static List<Restaurant> restaurants = [];
}
