import 'package:flutter/material.dart';

class ChekoutScreen extends StatelessWidget {
  static const routeName = "/checkout";
  static Route route() {
    return MaterialPageRoute(
      builder: (context) => const ChekoutScreen(),
    );
  }

  const ChekoutScreen({
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
