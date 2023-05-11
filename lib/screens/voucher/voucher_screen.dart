import 'dart:developer';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:tkfood/blocs/blocs.dart';
import 'package:tkfood/repositories/voucher/voucher_repository.dart';

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
                        hintText: 'Voucher Code',
                      ),
                      onChanged: (value) async {
                        print(await VoucherRepository()
                            .searchVoucher(code: value));
                      },
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
            BlocBuilder<VoucherBloc, VoucherState>(
              builder: (context, state) {
                if (state is VoucherLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is VoucherLoaded) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.vouchers.length,
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
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: Text(
                                state.vouchers[index].code,
                                textAlign: TextAlign.left,
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                            ),
                            TextButton(
                              style: TextButton.styleFrom(
                                visualDensity: VisualDensity.compact,
                              ),
                              onPressed: () {
                                context.read<VoucherBloc>().add(
                                      SelectVoucher(
                                          voucher: state.vouchers[index]),
                                    );
                                Navigator.of(context).pop();
                              },
                              child: const Text('Apply'),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                } else {
                  return const Text('Something went wrong');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
