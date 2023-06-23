import 'package:app/pages/login/login.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:uikit/components/buttons/primary_elevated_button.dart';
import 'package:uikit/components/buttons/grey_elevated_button.dart';
import 'package:uikit/components/cards/shadow_card.dart';
import 'package:uikit/dimens/dimens.dart';
import 'package:uikit/fonts/sizes.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionsPage extends StatefulWidget {
  const PermissionsPage({super.key});

  @override
  State<PermissionsPage> createState() => _PermissionsPageState();
}

class _PermissionsPageState extends State<PermissionsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(UIKitDimens.medium),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(
              alignment: Alignment.center,
              image: AssetImage('assets/images/icon_permission.png'),
            ),
            const SizedBox(
              height: UIKitDimens.medium,
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Aviso de Privacidad',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: UIKitFontSize.extraLarge,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: UIKitDimens.small,
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Tikyx socio necesita los siguientes permisos:',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: UIKitFontSize.large,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ShadowCard(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(Icons.location_on_outlined),
                            SizedBox(
                              width: UIKitDimens.small,
                            ),
                            Text(
                              'Ubicación',
                              style: TextStyle(
                                fontSize: UIKitFontSize.large,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                        Text(
                          'Optimiza el registro e inicio de sesión, ayuda a obtener el punto de encuentro/destino, a calcular tarifas y monitorear la seguridad. Para una mejor experiencia, selecciona "Permitir siempre".',
                          style: TextStyle(
                            fontSize: UIKitFontSize.large,
                          ),
                        ),
                      ],
                    ),
                  ),
                  ShadowCard(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(Icons.mobile_friendly),
                            SizedBox(
                              width: UIKitDimens.small,
                            ),
                            Text(
                              'Información del dispositivo',
                              style: TextStyle(
                                fontSize: UIKitFontSize.large,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                        Text(
                          'Ayuda a realizar y gestionar llamadas y permite a la plataforma brindar servicios como la administración de tu cuenta y al prevención de fraude.',
                          style: TextStyle(
                            fontSize: UIKitFontSize.large,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            PrimaryElevatedButton(
              onPressed: () {
                grantPermissions();
              },
              isFullWidth: true,
              child: const Text('Permitir'),
            ),
            const SizedBox(
              height: UIKitDimens.small,
            ),
            GreyElevatedButton(
              onPressed: () => goBack(),
              isFullWidth: true,
              child: const Text('No permitir y salir'),
            )
          ],
        ),
      ),
    );
  }

  grantPermissions() async {
    if (kIsWeb) {
      goToLoginPage();
      return;
    }

    var locationStatus = await Permission.location.status;
    var cameraStatus = await Permission.camera.status;

    if (locationStatus.isDenied) {
      locationStatus = await Permission.location.request();
    }
    if (cameraStatus.isDenied) {
      cameraStatus = await Permission.camera.request();
    }
    if (locationStatus.isPermanentlyDenied ||
        cameraStatus.isPermanentlyDenied) {
      openAppSettings();
    }
    if (locationStatus.isGranted && cameraStatus.isGranted) {
      goToLoginPage();
    }
  }

  goToLoginPage() async {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginPage(),
      ),
    );
  }

  goBack() async {
    Navigator.pop(context);
  }
}
