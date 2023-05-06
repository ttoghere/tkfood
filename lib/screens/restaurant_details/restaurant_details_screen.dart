import 'package:flutter/material.dart';

class RestaurantDetailsScreen extends StatelessWidget {
  static const routeName = "/restaurant-details";
  static Route route() {
    return MaterialPageRoute(
      builder: (context) =>const RestaurantDetailsScreen(),
    );
  }

  const RestaurantDetailsScreen({
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
