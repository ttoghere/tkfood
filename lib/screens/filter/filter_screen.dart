// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'widgets/custom_category_filter.dart';
import 'widgets/custom_price_filter.dart';

class FilterScreen extends StatelessWidget {
  static const routeName = "/filter";
  static Route route() {
    return MaterialPageRoute(
      builder: (context) => const FilterScreen(),
    );
  }

  const FilterScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Filter')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Price',
              style: Theme.of(context).textTheme.displaySmall!.copyWith(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
            ),
            const CustomPriceFilter(),
            Text(
              'Category',
              style: Theme.of(context).textTheme.displaySmall!.copyWith(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
            ),
            const CustomCategoryFilter(),
          ],
        ),
      ),
    );
  }
}
