import 'dart:math';

// import 'package:app/pages/comissions/comissions_detail.dart';
import 'package:app/pages/commissions/comissions_detail.dart';
import 'package:flutter/material.dart';
import 'package:uikit/colors/colors.dart';
import 'package:uikit/components/cards/shadow_card.dart';
import 'package:uikit/dimens/dimens.dart';
import 'package:domain/models/commissions.dart';

class CommissionsPage extends StatefulWidget {
  const CommissionsPage({super.key});

  @override
  State<CommissionsPage> createState() => _CommissionsPageState();
}

class _CommissionsPageState extends State<CommissionsPage> {
  final List<Commission> data = [
    new Commission(
        id: 213455,
        date: DateTime.now(),
        order: "#213455",
        user: "Alfredo",
        statusCode: 0,
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
                              'Orden',
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
                              'Estado',
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
                              'Socio',
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
                            goToComissionsDetail();
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
                                    item.order,
                                    textAlign: TextAlign.start,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Card(
                                    color: item.statusCode == 0
                                        ? UIKitColors.lighterRed
                                        : UIKitColors.lighterPurple,
                                    child: Padding(
                                      padding: const EdgeInsets.all(
                                          UIKitDimens.extraSmall),
                                      child: Text(
                                        item.statusCode == 0
                                            ? 'Pendiente'
                                            : 'Pagado',
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    item.user,
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

  goToComissionsDetail() async {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ComissionsDetailPage(),
      ),
    );
  }
}
