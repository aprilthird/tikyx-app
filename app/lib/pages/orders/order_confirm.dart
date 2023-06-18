import 'package:app/pages/onboarding/permissions.dart';
import 'package:flutter/material.dart';
import 'package:uikit/components/buttons/grey_elevated_button.dart';
import 'package:uikit/dimens/dimens.dart';
import 'package:uikit/fonts/sizes.dart';
import 'package:uikit/components/buttons/primary_elevated_button.dart';

class OrderConfirmPage extends StatefulWidget {
  const OrderConfirmPage({super.key});

  @override
  State<OrderConfirmPage> createState() => _OrderConfirmPageState();
}

class _OrderConfirmPageState extends State<OrderConfirmPage> {
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Débito de pedido',
                    style: TextStyle(
                      fontSize: UIKitFontSize.large,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: UIKitDimens.medium,
                  ),
                  const Text(
                    'Orden #289',
                    style: TextStyle(
                      fontSize: UIKitFontSize.extraLarge,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: UIKitDimens.extraLarge,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Image(
                        image: AssetImage('../assets/images/icon_dollar.png'),
                      ),
                      const SizedBox(
                        height: UIKitDimens.medium,
                      ),
                      const Text(
                        'Debitaremos de tu saldo la cantidad de:',
                        style: TextStyle(
                          fontSize: UIKitFontSize.large,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: UIKitDimens.medium,
                      ),
                      const Text(
                        '\$ 700.00 pesos',
                        style: TextStyle(
                          fontSize: UIKitFontSize.doubleExtraLarge,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              children: [
                PrimaryElevatedButton(
                  onPressed: () {
                    goToOrderCodeValidation();
                  },
                  isFullWidth: true,
                  child: Text('Confirmar'),
                ),
                const SizedBox(
                  height: UIKitDimens.medium,
                ),
                GreyElevatedButton(
                  onPressed: () {
                    goBack();
                  },
                  isFullWidth: true,
                  child: Text('Cancelar'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  goBack() async {
    Navigator.pop(context);
  }

  goToOrderCodeValidation() async {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const PermissionsPage(),
      ),
    );
  }
}
