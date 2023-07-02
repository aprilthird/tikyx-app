import 'dart:developer';
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
import 'package:domain/models/pup.dart';
import 'package:universal_io/io.dart';

class SignupPermissionUploadPage extends StatefulWidget {
  const SignupPermissionUploadPage({
    super.key,
    required this.pup,
  });

  final Pup pup;

  @override
  State<SignupPermissionUploadPage> createState() =>
      _SignupPermissionUploadPageState();
}

class _SignupPermissionUploadPageState
    extends State<SignupPermissionUploadPage> {
  bool isLoading = false;
  bool imageLoading = false;
  XFile? imageFile;

  @override
  void initState() {
    super.initState();
    setState(() {
      imageFile = widget.pup.authImageFile;
    });
  }

  void pickImage() async {
    setState(() {
      imageLoading = true;
    });
    final file = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (file != null) {
      setState(() {
        imageFile = file;
      });
    }
    setState(() {
      imageLoading = false;
    });
  }

  Widget buildSelectedImage() {
    if (!imageLoading) {
      if (imageFile != null) {
        return kIsWeb
            ? Image.network(imageFile!.path)
            : Image.file(File(imageFile!.path));
      }
      return const Image(
        image: AssetImage('assets/images/placeholder_file.png'),
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
              'Autorización Municipal',
              style: TextStyle(
                fontSize: UIKitDimens.large,
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 250,
                    alignment: Alignment.center,
                    child: buildSelectedImage(),
                  ),
                  const SizedBox(
                    height: UIKitDimens.medium,
                  ),
                  WhiteElevatedButton(
                    onPressed: () {
                      pickImage();
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
                    height: UIKitDimens.large,
                  ),
                  const Text(
                      '1. La fotografía debe ser clara y legible. Todas las esquinas del documento deben ser visibles.'),
                  const Text(
                      '2. Podés subir la Constancia de Seguro, Certificado de Cobertura o Frente de Póliza.'),
                  const Text(
                      '3. Asegúrate de que los datos coincidan con los ingresados en la cédula del vehículo.'),
                  const Text('4. Asegúrate que el documento esté vigente.'),
                ],
              ),
            ),
            PrimaryElevatedButton(
              onPressed: () async {
                setState(() {
                  isLoading = true;
                });
                if (imageFile != null) {
                  goBackAndSave();
                }
                setState(() {
                  isLoading = false;
                });
              },
              isFullWidth: true,
              child: imageFile == null
                  ? const Text('Selecciona una imagen')
                  : isLoading
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

  goBackAndSave() {
    widget.pup.authImageFile = imageFile;
    Navigator.pop(context, widget.pup);
  }
}
