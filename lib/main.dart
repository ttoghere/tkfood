import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:tkfood/blocs/basket/basket_bloc.dart';
import 'package:tkfood/blocs/blocs.dart';
import 'package:tkfood/blocs/filter/filter_bloc.dart';
import 'package:tkfood/config/configs.dart';
import 'package:tkfood/repositories/repositories.dart';
import 'package:tkfood/repositories/voucher/voucher_repository.dart';
import 'package:tkfood/screens/screens.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = SimpleBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<GeolocationRepository>(
            create: (context) => GeolocationRepository()),
        RepositoryProvider<PlacesRepository>(
            create: (context) => PlacesRepository()),
        RepositoryProvider(create: (context) => VoucherRepository())
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => GeolocationBloc(
                  geolocationRepository: context.read<GeolocationRepository>())
                ..add(LoadGeolocation())),
          BlocProvider(
              create: (context) => AutocompleteBloc(
                  placesRepository: context.read<PlacesRepository>())
                ..add(const LoadAutocomplete())),
          BlocProvider(
              create: (context) => PlaceBloc(
                  placesRepository: context.read<PlacesRepository>())),
          BlocProvider(
            create: (context) => FilterBloc()
              ..add(
                LoadFilter(),
              ),
          ),
          BlocProvider(
            create: (context) => VoucherBloc(
                voucherRepository: context.read<VoucherRepository>())
              ..add(LoadVouchers()),
          ),
          BlocProvider(
            create: (context) =>
                BasketBloc(voucherBloc: context.read<VoucherBloc>())
                  ..add(StartBasket()),
          ),
        ],
        child: MaterialApp(
          title: 'TKFood',
          debugShowCheckedModeBanner: false,
          theme: theme(),
          initialRoute: HomeScreen.routeName,
          onGenerateRoute: AppRouter.onGenerateRoute,
        ),
      ),
    );
  }
}
