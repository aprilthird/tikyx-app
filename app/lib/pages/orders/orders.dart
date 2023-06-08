import 'dart:math';

import 'package:app/pages/orders/order_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:uikit/colors/colors.dart';
import 'package:uikit/components/cards/shadow_card.dart';
import 'package:uikit/dimens/dimens.dart';
import 'package:domain/models/orders.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({super.key});

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  final List<Order> data = [
    new Order(id: 213455, user: 'Kierra Press', statusCode: 0, amount: 100.00),
    new Order(
        id: 213456, user: 'Carter Baptista', statusCode: 1, amount: 100.00),
    new Order(id: 213457, user: 'Jaydon Geidt', statusCode: 0, amount: 100.00),
    new Order(id: 213455, user: 'Kierra Press', statusCode: 0, amount: 100.00),
    new Order(
        id: 213456, user: 'Carter Baptista', statusCode: 1, amount: 100.00),
    new Order(id: 213457, user: 'Jaydon Geidt', statusCode: 0, amount: 100.00),
    new Order(id: 213455, user: 'Kierra Press', statusCode: 0, amount: 100.00),
    new Order(
        id: 213456, user: 'Carter Baptista', statusCode: 1, amount: 100.00),
    new Order(id: 213457, user: 'Jaydon Geidt', statusCode: 0, amount: 100.00),
    new Order(id: 213455, user: 'Kierra Press', statusCode: 0, amount: 100.00),
    new Order(
        id: 213456, user: 'Carter Baptista', statusCode: 1, amount: 100.00),
    new Order(id: 213457, user: 'Jaydon Geidt', statusCode: 0, amount: 100.00),
    new Order(id: 213455, user: 'Kierra Press', statusCode: 0, amount: 100.00),
    new Order(
        id: 213456, user: 'Carter Baptista', statusCode: 1, amount: 100.00),
    new Order(id: 213457, user: 'Jaydon Geidt', statusCode: 0, amount: 100.00),
    new Order(id: 213455, user: 'Kierra Press', statusCode: 0, amount: 100.00),
    new Order(
        id: 213456, user: 'Carter Baptista', statusCode: 1, amount: 100.00),
    new Order(id: 213457, user: 'Jaydon Geidt', statusCode: 0, amount: 100.00),
    new Order(id: 213455, user: 'Kierra Press', statusCode: 0, amount: 100.00),
    new Order(
        id: 213456, user: 'Carter Baptista', statusCode: 1, amount: 100.00),
    new Order(id: 213457, user: 'Jaydon Geidt', statusCode: 0, amount: 100.00),
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
              const Text(
                'Ordenes',
                style: TextStyle(
                  fontSize: UIKitDimens.large,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: UIKitDimens.large,
              ),
              Text(
                'Lleva el control de todos las órdenes de tus socios y referidos',
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
                              'Estado',
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
                            goToOrderDetail();
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(UIKitDimens.small),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    '#${item.id}',
                                    textAlign: TextAlign.start,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
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

  goToOrderDetail() async {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const OrderDetailPage(),
      ),
    );
  }
}
