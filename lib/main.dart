import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:tkfood/blocs/blocs.dart';
import 'package:tkfood/config/configs.dart';
import 'package:tkfood/repositories/repositories.dart';
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
            create: (context) => PlacesRepository())
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
