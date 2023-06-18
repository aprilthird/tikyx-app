import 'package:app/pages/balance/balance_comprobant_confirmation.dart';
import 'package:app/pages/balance/balance_detail.dart';
import 'package:flutter/material.dart';
import 'package:uikit/components/cards/shadow_card.dart';
import 'package:uikit/dimens/dimens.dart';
import 'package:uikit/components/buttons/primary_elevated_button.dart';

class BalanceComprobantDetailPage extends StatefulWidget {
  const BalanceComprobantDetailPage({super.key});

  @override
  State<BalanceComprobantDetailPage> createState() =>
      _BalanceComprobantDetailPageState();
}

class _BalanceComprobantDetailPageState
    extends State<BalanceComprobantDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(UIKitDimens.medium),
        child: Column(children: [
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Detalle del Comprobante',
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
                      'Estos datos son privados para mejorar tu experiencia.',
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
                  backgroundColor: Colors.transparent,
                  child: Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Importe del Comprobante',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text('Ej.: \$ 1500')
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: UIKitDimens.medium,
                ),
                ShadowCard(
                  backgroundColor: Colors.transparent,
                  child: Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Nro. del comprobante',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text('Ej.: 09 34052 012341745243')
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
                    goToBalanceDetailConfirmation();
                  },
                  isFullWidth: true,
                  child: Text('Continuar'),
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }

  goBack() async {
    Navigator.pop(context);
  }

  // goToBalanceValidation() async {
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(
  //       builder: (context) => const BalanceValidationPage(),
  //     ),
  //   );
  // }

  goToBalanceDetailConfirmation() async {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const BalanceComprobantDetailConfirmationPage(),
      ),
    );
  }
}
