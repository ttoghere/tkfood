import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:tkfood/blocs/geolocation/geolocation_bloc.dart';
import 'package:tkfood/config/configs.dart';
import 'package:tkfood/repositories/geolocation/geolocation_repository.dart';
import 'package:tkfood/screens/screens.dart';
import 'blocs/blocs.dart';
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
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => GeolocationBloc(
                  geolocationRepository: context.read<GeolocationRepository>())
                ..add(LoadGeolocation())),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: theme(),
          initialRoute: LocationScreen.routeName,
          onGenerateRoute: AppRouter.onGenerateRoute,
        ),
      ),
    );
  }
}
