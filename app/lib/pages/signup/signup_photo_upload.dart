import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uikit/components/buttons/grey_elevated_button.dart';
import 'package:uikit/components/buttons/primary_elevated_button.dart';
import 'package:uikit/components/buttons/white_elevated_button.dart';
import 'package:uikit/components/loaders/primary_button_loader.dart';
import 'package:uikit/dimens/dimens.dart';
import 'package:domain/models/seller.dart';
import 'package:universal_io/io.dart';

class SignupPhotoUploadPage extends StatefulWidget {
  const SignupPhotoUploadPage({
    super.key,
    required this.seller,
  });

  final Seller seller;

  @override
  State<SignupPhotoUploadPage> createState() => _SignupPhotoUploadPageState();
}

class _SignupPhotoUploadPageState extends State<SignupPhotoUploadPage> {
  bool isLoading = false;
  bool imageLoading = false;
  XFile? imageFile;

  @override
  void initState() {
    super.initState();
    setState(() {
      imageFile = widget.seller.profileImageFile;
    });
  }

  void pickImage() async {
    setState(() {
      imageLoading = true;
    });
    final file = await ImagePicker().pickImage(source: ImageSource.camera);
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
        image: AssetImage('assets/images/placeholder_user.jpg'),
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
              'Foto de perfil',
              style: TextStyle(
                fontSize: UIKitDimens.large,
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 400,
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
    widget.seller.profileImageFile = imageFile;
    Navigator.pop(context, widget.seller);
  }
}
