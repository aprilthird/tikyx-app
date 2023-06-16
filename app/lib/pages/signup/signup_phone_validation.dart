import 'package:app/pages/orders/order_confirm.dart';
import 'package:flutter/material.dart';
import 'package:uikit/components/buttons/grey_elevated_button.dart';
import 'package:uikit/dimens/dimens.dart';
import 'package:uikit/fonts/sizes.dart';
import 'package:uikit/components/buttons/primary_elevated_button.dart';

class SignupPhoneValidationPage extends StatefulWidget {
  const SignupPhoneValidationPage({super.key});

  @override
  State<SignupPhoneValidationPage> createState() =>
      _SignupPhoneValidationPageState();
}

class _SignupPhoneValidationPageState extends State<SignupPhoneValidationPage> {
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
                    'Código de recepción',
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
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromRGBO(208, 213, 221, 1),
                                width: 1,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: UIKitDimens.small,
                      ),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromRGBO(208, 213, 221, 1),
                                width: 1,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: UIKitDimens.small,
                      ),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromRGBO(208, 213, 221, 1),
                                width: 1,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: UIKitDimens.small,
                      ),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromRGBO(208, 213, 221, 1),
                                width: 1,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: UIKitDimens.medium,
                  ),
                  const Text(
                    'Este es el código que debe entregalrle el usuario para validar el pedido',
                  ),
                ],
              ),
            ),
            Column(
              children: [
                PrimaryElevatedButton(
                  onPressed: () {
                    goToOrderConfirm();
                  },
                  isFullWidth: true,
                  child: Text('Verificar Código'),
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
            ),
          ],
        ),
      ),
    );
  }

  goBack() async {
    Navigator.pop(context);
  }

  goToOrderConfirm() async {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const OrderConfirmPage(),
      ),
    );
  }
}
