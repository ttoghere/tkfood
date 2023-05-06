import 'package:flutter/material.dart';

class RestaurantListingScreen extends StatelessWidget {
  static const routeName = "/restaurant-listing";
  static Route route() {
    return MaterialPageRoute(
      builder: (context) =>const RestaurantListingScreen(),
    );
  }

  const RestaurantListingScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
    );
  }
}
