// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:tkfood/blocs/blocs.dart';
import 'package:tkfood/blocs/filter/filter_bloc.dart';
import 'package:tkfood/models/models.dart';
import 'package:tkfood/screens/restaurant_listing/restaurant_listing_screen.dart';
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
      bottomNavigationBar: BottomAppBar(
        child: SizedBox(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<FilterBloc, FilterState>(
              builder: (context, state) {
                if (state is FilterLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is FilterLoaded) {
                  return ElevatedButton(
                    onPressed: () {

                      Navigator.of(context).pushNamed(
                          RestaurantListingScreen.routeName,
                          arguments:state.filteredRestaurants);
                    },
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        shape: const RoundedRectangleBorder(),
                        backgroundColor:
                            Theme.of(context).colorScheme.secondary),
                    child: const Text("Apply"),
                  );
                } else {
                  return const Center(
                    child: Text("Something Went Wrong"),
                  );
                }
              },
            ),
          ],
        )),
      ),
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
