import 'package:app/pages/login/login.dart';
import 'package:app/pages/onboarding/permissions.dart';
import 'package:flutter/material.dart';
import 'package:uikit/components/buttons/grey_elevated_button.dart';
import 'package:uikit/dimens/dimens.dart';
import 'package:uikit/fonts/sizes.dart';
import 'package:uikit/components/buttons/primary_elevated_button.dart';

class SignupFinalMessagePage extends StatefulWidget {
  const SignupFinalMessagePage({super.key});

  @override
  State<SignupFinalMessagePage> createState() => _SignupFinalMessagePagetate();
}

class _SignupFinalMessagePagetate extends State<SignupFinalMessagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(UIKitDimens.medium),
          child: Column(
            children: [
              const Text(
                'Registro de usuario',
                style: TextStyle(
                  fontSize: UIKitFontSize.large,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: UIKitDimens.medium,
              ),
              const Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image(
                      image: AssetImage('assets/images/icon_register_sent.png'),
                    ),
                    SizedBox(
                      height: UIKitDimens.medium,
                    ),
                    Text(
                      'Tu información fue recibida!',
                      style: TextStyle(
                        fontSize: UIKitFontSize.large,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: UIKitDimens.medium,
                    ),
                    Text(
                      'Será validada por los administradores y será notificado cuando sea aprobado',
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  PrimaryElevatedButton(
                    onPressed: () {
                      goToLogin();
                    },
                    isFullWidth: true,
                    child: const Text('Confirmar'),
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
              )
            ],
          ),
        ),
      ),
    );
  }

  goBack() async {
    Navigator.pop(context);
  }

  goToLogin() async {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginPage(),
      ),
    );
  }
}
