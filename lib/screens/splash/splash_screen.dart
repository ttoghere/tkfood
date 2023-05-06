import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  static const routeName = "/splash";
  static Route route() {
    return MaterialPageRoute(
      builder: (context) => const SplashScreen(),
    );
  }

  const SplashScreen({
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
