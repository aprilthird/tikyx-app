import 'package:flutter/material.dart';
import 'package:uikit/components/buttons/primary_elevated_button.dart';
import 'package:uikit/components/cards/shadow_card.dart';
import 'package:uikit/dimens/dimens.dart';
import 'package:uikit/fonts/sizes.dart';

class UserSettingsPage extends StatefulWidget {
  const UserSettingsPage({super.key});

  @override
  State<UserSettingsPage> createState() => _UserSettingsPageState();
}

class _UserSettingsPageState extends State<UserSettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(UIKitDimens.medium),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    decoration: new BoxDecoration(color: Colors.white),
                    height: 50,
                    child: Stack(
                      children: <Widget>[
                        const Image(
                          alignment: Alignment.center,
                          image: AssetImage('assets/images/icon_profile.png'),
                        ),
                        Positioned(
                          top: 25,
                          left: 10,
                          //give the values according to your requirement
                          child: Icon(
                            Icons.camera_alt,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const Text(
                'ID de referido',
                style: TextStyle(
                  fontSize: UIKitDimens.large,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                '324561231',
                style: TextStyle(
                  fontSize: UIKitDimens.large,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: UIKitDimens.large,
              ),
              const Text(
                'CBU o cuenta de Mercadopago',
                style: TextStyle(
                  fontSize: UIKitDimens.large,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                '28505909400904181135201',
                style: TextStyle(
                  fontSize: UIKitDimens.large,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: UIKitDimens.large,
              ),
              const Text(
                'Nombre y Apellidos',
                style: TextStyle(
                  fontSize: UIKitDimens.large,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                'Juan Perez',
                style: TextStyle(
                  fontSize: UIKitDimens.large,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: UIKitDimens.large,
              ),
              const Text(
                'Género:',
                style: TextStyle(
                  fontSize: UIKitDimens.large,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                'Masculino',
                style: TextStyle(
                  fontSize: UIKitDimens.large,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: UIKitDimens.large,
              ),
              const Text(
                'Nacionalidad:',
                style: TextStyle(
                  fontSize: UIKitDimens.large,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                'Argentina',
                style: TextStyle(
                  fontSize: UIKitDimens.large,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: UIKitDimens.large,
              ),
              const Text(
                'Ciudad de trabajo:',
                style: TextStyle(
                  fontSize: UIKitDimens.large,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                'Buenos Aires',
                style: TextStyle(
                  fontSize: UIKitDimens.large,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: UIKitDimens.large,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
