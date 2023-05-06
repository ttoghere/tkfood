// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tkfood/blocs/geolocation/geolocation_bloc.dart';

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
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            child: BlocBuilder<GeolocationBloc, GeolocationState>(
              builder: (context, state) {
                if (state is GeolocationLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is GeolocationLoaded) {
                  return GMap(
                    lat: state.position.latitude,
                    lng: state.position.longitude,
                  );
                } else {
                  return const Center(
                    child: Text("An error occured"),
                  );
                }
              },
            ),
          ),
          Positioned(
            top: 40,
            left: 20,
            right: 20,
            child: Row(
              children: [
                SvgPicture.asset(
                  "assets/logo.svg",
                  height: 50,
                ),
                const SizedBox(
                  width: 10,
                ),
                const Expanded(
                  child: LocationSearch(),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 10,
            right: 20,
            left: 20,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 70),
              child: ElevatedButton(
                onPressed: () {},
                child: const Text("Save"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class GMap extends StatelessWidget {
  final double lat;
  final double lng;
  const GMap({
    Key? key,
    required this.lat,
    required this.lng,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: CameraPosition(target: LatLng(lat, lng), zoom: 5),
      myLocationEnabled: true,
    );
  }
}

class LocationSearch extends StatelessWidget {
  const LocationSearch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: "Enter your location",
          suffixIcon: const Icon(Icons.search),
          contentPadding: const EdgeInsets.only(left: 20, bottom: 5, right: 5),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.white),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
