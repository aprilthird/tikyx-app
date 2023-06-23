import 'package:app/layouts/default.dart';
import 'package:app/pages/signup/signup_final_message.dart';
import 'package:app/pages/signup/signup_id_upload.dart';
import 'package:app/pages/signup/signup_permission_upload.dart';
import 'package:app/pages/signup/signup_phone_validation.dart';
import 'package:app/pages/signup/signup_photo_upload.dart';
import 'package:app/pages/signup/signup_pick_location.dart';
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

class SignupSummaryPage extends StatefulWidget {
  const SignupSummaryPage({super.key});

  @override
  State<SignupSummaryPage> createState() => _SignupSummaryPageState();
}

class _SignupSummaryPageState extends State<SignupSummaryPage> {
  bool isLoading = false;
  bool firstStepCompleted = false;
  bool secondStepCompleted = false;
  bool thirdtepCompleted = false;
  bool fourthStepCompleted = false;

  Widget continueOrCompleted(bool isCompleted) {
    return isCompleted
        ? const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.check_circle,
                color: Colors.green,
              ),
              SizedBox(
                width: UIKitDimens.medium,
              ),
              Text(
                'Completado',
                style: TextStyle(
                  fontSize: UIKitFontSize.large,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          )
        : Text(
            'Comenzar',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: UIKitFontSize.large,
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.bold,
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
              'Registro de punto',
              style: TextStyle(
                fontSize: UIKitDimens.large,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: UIKitDimens.medium,
            ),
            const Text(
                'Necesitas completar todos los requisitos para habilitar el punto.'),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ShadowCard(
                    paddingValue: UIKitDimens.medium,
                    secondaryPaddingValue: UIKitDimens.small,
                    onPressed: () async {
                      await goToSignupPermissionUpload();
                      setState(() {
                        firstStepCompleted = true;
                      });
                    },
                    child: Column(
                      children: [
                        const Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.file_copy),
                            SizedBox(
                              width: UIKitDimens.medium,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Autorización Municipal',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text('Subir el documento para ser verificado'),
                              ],
                            )
                          ],
                        ),
                        const Divider(),
                        Row(
                          children: [
                            Expanded(
                              child: continueOrCompleted(firstStepCompleted),
                            ),
                            const Icon(Icons.arrow_right_alt),
                          ],
                        ),
                      ],
                    ),
                  ),
                  ShadowCard(
                    paddingValue: UIKitDimens.medium,
                    secondaryPaddingValue: UIKitDimens.small,
                    onPressed: () async {
                      await goToSignupPickLocation();
                      setState(() {
                        secondStepCompleted = true;
                      });
                    },
                    child: Column(
                      children: [
                        const Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.location_pin),
                            SizedBox(
                              width: UIKitDimens.medium,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Agregar Punto',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text('Subir fotos de punto o procesar'),
                              ],
                            )
                          ],
                        ),
                        const Divider(),
                        Row(
                          children: [
                            Expanded(
                              child: continueOrCompleted(secondStepCompleted),
                            ),
                            const Icon(Icons.arrow_right_alt),
                          ],
                        ),
                      ],
                    ),
                  ),
                  ShadowCard(
                    paddingValue: UIKitDimens.medium,
                    secondaryPaddingValue: UIKitDimens.small,
                    onPressed: () async {
                      await goToSignupIdUpload();
                      setState(() {
                        thirdtepCompleted = true;
                      });
                    },
                    child: Column(
                      children: [
                        const Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.perm_identity),
                            SizedBox(
                              width: UIKitDimens.medium,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Foto DNI',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text('Subir ambos lados del documento'),
                              ],
                            )
                          ],
                        ),
                        const Divider(),
                        Row(
                          children: [
                            Expanded(
                              child: continueOrCompleted(thirdtepCompleted),
                            ),
                            const Icon(Icons.arrow_right_alt),
                          ],
                        ),
                      ],
                    ),
                  ),
                  ShadowCard(
                    paddingValue: UIKitDimens.medium,
                    secondaryPaddingValue: UIKitDimens.small,
                    onPressed: () async {
                      await goToSignupPhotoUpload();
                      setState(() {
                        fourthStepCompleted = true;
                      });
                    },
                    child: Column(
                      children: [
                        const Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.person_3),
                            SizedBox(
                              width: UIKitDimens.medium,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Foto de perfil',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text('Esta foto será pública desde tu perfil'),
                              ],
                            )
                          ],
                        ),
                        const Divider(),
                        Row(
                          children: [
                            Expanded(
                              child: continueOrCompleted(fourthStepCompleted),
                            ),
                            const Icon(Icons.arrow_right_alt),
                          ],
                        ),
                      ],
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
                await goToSignupFinalMessage();
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
                        Text('Guardando'),
                      ],
                    )
                  : const Text('Continuar'),
            ),
          ],
        ),
      ),
    );
  }

  goBack() {
    Navigator.pop(context);
  }

  goToSignupFinalMessage() async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SignupFinalMessagePage(),
      ),
    );
  }

  goToSignupPermissionUpload() async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SignupPermissionUploadPage(),
      ),
    );
  }

  goToSignupPickLocation() async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SignupPickLocationPage(),
      ),
    );
  }

  goToSignupIdUpload() async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SignupIdUploadPage(),
      ),
    );
  }

  goToSignupPhotoUpload() async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SignupPhotoUploadPage(),
      ),
    );
  }
}
