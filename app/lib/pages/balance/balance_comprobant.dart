import 'package:app/pages/balance/balance_comprobant_detail.dart';
import 'package:app/pages/balance/balance_detail.dart';
import 'package:flutter/material.dart';
import 'package:uikit/components/buttons/grey_elevated_button.dart';
import 'package:uikit/components/cards/shadow_card.dart';
import 'package:uikit/dimens/dimens.dart';
import 'package:uikit/fonts/sizes.dart';
import 'package:uikit/components/buttons/primary_elevated_button.dart';

class BalanceComprobantPage extends StatefulWidget {
  const BalanceComprobantPage({super.key});

  @override
  State<BalanceComprobantPage> createState() => _BalanceComprobantPageState();
}

class _BalanceComprobantPageState extends State<BalanceComprobantPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(UIKitDimens.medium),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Comprobante',
                    style: TextStyle(
                      fontSize: UIKitDimens.large,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: UIKitDimens.medium,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'Proporciona una foto clara del comprobate para verificar \nel deposito de saldo',
                        style: TextStyle(
                          fontSize: UIKitDimens.medium,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: UIKitDimens.large,
                  ),
                  const SizedBox(
                    height: UIKitDimens.large,
                  ),
                  ShadowCard(
                    child: Row(
                      children: [
                        const Image(
                          alignment: Alignment.center,
                          image: AssetImage(
                              '../assets/images/image_product_1.png'),
                        ),
                        const SizedBox(
                          width: UIKitDimens.medium,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Deposito / Transferencia',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                                'Esta es una descripción corta de máximo 2 lineas')
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: UIKitDimens.medium,
                  ),
                  ShadowCard(
                    child: Row(
                      children: [
                        const Image(
                          alignment: Alignment.center,
                          image: AssetImage(
                              '../assets/images/image_product_2.png'),
                        ),
                        const SizedBox(
                          width: UIKitDimens.medium,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Carga con tarjeta',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                                'Esta es una descripción corta de máximo 2 lineas')
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: PrimaryElevatedButton(
                    onPressed: () {
                      goToBalanceComprobantDetail();
                    },
                    isFullWidth: true,
                    child: Text('Enviar Comprobante'),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: UIKitDimens.small,
            ),
            Row(
              children: [
                Expanded(
                  child: GreyElevatedButton(
                    onPressed: () {
                      goToBalanceDetail();
                    },
                    isFullWidth: true,
                    child: Text('Cancelar'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  goBack() async {
    Navigator.pop(context);
  }

  goToBalanceComprobantDetail() async {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const BalanceComprobantDetailPage(),
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
