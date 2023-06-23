import 'dart:io';

import 'package:app/layouts/default.dart';
import 'package:app/pages/signup/signup_phone_validation.dart';
import 'package:app/pages/signup/signup_summary.dart';
import 'package:data/repositories/auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uikit/components/buttons/grey_elevated_button.dart';
import 'package:uikit/components/buttons/primary_elevated_button.dart';
import 'package:uikit/components/buttons/white_elevated_button.dart';
import 'package:uikit/components/loaders/primary_button_loader.dart';
import 'package:uikit/dimens/dimens.dart';
import 'package:uikit/fonts/sizes.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:uikit/helpers/toasts.dart';

class SignupIdUploadPage extends StatefulWidget {
  const SignupIdUploadPage({super.key});

  @override
  State<SignupIdUploadPage> createState() => _SignupIdUploadPageState();
}

class _SignupIdUploadPageState extends State<SignupIdUploadPage> {
  bool isLoading = false;
  bool frontImageLoading = false;
  bool backImageLoading = false;
  File? frontImageFile;
  File? backImageFile;

  void pickImage(bool isFront) async {
    setState(() {
      if (isFront) {
        frontImageLoading = true;
      } else {
        backImageLoading = true;
      }
    });
    final file = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      if (isFront) {
        frontImageLoading = false;
      } else {
        backImageLoading = false;
      }
    });
    if (file != null) {
      setState(() {
        if (isFront) {
          frontImageFile = File(file.path);
        } else {
          backImageFile = File(file.path);
        }
      });
    }
  }

  Widget buildSelectedImage(bool isFront) {
    if (isFront) {
      if (!frontImageLoading) {
        if (frontImageFile != null) {
          return kIsWeb
              ? Image.network(frontImageFile!.path)
              : Image.file(frontImageFile!);
        }
        return const Image(
          image: AssetImage('assets/images/placeholder_image.png'),
        );
      }
      return const CircularProgressIndicator();
    }
    if (!backImageLoading) {
      if (backImageFile != null) {
        return kIsWeb
            ? Image.network(backImageFile!.path)
            : Image.file(backImageFile!);
      }
      return const Image(
        image: AssetImage('assets/images/placeholder_image.png'),
      );
    }
    return const CircularProgressIndicator();
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
              'Foto de tu DNI',
              style: TextStyle(
                fontSize: UIKitDimens.large,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: UIKitDimens.medium,
            ),
            const Text(
                'Proporciona una foto clara de tu documento siguiendo las instrucciones.'),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Frente del documento',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: UIKitDimens.medium,
                  ),
                  Container(
                    height: 100,
                    alignment: Alignment.center,
                    child: buildSelectedImage(true),
                  ),
                  const SizedBox(
                    height: UIKitDimens.medium,
                  ),
                  WhiteElevatedButton(
                    onPressed: () {
                      pickImage(true);
                    },
                    isFullWidth: true,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.camera_alt,
                          color: Theme.of(context).primaryColor,
                        ),
                        const SizedBox(
                          width: UIKitDimens.medium,
                        ),
                        const Text('Seleccionar foto')
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: UIKitDimens.extraLarge,
                  ),
                  const Text(
                    'Dorso del documento',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: UIKitDimens.medium,
                  ),
                  Container(
                    height: 100,
                    alignment: Alignment.center,
                    child: buildSelectedImage(false),
                  ),
                  const SizedBox(
                    height: UIKitDimens.medium,
                  ),
                  WhiteElevatedButton(
                    onPressed: () {
                      pickImage(false);
                    },
                    isFullWidth: true,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.camera_alt,
                          color: Theme.of(context).primaryColor,
                        ),
                        const SizedBox(
                          width: UIKitDimens.medium,
                        ),
                        const Text('Seleccionar foto')
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
                goBack();
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
                        Text('Enviando'),
                      ],
                    )
                  : const Text('Enviar y continuar'),
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
}
