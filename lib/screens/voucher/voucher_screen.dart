import 'package:flutter/material.dart';

class VoucherScreen extends StatelessWidget {
  static const routeName = "/voucher";
  static Route route() {
    return MaterialPageRoute(
      builder: (context) =>const VoucherScreen(),
    );
  }

  const VoucherScreen({
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
