import 'package:flutter/material.dart';

class FilterScreen extends StatelessWidget {
  static const routeName = "/filter";
  static Route route() {
    return MaterialPageRoute(
      builder: (context) =>const FilterScreen(),
    );
  }

  const FilterScreen({
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
