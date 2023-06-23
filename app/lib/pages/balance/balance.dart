import 'dart:math';

import 'package:app/pages/balance/balance_detail.dart';
import 'package:flutter/material.dart';
import 'package:uikit/colors/colors.dart';
import 'package:uikit/components/buttons/grey_elevated_button.dart';
import 'package:uikit/components/buttons/primary_elevated_button.dart';
import 'package:uikit/components/cards/shadow_card.dart';
import 'package:uikit/dimens/dimens.dart';
import 'package:uikit/fonts/sizes.dart';
import 'package:domain/models/balance.dart';
import 'package:domain/models/payment.dart';
import 'package:data/repositories/payment.dart';

class BalancePage extends StatefulWidget {
  const BalancePage({super.key});

  @override
  State<BalancePage> createState() => _BalancePageState();
}

class _BalancePageState extends State<BalancePage> {
  Future<List<Payment>>? _futurePayments;

  final List<Balance> data = [
    new Balance(
        id: 213455,
        date: "17/05/2023",
        concept: "Pago Comisiones",
        amount: 20000)
  ];
  final List<Payment> commissionsTest = [
    new Payment(
      id: 213455,
      createdAt: "17/05/2023",
      orderId: 124,
      transactionId: 2222,
    )
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getAllPayments();
    });
  }

  getAllPayments() async {
    setState(() {
      _futurePayments = PaymentRepository.getAll();
    });
  }

  Widget buildTable() {
    return FutureBuilder(
        future: _futurePayments,
        builder: (context, snapshot) {
          if (!snapshot.hasError) {
            var payments = snapshot.hasData ? snapshot.data! : commissionsTest;
            return Column(
              children: [
                for (var item in payments) ...[
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      child: Padding(
                        padding: const EdgeInsets.all(UIKitDimens.small),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                              flex: 1,
                              child: Text(
                                item.createdAt.toString(),
                                textAlign: TextAlign.start,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(
                                'Pago comisiones', //item.concept,
                                textAlign: TextAlign.start,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Text(
                                '\$2000', //item.amount.toString(),
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const Divider(
                    color: Colors.black12,
                    height: 1,
                  ),
                ],
              ],
            );
          }
          return const CircularProgressIndicator();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(UIKitDimens.medium),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ShadowCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Balance total:',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: UIKitDimens.small,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          '\$ 21,543',
                          style: TextStyle(
                            fontSize: UIKitFontSize.doubleExtraLarge,
                          ),
                        ),
                        PrimaryElevatedButton(
                          onPressed: () {
                            goToBalanceDetail();
                          },
                          child: const Row(
                            children: [
                              Icon(Icons.file_copy),
                              SizedBox(
                                width: UIKitDimens.small,
                              ),
                              Text('Cargar'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: UIKitDimens.extraLarge,
              ),
              Text(
                'Transacciones:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: UIKitDimens.extraSmall,
              ),
              Text(
                'Movimientos recientes',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: UIKitDimens.extraLarge,
              ),
              ShadowCard(
                paddingValue: 0,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(UIKitDimens.medium),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text(
                              'Fecha',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(
                              'Concepto',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              'Valor',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Divider(
                      color: Colors.black12,
                      height: 1,
                    ),
                    buildTable(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  goToBalanceDetail() async {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const BalanceDetailPage(),
      ),
    );
  }
}
