// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:tkfood/models/restaurant_model.dart';
import 'package:tkfood/screens/home/widgets/widgets.dart';

class RestaurantListingScreen extends StatelessWidget {
  static const routeName = "/restaurant-listing";
  static Route route({required List<Restaurant> restaurants}) {
    return MaterialPageRoute(
      builder: (context) => RestaurantListingScreen(
        restaurants: restaurants,
      ),
    );
  }

  const RestaurantListingScreen({
    Key? key,
    required this.restaurants,
  }) : super(key: key);
  final List<Restaurant> restaurants;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Restaurant"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: restaurants.length,
            itemBuilder: (context, index) {
              return RestaurantCard(
                restaurant: restaurants[index],
              );
            }),
      ),
    );
  }
}
