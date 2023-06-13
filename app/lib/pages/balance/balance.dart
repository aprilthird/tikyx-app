import 'dart:math';

import 'package:app/pages/balance/balance_detail.dart';
import 'package:flutter/material.dart';
import 'package:uikit/colors/colors.dart';
import 'package:uikit/components/cards/shadow_card.dart';
import 'package:uikit/dimens/dimens.dart';
import 'package:domain/models/balances.dart';

class BalancePage extends StatefulWidget {
  const BalancePage({super.key});

  @override
  State<BalancePage> createState() => _BalancePageState();
}

class _BalancePageState extends State<BalancePage> {
  final List<Balance> data = [
    new Balance(
        id: 213455,
        date: DateTime.now(),
        concept: "Pago Comisiones",
        amount: 20000)
  ];

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
              Text(
                'Transacciones:',
              ),
              const SizedBox(
                height: UIKitDimens.large,
              ),
              Text(
                'Movimientos recientes',
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
                    for (var item in data!) ...[
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            goToBalanceDetail();
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(UIKitDimens.small),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    item.date.toString(),
                                    textAlign: TextAlign.start,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    item.concept,
                                    textAlign: TextAlign.start,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    item.amount.toString(),
                                    textAlign: TextAlign.start,
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
                    ]
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
