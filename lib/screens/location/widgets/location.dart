import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tkfood/blocs/autocomplete/autocomplete_bloc.dart';
import 'package:tkfood/blocs/blocs.dart';
import 'package:tkfood/screens/location/widgets/location_search_box.dart';


class Location extends StatelessWidget {
  const Location({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 40,
      left: 20,
      right: 20,
      child: SizedBox(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(
              'assets/logo.svg',
              height: 50,
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                children: [
                  const LocationSearchBox(),
                  BlocBuilder<AutocompleteBloc, AutocompleteState>(
                    builder: (context, state) {
                      if (state is AutocompleteLoading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (state is AutocompleteLoaded) {
                        return Container(
                          margin: const EdgeInsets.all(8),
                          height: 300,
                          color: state.autocomplete.isNotEmpty
                              ? Colors.black.withOpacity(0.6)
                              : Colors.transparent,
                          child: ListView.builder(
                            itemCount: state.autocomplete.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: Text(
                                  state.autocomplete[index].description,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(
                                        color: Colors.white,
                                      ),
                                ),
                                onTap: () {
                                  context.read<PlaceBloc>().add(
                                        LoadPlace(
                                          placeId:
                                              state.autocomplete[index].placeId,
                                        ),
                                      );
                                },
                              );
                            },
                          ),
                        );
                      } else {
                        return const Text('Something went wrong!');
                      }
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
