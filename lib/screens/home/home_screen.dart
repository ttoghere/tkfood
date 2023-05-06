import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = "/";
  static Route route() {
    return MaterialPageRoute(
      builder: (context) => const HomeScreen(),
    );
  }

  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Center(
        child: SvgPicture.asset(
          "assets/logo.svg",
          height: 100,
        ),
      ),
    );
  }
}
