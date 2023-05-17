import 'package:flutter/material.dart';
import 'package:tkfood/blocs/blocs.dart';
import 'package:tkfood/models/models.dart';
import 'package:tkfood/screens/restaurant_listing/restaurant_listing_screen.dart';

class CategoryBox extends StatelessWidget {
  final CategoryModel categoryModel;
  const CategoryBox({
    super.key,
    required this.categoryModel,
  });

  @override
  Widget build(BuildContext context) {
    List<Restaurant> restaurants =
        context.select((RestaurantBloc restaurantBloc) {
      if (restaurantBloc.state is RestaurantLoaded) {
        return (restaurantBloc.state as RestaurantLoaded).restaurants;
      } else {
        return <Restaurant>[];
      }
    });

    final List<Restaurant> filteredRestaurants = restaurants
        .where((element) => element.categoryModel.contains(categoryModel))
        .toList();
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(RestaurantListingScreen.routeName,
            arguments: filteredRestaurants);
      },
      child: Container(
        width: 80,
        margin: const EdgeInsets.only(right: 5),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 10,
              left: 10,
              child: Container(
                  height: 50,
                  width: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white),
                  child: Image.asset(categoryModel.imageUrl)),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  categoryModel.name,
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
