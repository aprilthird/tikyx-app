import 'package:app/pages/balance/balance.dart';
import 'package:flutter/material.dart';
import 'package:uikit/components/cards/shadow_card.dart';
import 'package:uikit/dimens/dimens.dart';
import 'package:uikit/components/buttons/primary_elevated_button.dart';

class BalanceComprobantDetailConfirmationPage extends StatefulWidget {
  const BalanceComprobantDetailConfirmationPage({super.key});

  @override
  State<BalanceComprobantDetailConfirmationPage> createState() =>
      _BalanceComprobantDetailConfirmationPageState();
}

class _BalanceComprobantDetailConfirmationPageState
    extends State<BalanceComprobantDetailConfirmationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(UIKitDimens.medium),
        child: Column(children: [
          const Image(
            alignment: Alignment.center,
            image: AssetImage('../assets/images/comprobant_final.png'),
            height: 300,
            width: 250,
          ),
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Recibimos el comprobante de la carga de saldo',
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
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Por:',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text('\$1500 pesos')
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
                    goToBalance();
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

  goToBalance() async {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const BalancePage(),
      ),
    );
  }
}
