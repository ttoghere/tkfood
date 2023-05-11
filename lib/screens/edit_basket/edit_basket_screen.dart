import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tkfood/blocs/basket/basket_bloc.dart';

class EditBasketScreen extends StatelessWidget {
  static const String routeName = '/edit-basket';

  const EditBasketScreen({super.key});

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const EditBasketScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Basket')),
      bottomNavigationBar: BottomAppBar(
        child: SizedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  shape: const RoundedRectangleBorder(),
                  backgroundColor: Theme.of(context).colorScheme.primary,
                ),
                child: const Text('Done'),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Items',
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
            ),
            BlocBuilder<BasketBloc, BasketState>(
              builder: (context, state) {
                if (state is BasketLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is BasketLoaded) {
                  return state.basket.items.isEmpty
                      ? Container(
                          width: double.infinity,
                          margin: const EdgeInsets.only(top: 5),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 30,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5.0)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'No Items in the Basket',
                                textAlign: TextAlign.left,
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                            ],
                          ),
                        )
                      : ListView.builder(
                          shrinkWrap: true,
                          itemCount: state.basket
                              .itemQuantity(state.basket.items)
                              .keys
                              .length,
                          itemBuilder: (context, index) {
                            return Container(
                              width: double.infinity,
                              margin: const EdgeInsets.only(top: 5),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 30,
                                vertical: 10,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '${state.basket.itemQuantity(state.basket.items).entries.elementAt(index).value}x',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall!
                                        .copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                        ),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Expanded(
                                    child: Text(
                                      '${state.basket.itemQuantity(state.basket.items).keys.elementAt(index).name}',
                                      textAlign: TextAlign.left,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge,
                                    ),
                                  ),
                                  IconButton(
                                    visualDensity: VisualDensity.compact,
                                    onPressed: () {
                                      context.read<BasketBloc>().add(
                                            RemoveItem(state.basket
                                                .itemQuantity(
                                                    state.basket.items)
                                                .keys
                                                .elementAt(index)),
                                          );
                                    },
                                    icon: const Icon(Icons.remove_circle),
                                  ),
                                  IconButton(
                                    visualDensity: VisualDensity.compact,
                                    onPressed: () {
                                      context.read<BasketBloc>().add(
                                            AddItem(state.basket
                                                .itemQuantity(
                                                    state.basket.items)
                                                .keys
                                                .elementAt(index)),
                                          );
                                    },
                                    icon: const Icon(Icons.add_circle),
                                  ),
                                  IconButton(
                                    visualDensity: VisualDensity.compact,
                                    onPressed: () {
                                      log(state.basket.items[index].toString());
                                      context.read<BasketBloc>().add(
                                            RemoveAllItem(state.basket
                                                .itemQuantity(
                                                    state.basket.items)
                                                .keys
                                                .elementAt(index)),
                                          );
                                    },
                                    icon: const Icon(Icons.delete),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                } else {
                  return const Text('Something went wrong.');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
