import 'package:app/layouts/default.dart';
import 'package:data/repositories/auth.dart';
import 'package:flutter/material.dart';
import 'package:uikit/components/buttons/grey_elevated_button.dart';
import 'package:uikit/components/buttons/primary_elevated_button.dart';
import 'package:uikit/components/loaders/primary_button_loader.dart';
import 'package:uikit/dimens/dimens.dart';
import 'package:uikit/fonts/sizes.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:uikit/helpers/toasts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isLogin = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(UIKitDimens.medium),
        child: Column(
          children: [
            const Image(
              image: AssetImage('../assets/images/icon_marketplace.png'),
            ),
            const SizedBox(
              height: UIKitDimens.medium,
            ),
            const SizedBox(
              width: 150,
              child: Image(
                image: AssetImage('../assets/images/logo_alt_primary.png'),
              ),
            ),
            const SizedBox(
              height: UIKitDimens.extraLarge,
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Bienvenido!',
                style: TextStyle(
                  fontSize: UIKitFontSize.doubleExtraLarge,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: UIKitDimens.medium,
            ),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Ingresa tu número telefónico',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: UIKitDimens.medium,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Teléfono',
                      labelText: 'Teléfono',
                      prefixIcon: CountryCodePicker(
                        onChanged: (countryCode) {},
                        // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                        initialSelection: 'IT',
                        favorite: ['+51', 'PE'],
                        // optional. Shows only country name and flag
                        showCountryOnly: false,
                        // optional. Shows only country name and flag when popup is closed.
                        showOnlyCountryWhenClosed: false,
                        // optional. aligns the flag and the Text left
                        alignLeft: false,
                      ),
                      isDense: true,
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromRGBO(208, 213, 221, 1),
                          width: 1,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            PrimaryElevatedButton(
              onPressed: () {
                setState(() {
                  isLogin = true;
                });
                AuthRepository.signIn("test").then((value) async {
                  await ToastHelpers.showSuccess("Sesión iniciada.");
                  goToMainLayout();
                }).onError((error, stackTrace) async {
                  setState(() {
                    isLogin = false;
                  });
                  await ToastHelpers.showError("Error al iniciar sesión.");
                });
              },
              isFullWidth: true,
              child: isLogin
                  ? const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        PrimaryButtonLoader(),
                        SizedBox(
                          width: UIKitDimens.small,
                        ),
                        Text('Entrando'),
                      ],
                    )
                  : const Text('Entrar'),
            ),
            const SizedBox(
              height: UIKitDimens.medium,
            ),
            GreyElevatedButton(
              onPressed: () {
                goToMainLayout();
              },
              isFullWidth: true,
              child: const Text('Crear cuenta'),
            ),
          ],
        ),
      ),
    );
  }

  goToMainLayout() async {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const DefaultLayout(),
      ),
    );
  }
}
