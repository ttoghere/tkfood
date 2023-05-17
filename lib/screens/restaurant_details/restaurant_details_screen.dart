// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:tkfood/blocs/basket/basket_bloc.dart';
import 'package:tkfood/blocs/blocs.dart';

import 'package:tkfood/models/restaurant_model.dart';
import 'package:tkfood/screens/basket/basket_screen.dart';
import 'package:tkfood/screens/home/widgets/restaurant_tags.dart';

class RestaurantDetailsScreen extends StatelessWidget {
  static const routeName = "/restaurant-details";
  static Route route({required Restaurant restaurant}) {
    return MaterialPageRoute(
      builder: (context) => RestaurantDetailsScreen(
        restaurant: restaurant,
      ),
    );
  }

  const RestaurantDetailsScreen({
    Key? key,
    required this.restaurant,
  }) : super(key: key);
  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      bottomNavigationBar: BottomAppBar(
        child: SizedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  shape: const RoundedRectangleBorder(),
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed(BasketScreen.routeName);
                },
                child: const Text("Basket"),
              ),
            ],
          ),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  bottom:
                      Radius.elliptical(MediaQuery.of(context).size.width, 50),
                ),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    restaurant.imageUrl,
                  ),
                ),
              ),
            ),
            RestaurantInformation(
              restaurant: restaurant,
            ),
            ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                itemCount: restaurant.tags.length,
                itemBuilder: (context, index) {
                  return _buildMenuItems(
                      restaurant: restaurant, context: context, index: index);
                })
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItems(
      {required Restaurant restaurant,
      required BuildContext context,
      required int index}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text(
            restaurant.tags[index],
            style: Theme.of(context).textTheme.displaySmall,
          ),
        ),
        Column(
          children: restaurant.products
              .where((element) => element.category == restaurant.tags[index])
              .map((menuItem) => Column(
                    children: [
                      Container(
                        color: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: ListTile(
                          dense: true,
                          title: Text(
                            menuItem.name,
                            style: Theme.of(context).textTheme.displaySmall,
                          ),
                          subtitle: Text(
                            menuItem.description,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          trailing: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text("\$${menuItem.price}"),
                              IconButton(
                                onPressed: () {
                                  context
                                      .read<BasketBloc>()
                                      .add(AddProduct(menuItem));
                                },
                                icon: Icon(
                                  Icons.add_circle,
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Divider(
                        height: 2,
                      )
                    ],
                  ))
              .toList(),
        ),
      ],
    );
  }
}

class RestaurantInformation extends StatelessWidget {
  final Restaurant restaurant;
  const RestaurantInformation({
    Key? key,
    required this.restaurant,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            restaurant.name,
            style: Theme.of(context)
                .textTheme
                .displaySmall!
                .copyWith(color: Theme.of(context).colorScheme.secondary),
          ),
          const SizedBox(
            height: 10,
          ),
          RestaurantTags(restaurant: restaurant),
          const SizedBox(
            height: 5,
          ),
          Text(
            "${restaurant.distance}km away - \$${restaurant.deliveryFee} delivery fee",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            "Restaurant Information",
            style: Theme.of(context).textTheme.displaySmall,
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            "Lorem imsum dolor sit amet, consectetur adipiscing elit, sedy",
            style: Theme.of(context).textTheme.bodyLarge,
          )
        ],
      ),
    );
  }
}
