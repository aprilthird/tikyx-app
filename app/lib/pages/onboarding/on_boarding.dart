import 'package:app/pages/login/login.dart';
import 'package:app/pages/onboarding/permissions.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:uikit/dimens/dimens.dart';
import 'package:uikit/fonts/sizes.dart';
import 'package:uikit/components/buttons/primary_elevated_button.dart';
import 'package:data/repositories/file.dart';
import 'package:google_fonts/google_fonts.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

late Future googleFontsPending;

class _OnBoardingPageState extends State<OnBoardingPage> {
  @override
  void initState() {
    super.initState();

    googleFontsPending = GoogleFonts.pendingFonts([
      GoogleFonts.poppins(),
      GoogleFonts.montserrat(fontStyle: FontStyle.italic),
    ]);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      FileRepository.getBuckets();
      FileRepository.getFiles("sellers");
    });
  }

  @override
  Widget build(BuildContext context) {
    final customTextStyle = GoogleFonts.poppins(
      textStyle: Theme.of(context).textTheme.headlineMedium,
    );

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
                  image: AssetImage('assets/images/bg_on_boarding.png'),
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
                  Text(
                    'Bienvenido a Tikyx',
                    textAlign: TextAlign.center,
                    // style: TextStyle(
                    //   fontSize: UIKitFontSize.extraLarge,
                    //   fontWeight: FontWeight.bold,
                    // ),
                    style: customTextStyle,
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
                    onPressed: () async {
                      await goToPermissionsOrLogin();
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

  goToPermissionsOrLogin() async {
    if (kIsWeb) {
      await goToLoginPage();
      return;
    }
    var locationStatus = await Permission.location.status;
    var cameraStatus = await Permission.camera.status;
    if (locationStatus.isGranted || cameraStatus.isGranted) {
      await goToLoginPage();
      return;
    }
    await goToPermissionsPage();
  }

  goToPermissionsPage() async {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const PermissionsPage(),
      ),
    );
  }

  goToLoginPage() async {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginPage(),
      ),
    );
  }
}
