import 'package:flutter/material.dart';
import 'package:tkfood/models/models.dart';
import 'package:tkfood/screens/home/widgets/widgets.dart';
import 'package:tkfood/shared/shared.dart';

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
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(8),
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  var access = CategoryModel.categories[index];
                  return CategoryBox(
                    categoryModel: access,
                  );
                },
                itemCount: CategoryModel.categories.length,
              ),
            ),
            Container(
              margin: const EdgeInsets.all(8),
              height: 125.0,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: Promo.promos.length,
                itemBuilder: (context, index) {
                  return PromoBox(promo: Promo.promos[index]);
                },
              ),
            ),
            const FoodSearchBox(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Top Rated',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: Restaurant.restaurants.length,
                itemBuilder: (context, index) {
                  return RestaurantCard(
                    restaurant: Restaurant.restaurants[index],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
