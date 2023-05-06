// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'widgets/widgets.dart';
import '../../blocs/blocs.dart';

class LocationScreen extends StatelessWidget {
  static const routeName = "/location";
  static Route route() {
    return MaterialPageRoute(
      builder: (context) => const LocationScreen(),
    );
  }

  const LocationScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<PlaceBloc, PlaceState>(
        builder: (context, state) {
          if (state is PlaceLoading) {
            return Stack(
              children: [
                BlocBuilder<GeolocationBloc, GeolocationState>(
                  builder: (context, state) {
                    if (state is GeolocationLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state is GeolocationLoaded) {
                      return Stack(
                        children: [
                          Gmap(
                            lat: state.position.latitude,
                            lng: state.position.longitude,
                          ),
                        ],
                      );
                    } else {
                      return const Text('Something went wrong!');
                    }
                  },
                ),
                const SaveButton(),
                const Location(),
              ],
            );
          } else if (state is PlaceLoaded) {
            return Stack(
              children: [
                Gmap(
                  lat: state.place.lat,
                  lng: state.place.lon,
                ),
                const SaveButton(),
                const Location(),
              ],
            );
          } else {
            return const Text('Something went wrong!');
          }
        },
      ),
    );
  }
}
