import 'package:app/pages/orders/order_confirm.dart';
import 'package:app/pages/signup/signup_pick_role.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:uikit/components/buttons/grey_elevated_button.dart';
import 'package:uikit/components/loaders/primary_button_loader.dart';
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
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(UIKitDimens.medium),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Verificación',
              style: TextStyle(
                fontSize: UIKitDimens.large,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: UIKitDimens.medium,
            ),
            const Text(
                'Te enviamos un SMS con el código de verificación de 4 dígitos al número:'),
            const SizedBox(
              height: UIKitDimens.medium,
            ),
            Text(
              '+54 11 2134 5589',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  PinCodeTextField(
                    appContext: context,
                    length: 6,
                    // animationType: AnimationType.fade,
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      fieldHeight: 60,
                      fieldWidth: 50,
                      disabledColor: Colors.white,
                      activeFillColor: Colors.white,
                      inactiveColor: Colors.white,
                      activeColor: Colors.white,
                      inactiveFillColor: Colors.white,
                      selectedColor: Theme.of(context).primaryColor,
                      selectedFillColor: Colors.white,
                      borderRadius: BorderRadius.circular(UIKitDimens.medium),
                    ),
                    keyboardType: TextInputType.number,
                    enableActiveFill: true,
                    cursorColor: Theme.of(context).primaryColor,
                    autoFocus: true,
                    boxShadows: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.25),
                        spreadRadius: 5,
                        blurRadius: 10,
                        offset: const Offset(0, 3),
                      ),
                    ],
                    onCompleted: (value) {},
                    onChanged: (value) {},
                  ),
                  const SizedBox(
                    height: UIKitDimens.medium,
                  ),
                  const Text(
                    'Reenviar código',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
            ),
            PrimaryElevatedButton(
              onPressed: () async {
                setState(() {
                  isLoading = true;
                });
                await Future.delayed(const Duration(seconds: 2));
                await goToSignupPickRole();
                setState(() {
                  isLoading = false;
                });
              },
              isFullWidth: true,
              child: isLoading
                  ? const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        PrimaryButtonLoader(),
                        SizedBox(
                          width: UIKitDimens.small,
                        ),
                        Text('Validando'),
                      ],
                    )
                  : const Text('Verificar Código'),
            ),
            const SizedBox(
              height: UIKitDimens.medium,
            ),
            GreyElevatedButton(
              onPressed: () {
                goBack();
              },
              isFullWidth: true,
              child: const Text('Cancelar'),
            ),
          ],
        ),
      ),
    );
  }

  goBack() {
    Navigator.pop(context);
  }

  goToSignupPickRole() async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SignupPickRolePage(),
      ),
    );
  }
}
