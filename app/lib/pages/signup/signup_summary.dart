import 'package:app/pages/signup/signup_final_message.dart';
import 'package:app/pages/signup/signup_id_upload.dart';
import 'package:app/pages/signup/signup_permission_upload.dart';
import 'package:app/pages/signup/signup_photo_upload.dart';
import 'package:app/pages/signup/signup_pick_location.dart';
import 'package:core/utils/seller.dart';
import 'package:data/repositories/auth.dart';
import 'package:data/repositories/file.dart';
import 'package:data/repositories/seller.dart';
import 'package:data/repositories/pup.dart';
import 'package:domain/models/pup.dart';
import 'package:domain/models/session.dart';
import 'package:flutter/material.dart';
import 'package:domain/models/seller.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uikit/components/buttons/primary_elevated_button.dart';
import 'package:uikit/components/cards/shadow_card.dart';
import 'package:uikit/components/loaders/primary_button_loader.dart';
import 'package:uikit/dimens/dimens.dart';
import 'package:uikit/fonts/sizes.dart';
import 'package:uikit/helpers/toasts.dart';

class SignupSummaryPage extends StatefulWidget {
  const SignupSummaryPage({
    super.key,
    required this.session,
    required this.seller,
    this.pup,
  });

  final Session session;
  final Seller seller;
  final Pup? pup;

  @override
  State<SignupSummaryPage> createState() => _SignupSummaryPageState();
}

class _SignupSummaryPageState extends State<SignupSummaryPage> {
  bool isLoading = false;
  bool firstStepCompleted = false;
  bool secondStepCompleted = false;
  bool thirdStepCompleted = false;
  bool fourthStepCompleted = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      var results = await SellerRepository.getAll();
      var test = widget.session.user.id;
      var results1 = await PupRepository.getAll();

      await FileRepository.deleteFile("sellers",
          "3688ff97-7e6c-4584-bf9a-651263263110/profile/test_profile.png");
      await FileRepository.deleteFile("sellers",
          "3688ff97-7e6c-4584-bf9a-651263263110/id_front/test_id_front.png");
      await FileRepository.deleteFile("sellers",
          "3688ff97-7e6c-4584-bf9a-651263263110/id_back/test_id_back.png");
      await FileRepository.deleteFile("sellers",
          "3688ff97-7e6c-4584-bf9a-651263263110/pup_munic/test_munic.png");
      await FileRepository.deleteFile("sellers",
          "3688ff97-7e6c-4584-bf9a-651263263110/pup_local_1/test_loc_1.png");
      await FileRepository.deleteFile("sellers",
          "3688ff97-7e6c-4584-bf9a-651263263110/pup_local_2/test_loc_2.png");
    });
  }

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
                  if (widget.seller.type == SellerUtils.typeOwner) ...[
                    ShadowCard(
                      paddingValue: UIKitDimens.medium,
                      secondaryPaddingValue: UIKitDimens.small,
                      onPressed: () async {
                        await goToSignupPermissionUpload();
                      },
                      child: Column(
                        children: [
                          const Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(Icons.insert_drive_file_outlined),
                              SizedBox(
                                width: UIKitDimens.medium,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Autorización Municipal',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                      'Subir el documento para ser verificado'),
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
                      },
                      child: Column(
                        children: [
                          const Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(Icons.place_outlined),
                              SizedBox(
                                width: UIKitDimens.medium,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Agregar Punto',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
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
                  ],
                  ShadowCard(
                    paddingValue: UIKitDimens.medium,
                    secondaryPaddingValue: UIKitDimens.small,
                    onPressed: () async {
                      await goToSignupIdUpload();
                    },
                    child: Column(
                      children: [
                        const Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.contact_emergency_outlined),
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
                              child: continueOrCompleted(thirdStepCompleted),
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
                    },
                    child: Column(
                      children: [
                        const Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.perm_contact_calendar_outlined),
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
                var stepsCompleted = widget.seller.type == SellerUtils.typeOwner
                    ? firstStepCompleted &&
                        secondStepCompleted &&
                        thirdStepCompleted &&
                        fourthStepCompleted
                    : thirdStepCompleted && fourthStepCompleted;
                if (!stepsCompleted) {
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: const Text('Tienes pasos pendientes de completar'),
                      elevation: UIKitDimens.large,
                      actions: [
                        TextButton(
                          child: const Text('Ok'),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                    barrierDismissible: true,
                  );
                  return;
                }

                setState(() {
                  isLoading = true;
                });
                var idBackPath =
                    "${widget.session.user.id}/id_back/${widget.seller.idBackImageFile!.name}";
                var idFrontPath =
                    "${widget.session.user.id}/id_front/${widget.seller.idFrontImageFile!.name}";
                var profilePicturePath =
                    "${widget.session.user.id}/profile/${widget.seller.profileImageFile!.name}";

                await FileRepository.uploadFile(
                    "sellers", idBackPath, widget.seller.idBackImageFile!);
                await FileRepository.uploadFile(
                    "sellers", idFrontPath, widget.seller.idFrontImageFile!);
                await FileRepository.uploadFile("sellers", profilePicturePath,
                    widget.seller.profileImageFile!);

                widget.seller.idFrontImageUrl = idFrontPath;
                widget.seller.idBackImageUrl = idBackPath;
                widget.seller.profileImageUrl = profilePicturePath;

                var seller = await SellerRepository.create(widget.seller);

                if (widget.seller.type == SellerUtils.typeOwner) {
                  var authPath =
                      "${widget.session.user.id}/pup_munic/${widget.pup!.authImageFile!.name}";
                  await FileRepository.uploadFile(
                      "sellers", authPath, widget.pup!.authImageFile!);
                  widget.pup!.authImageUrl = authPath;

                  if (widget.pup!.locationImageFile1 != null) {
                    var path =
                        "${widget.session.user.id}/pup_local_1/${widget.pup!.locationImageFile1!.name}";
                    await FileRepository.uploadFile(
                        "sellers", path, widget.pup!.locationImageFile1!);
                    widget.pup!.locationImage1Url = path;
                  }
                  if (widget.pup!.locationImageFile2 != null) {
                    var path =
                        "${widget.session.user.id}/pup_local_2/${widget.pup!.locationImageFile2!.name}";
                    await FileRepository.uploadFile(
                        "sellers", path, widget.pup!.locationImageFile2!);
                    widget.pup!.locationImage2Url = path;
                  }
                  if (widget.pup!.locationImageFile3 != null) {
                    var path =
                        "${widget.session.user.id}/pup_local_3/${widget.pup!.locationImageFile3!.name}";
                    await FileRepository.uploadFile(
                        "sellers", path, widget.pup!.locationImageFile3!);
                    widget.pup!.locationImage3Url = path;
                  }
                  if (widget.pup!.locationImageFile4 != null) {
                    var path =
                        "${widget.session.user.id}/pup_local_1/${widget.pup!.locationImageFile4!.name}";
                    await FileRepository.uploadFile(
                        "sellers", path, widget.pup!.locationImageFile4!);
                    widget.pup!.locationImage4Url = path;
                  }

                  widget.pup!.ownerId = seller.id;
                  await PupRepository.create(widget.pup!);
                }

                await AuthRepository.signOut();
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
    final result = await Navigator.push<Pup>(
      context,
      MaterialPageRoute(
        builder: (context) => SignupPermissionUploadPage(
          pup: widget.pup!,
        ),
      ),
    );

    if (!mounted) return;

    if (result != null) {
      if (result.authImageFile != null) {
        await ToastHelpers.showSuccess("Autorización cargada.");
        widget.pup!.authImageFile = result.authImageFile;
        setState(() {
          firstStepCompleted = true;
        });
      }
    }
  }

  goToSignupPickLocation() async {
    final result = await Navigator.push<Pup>(
      context,
      MaterialPageRoute(
        builder: (context) => SignupPickLocationPage(
          pup: widget.pup!,
        ),
      ),
    );

    if (!mounted) return;

    if (result != null) {
      widget.pup!.latitude = result.latitude;
      widget.pup!.longitude = result.longitude;
      if (result.locationImageFile1 != null) {
        widget.pup!.locationImageFile1 = result.locationImageFile1;
      }
      if (result.locationImageFile2 != null) {
        widget.pup!.locationImageFile2 = result.locationImageFile2;
      }
      if (result.locationImageFile3 != null) {
        widget.pup!.locationImageFile3 = result.locationImageFile3;
      }
      if (result.locationImageFile4 != null) {
        widget.pup!.locationImageFile4 = result.locationImageFile4;
      }
      setState(() {
        secondStepCompleted = true;
      });
    }
  }

  goToSignupIdUpload() async {
    final result = await Navigator.push<Seller>(
      context,
      MaterialPageRoute(
        builder: (context) => SignupIdUploadPage(
          seller: widget.seller,
        ),
      ),
    );

    if (!mounted) return;

    if (result != null) {
      if (result.idFrontImageFile != null && result.idBackImageFile != null) {
        await ToastHelpers.showSuccess("DNI cargado.");
        widget.seller.idFrontImageFile = result.idFrontImageFile;
        widget.seller.idBackImageFile = result.idBackImageFile;
        setState(() {
          thirdStepCompleted = true;
        });
      }
    }
  }

  goToSignupPhotoUpload() async {
    final result = await Navigator.push<Seller>(
      context,
      MaterialPageRoute(
        builder: (context) => SignupPhotoUploadPage(
          seller: widget.seller,
        ),
      ),
    );

    if (!mounted) return;

    if (result != null) {
      if (result.profileImageFile != null) {
        await ToastHelpers.showSuccess("Foto de perfil cargada.");
        widget.seller.profileImageFile = result.profileImageFile;
        setState(() {
          fourthStepCompleted = true;
        });
      }
    }
  }
}
