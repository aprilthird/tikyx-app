import 'package:app/pages/orders/orders.dart';
import 'package:flutter/material.dart';
import 'package:uikit/colors/colors.dart';
import 'package:uikit/components/buttons/grey_elevated_button.dart';
import 'package:uikit/components/buttons/primary_elevated_button.dart';
import 'package:uikit/components/cards/shadow_card.dart';
import 'package:uikit/dimens/dimens.dart';
import 'package:uikit/dimens/font_size.dart';

class OrdersSummaryPage extends StatefulWidget {
  const OrdersSummaryPage({super.key});

  @override
  State<OrdersSummaryPage> createState() => _OrdersSummaryPageState();
}

class _OrdersSummaryPageState extends State<OrdersSummaryPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(UIKitDimens.medium),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Image(
                  alignment: Alignment.center,
                  image: AssetImage('../assets/images/icon_profile.png'),
                ),
                Row(
                  children: [
                    ShadowCard(
                      onPressed: () {},
                      borderRadiusValue: UIKitDimens.small,
                      child: const Icon(Icons.notifications),
                    ),
                    const SizedBox(
                      width: UIKitDimens.medium,
                    ),
                    ShadowCard(
                      onPressed: () {},
                      borderRadiusValue: UIKitDimens.small,
                      child: const Icon(Icons.settings),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: UIKitDimens.medium,
            ),
            const Text(
              'Hola Juan!',
              style: TextStyle(
                fontSize: UIKitFontSize.extraLarge,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: UIKitDimens.medium,
            ),
            ShadowCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Su saldo es:',
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
                          goToOrders();
                        },
                        child: const Row(
                          children: [
                            Icon(Icons.file_copy),
                            SizedBox(
                              width: UIKitDimens.small,
                            ),
                            Text('Detalles'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: UIKitDimens.medium,
            ),
            Row(
              children: [
                const Text(
                  'Movimientos',
                  style: TextStyle(
                    fontSize: UIKitFontSize.large,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  width: UIKitDimens.medium,
                ),
                Expanded(
                  flex: 1,
                  child: const Divider(
                    color: Colors.black12,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: UIKitDimens.medium,
            ),
            Row(
              children: [
                Expanded(
                  child: ShadowCard(
                    backgroundColor: UIKitColors.lighterPurple.withOpacity(0.5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.circular(UIKitDimens.extraLarge),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(UIKitDimens.small),
                            child: Image(
                              alignment: Alignment.center,
                              image: AssetImage(
                                  '../assets/images/icon_received.png'),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: UIKitDimens.extraLarge,
                        ),
                        const Text(
                          'Ordenes',
                          style: TextStyle(
                            fontSize: UIKitFontSize.extraLarge,
                          ),
                        ),
                        const SizedBox(
                          height: UIKitDimens.small,
                        ),
                        const Text(
                          '1,556',
                          style: TextStyle(
                            fontSize: UIKitFontSize.doubleExtraLarge,
                          ),
                        ),
                        const SizedBox(
                          height: UIKitDimens.extraLarge,
                        ),
                        GreyElevatedButton(
                          onPressed: () {},
                          minimumSize: const Size.fromHeight(
                              UIKitDimens.extraExtraLarge),
                          child: Text('Detalles'),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: UIKitDimens.medium,
                ),
                Expanded(
                  child: ShadowCard(
                    backgroundColor: UIKitColors.lighterRed.withOpacity(0.5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.circular(UIKitDimens.extraLarge),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(UIKitDimens.small),
                            child: Image(
                              alignment: Alignment.center,
                              image: AssetImage(
                                  '../assets/images/icon_earnings.png'),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: UIKitDimens.extraLarge,
                        ),
                        const Text(
                          'Comisiones',
                          style: TextStyle(
                            fontSize: UIKitFontSize.extraLarge,
                          ),
                        ),
                        const SizedBox(
                          height: UIKitDimens.small,
                        ),
                        const Text(
                          '\$ 123,945',
                          style: TextStyle(
                            fontSize: UIKitFontSize.doubleExtraLarge,
                          ),
                        ),
                        const SizedBox(
                          height: UIKitDimens.extraLarge,
                        ),
                        GreyElevatedButton(
                          onPressed: () {},
                          minimumSize: const Size.fromHeight(
                              UIKitDimens.extraExtraLarge),
                          child: Text('Detalles'),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: UIKitDimens.medium,
            ),
            const ShadowCard(
              paddingValue: UIKitDimens.extraExtraLarge,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    alignment: Alignment.center,
                    image: AssetImage('../assets/images/icon_stats.png'),
                  ),
                  SizedBox(
                    width: UIKitDimens.medium,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Estadísticas',
                        style: TextStyle(
                          fontSize: UIKitFontSize.large,
                        ),
                      ),
                      const Text(
                        'Pronto',
                        style: TextStyle(
                          fontSize: UIKitFontSize.doubleExtraLarge,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  goToOrders() async {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const OrdersPage(),
      ),
    );
  }
}
