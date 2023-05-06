import 'package:flutter/material.dart';

class DeliveryTimeScreen extends StatelessWidget {
  static const routeName = "/delivery-time";
  static Route route() {
    return MaterialPageRoute(
      builder: (context) =>const DeliveryTimeScreen(),
    );
  }

  const DeliveryTimeScreen({
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
