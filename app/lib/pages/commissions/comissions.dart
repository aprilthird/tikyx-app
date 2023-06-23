import 'dart:math';

// import 'package:app/pages/comissions/comissions_detail.dart';
import 'package:app/pages/commissions/comissions_detail.dart';
import 'package:flutter/material.dart';
import 'package:uikit/colors/colors.dart';
import 'package:uikit/components/buttons/primary_elevated_button.dart';
import 'package:uikit/components/cards/shadow_card.dart';
import 'package:uikit/dimens/dimens.dart';
import 'package:domain/models/commission.dart';
import 'package:data/repositories/commission.dart';
import 'package:uikit/fonts/sizes.dart';

class CommissionsPage extends StatefulWidget {
  const CommissionsPage({super.key});

  @override
  State<CommissionsPage> createState() => _CommissionsPageState();
}

class _CommissionsPageState extends State<CommissionsPage> {
  Future<List<Commission>>? _futurePayments;

  final List<Commission> data = [
    new Commission(
      id: "213455",
      createdAt: "10/04/23",
      orderId: 213455,
      sellerId: 1222,
      parentSellerId: 222,
      // user: "Alfredo",
      // statusCode: 0,
      amountSeller: 20000,
      parentAmountSeller: 20000,
    ),
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getAllCommissions();
    });
  }

  getAllCommissions() async {
    setState(() {
      _futurePayments = CommissionRepository.getAll();
    });
  }

  Widget buildTable() {
    return FutureBuilder(
        future: _futurePayments,
        builder: (context, snapshot) {
          if (!snapshot.hasError) {
            var commissions = snapshot.hasData ? snapshot.data! : data;
            return Column(
              children: [
                for (var item in commissions) ...[
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
                              flex: 2,
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
                                item.orderId.toString(),
                                textAlign: TextAlign.start,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Card(
                                color: /*item.statusCode*/ 0 == 0
                                    ? UIKitColors.lighterRed
                                    : UIKitColors.lighterPurple,
                                child: Padding(
                                  padding: const EdgeInsets.all(
                                      UIKitDimens.extraSmall),
                                  child: Text(
                                    /*item.statusCode*/ 0 == 0
                                        ? 'Pendiente'
                                        : 'Pagado',
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(
                                "", //item.user,
                                textAlign: TextAlign.start,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(
                                item.amountSeller.toString(),
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
                      'Monto:',
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
                        Row(
                          children: [
                            Text('Proximo pago:\n24/052023'),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: UIKitDimens.extraLarge,
              ),
              Text(
                'Operaciones:',
              ),
              Text(
                'Movimientos de comisiones',
              ),
              const SizedBox(
                height: UIKitDimens.extraLarge,
              ),
              SizedBox(
                height: 50,
                child: TextField(
                  cursorHeight: 25,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      suffixIcon: Icon(Icons.filter_list_rounded),
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      hintText:
                          'Escribe lo que buscas\nfecha, orden o estado de la comisión'),
                ),
              ),
              const SizedBox(
                height: UIKitDimens.medium,
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
                            flex: 2,
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
                            flex: 2,
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

  goToComissionsDetail() async {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ComissionsDetailPage(),
      ),
    );
  }
}
