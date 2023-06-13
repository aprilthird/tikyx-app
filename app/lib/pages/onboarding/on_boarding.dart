import 'package:app/pages/onboarding/permissions.dart';
import 'package:flutter/material.dart';
import 'package:uikit/dimens/dimens.dart';
import 'package:uikit/dimens/font_size.dart';
import 'package:uikit/components/buttons/primary_elevated_button.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('../assets/images/bg_on_boarding.png'),
                  fit: BoxFit.fitWidth,
                ),
              ),
              child: null,
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(UIKitDimens.medium),
              child: Column(
                children: [
                  const Text(
                    'Bienvenido a Tikyx',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: UIKitFontSize.extraLarge,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: UIKitDimens.medium,
                  ),
                  const SizedBox(
                    width: 280,
                    child: Text(
                      'Antes de empezar te pediremos algunos permisos para optimizar tu experiencia con nuestra app.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: UIKitFontSize.large),
                    ),
                  ),
                  const Spacer(),
                  PrimaryElevatedButton(
                    onPressed: () {
                      goToPermissionsPage();
                    },
                    isFullWidth: true,
                    child: const Text('Empezar'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  goToPermissionsPage() async {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const PermissionsPage(),
      ),
    );
  }
}
