import 'package:app/layouts/default.dart';
import 'package:app/pages/signup/signup_personal_data.dart';
import 'package:app/pages/signup/signup_phone_validation.dart';
import 'package:data/repositories/auth.dart';
import 'package:flutter/material.dart';
import 'package:uikit/components/buttons/grey_elevated_button.dart';
import 'package:uikit/components/buttons/primary_elevated_button.dart';
import 'package:uikit/components/cards/shadow_card.dart';
import 'package:uikit/components/loaders/primary_button_loader.dart';
import 'package:uikit/dimens/dimens.dart';
import 'package:uikit/fonts/sizes.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:uikit/helpers/toasts.dart';

class SignupPickRolePage extends StatefulWidget {
  const SignupPickRolePage({super.key});

  @override
  State<SignupPickRolePage> createState() => _SignupPickRolePageState();
}

class _SignupPickRolePageState extends State<SignupPickRolePage> {
  int roleSelected = 0;

  Widget selectedCheck() {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(UIKitDimens.medium),
        ),
        padding: const EdgeInsets.all(UIKitDimens.extraSmall),
        child: const Icon(
          Icons.check,
          color: Colors.white,
        ),
      ),
    );
  }

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
              'Selecciona una acción',
              style: TextStyle(
                fontSize: UIKitDimens.large,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: UIKitDimens.medium,
            ),
            const Text(
                'Selecciona la opción que más se ajusta a tu requerimiento dentro de nuestra plataforma.'),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ShadowCard(
                    onPressed: () {
                      setState(() {
                        roleSelected = 1;
                      });
                    },
                    borderColor: roleSelected == 1
                        ? Theme.of(context).primaryColor
                        : null,
                    child: Stack(
                      children: [
                        const Row(
                          children: [
                            Image(
                              image: AssetImage(
                                  '../assets/images/icon_role_vendor.png'),
                            ),
                            SizedBox(
                              width: UIKitDimens.medium,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Tengo mi puesto',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                    'Esta es una descripción corta de máximo 2 líneas.'),
                              ],
                            ),
                          ],
                        ),
                        if (roleSelected == 1) ...[selectedCheck()],
                      ],
                    ),
                  ),
                  ShadowCard(
                    onPressed: () {
                      setState(() {
                        roleSelected = 2;
                      });
                    },
                    borderColor: roleSelected == 2
                        ? Theme.of(context).primaryColor
                        : null,
                    child: Stack(
                      children: [
                        const Row(
                          children: [
                            Image(
                              image: AssetImage(
                                  '../assets/images/icon_role_subscriber.png'),
                            ),
                            SizedBox(
                              width: UIKitDimens.medium,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Subscribirme a un puesto',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                    'Esta es una descripción corta de máximo 2 líneas.'),
                              ],
                            ),
                          ],
                        ),
                        if (roleSelected == 2) ...[selectedCheck()],
                      ],
                    ),
                  ),
                ],
              ),
            ),
            PrimaryElevatedButton(
              onPressed: () {
                goToSignupPersonalData();
              },
              isFullWidth: true,
              child: const Text('Continuar'),
            ),
          ],
        ),
      ),
    );
  }

  goToSignupPersonalData() async {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SignupPersonalDataPage(),
      ),
    );
  }
}
