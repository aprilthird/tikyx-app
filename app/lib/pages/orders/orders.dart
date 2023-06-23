import 'package:app/pages/orders/order_detail.dart';
import 'package:flutter/material.dart';
import 'package:uikit/colors/colors.dart';
import 'package:uikit/components/cards/shadow_card.dart';
import 'package:uikit/dimens/dimens.dart';
import 'package:domain/models/order.dart';
import 'package:data/repositories/order.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({super.key});

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  Future<List<Order>>? _futureOrders;

  final List<Order> testData = [
    Order(
        id: 213455, customerId: 1, referralId: 1, status: "0", amount: 100.00),
    Order(
        id: 213456, customerId: 1, referralId: 1, status: "1", amount: 100.00),
    Order(
        id: 213457, customerId: 1, referralId: 1, status: "1", amount: 100.00),
    Order(
        id: 213458, customerId: 1, referralId: 1, status: "0", amount: 100.00),
    Order(
        id: 213459, customerId: 1, referralId: 1, status: "1", amount: 100.00),
    Order(
        id: 213450, customerId: 1, referralId: 1, status: "0", amount: 100.00),
    Order(
        id: 213452, customerId: 1, referralId: 1, status: "0", amount: 100.00),
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getAllOrders();
    });
  }

  getAllOrders() async {
    setState(() {
      _futureOrders = OrderRepository.getAll();
    });
  }

  Widget buildHeader() {
    return Padding(
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
    );
  }

  Widget buildTable() {
    return FutureBuilder(
      future: _futureOrders,
      builder: (context, snapshot) {
        if (!snapshot.hasError) {
          final orders = snapshot.hasData ? snapshot.data! : testData;
          return Column(
            children: [
              for (var item in orders) ...[
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
                              item.customerId.toString(),
                              textAlign: TextAlign.start,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Card(
                              color: item.status == "0"
                                  ? UIKitColors.lighterRed
                                  : UIKitColors.lighterPurple,
                              child: Padding(
                                padding: const EdgeInsets.all(
                                    UIKitDimens.extraSmall),
                                child: Text(
                                  item.status == "0" ? 'Pendiente' : 'Pagado',
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
              ],
            ],
          );
        }
        return const CircularProgressIndicator();
      },
    );
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
                    buildHeader(),
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

  goToOrderDetail() async {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const OrderDetailPage(),
      ),
    );
  }
}
