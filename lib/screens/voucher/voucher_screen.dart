import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tkfood/blocs/basket/basket_bloc.dart';
import 'package:tkfood/models/models.dart';


class VoucherScreen extends StatelessWidget {
  static const String routeName = '/vouchers';

  const VoucherScreen({super.key});

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const VoucherScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Voucher'),
      ),
      bottomNavigationBar: BottomAppBar(
        child: SizedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  shape: const RoundedRectangleBorder(),
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                ),
                child: const Text('Apply'),
                onPressed: () {},
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
              'Enter a Voucher Code',
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
            ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.only(top: 10, bottom: 10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5.0)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                          hintText: 'Voucher Code'),
                    ),
                  ),
                ],
              ),
            ),
            Text(
              'Your Vouchers',
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: Voucher.vouchers.length,
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '3x',
                        style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                            color: Theme.of(context).colorScheme.secondary),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Text(
                          Voucher.vouchers[index].code,
                          textAlign: TextAlign.left,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ),
                      BlocBuilder<BasketBloc, BasketState>(
                        builder: (context, state) {
                          return TextButton(
                            style: TextButton.styleFrom(
                              visualDensity: VisualDensity.compact,
                            ),
                            onPressed: () {
                              context.read<BasketBloc>().add(
                                    AddVoucher(Voucher.vouchers[index]),
                                  );
                              Navigator.of(context).pop();
                            },
                            child: const Text('Apply'),
                          );
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
