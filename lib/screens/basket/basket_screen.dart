import 'package:flutter/material.dart';

class BasketScreen extends StatelessWidget {
  static const routeName = "/basket";
  static Route route() {
    return MaterialPageRoute(
      builder: (context) =>const BasketScreen(),
    );
  }

  const BasketScreen({
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
