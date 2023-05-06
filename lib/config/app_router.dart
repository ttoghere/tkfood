import 'package:flutter/material.dart';
import 'package:tkfood/screens/home/home_screen.dart';
import 'package:tkfood/screens/location/location_screen.dart';
import 'package:tkfood/screens/screens.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HomeScreen.routeName:
        return HomeScreen.route();
      case LocationScreen.routeName:
        return LocationScreen.route();
      case BasketScreen.routeName:
        return BasketScreen.route();
      case ChekoutScreen.routeName:
        return ChekoutScreen.route();
      case DeliveryTimeScreen.routeName:
        return DeliveryTimeScreen.route();
      case FilterScreen.routeName:
        return FilterScreen.route();
      case RestaurantDetailsScreen.routeName:
        return RestaurantDetailsScreen.route();
      case RestaurantListingScreen.routeName:
        return RestaurantListingScreen.route();
      case SplashScreen.routeName:
        return SplashScreen.route();
      case VoucherScreen.routeName:
        return VoucherScreen.route();
      default:
        return _errorRouter();
    }
  }

  static Route _errorRouter() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: "/error"),
      builder: (context) => Scaffold(
        appBar: AppBar(
          title: const Text("ERROR"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Error",
                style: Theme.of(context).textTheme.displayMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
