import 'dart:io';

import 'package:app/pages/signup/signup_summary.dart';
import 'package:data/repositories/file.dart';
import 'package:data/repositories/nationality.dart';
import 'package:data/repositories/seller.dart';
import 'package:domain/models/nationality.dart';
import 'package:domain/models/seller.dart';
import 'package:domain/models/session.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uikit/components/buttons/grey_elevated_button.dart';
import 'package:uikit/components/buttons/primary_elevated_button.dart';
import 'package:uikit/components/cards/shadow_card.dart';
import 'package:uikit/components/inputs/custom_typeahead_form_field.dart';
import 'package:uikit/components/loaders/primary_button_loader.dart';
import 'package:uikit/dimens/dimens.dart';
import 'package:uikit/fonts/sizes.dart';

class SignupPickReferralPage extends StatefulWidget {
  const SignupPickReferralPage({
    super.key,
    required this.session,
    required this.seller,
  });

  final Session session;
  final Seller seller;

  @override
  State<SignupPickReferralPage> createState() => _SignupPickReferralPageState();
}

class _SignupPickReferralPageState extends State<SignupPickReferralPage> {
  final _autocompleteController = TextEditingController();
  Seller? _selectedReferral;
  bool isLoading = false;

  Widget selectedReferralCard() {
    final Iterable<Future> futures = _selectedReferral!.profileImageUrl == null
        ? [NationalityRepository.getById(_selectedReferral!.nationalityId)]
        : [
            NationalityRepository.getById(_selectedReferral!.nationalityId),
            FileRepository.downloadFile(
                "sellers", _selectedReferral!.profileImageUrl!)
          ];
    return ShadowCard(
      child: Center(
        child: FutureBuilder(
          future: Future.wait(futures),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var nationality = snapshot.requireData[0] as Nationality;
              var image = snapshot.data!.length < 2
                  ? Image.asset("assets/images/placeholder_user.jpg")
                  : kIsWeb
                      ? Image.network(
                          XFile.fromData(snapshot.requireData[1] as Uint8List)
                              .path)
                      : Image.file(File(
                          XFile.fromData(snapshot.requireData[1] as Uint8List)
                              .path));
              return Column(
                children: [
                  Row(
                    children: [
                      Container(
                        height: 75,
                        clipBehavior: Clip.antiAlias,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(UIKitDimens.small),
                        ),
                        child: image,
                      ),
                      const SizedBox(
                        width: UIKitDimens.medium,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _selectedReferral!.name,
                            style: const TextStyle(
                              fontSize: UIKitFontSize.large,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: UIKitDimens.small,
                          ),
                          const Text(
                            'Socio afiliado',
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: UIKitDimens.medium,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(UIKitDimens.small),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(UIKitDimens.medium),
                      child: Stack(
                        children: [
                          const Align(
                            alignment: Alignment.topRight,
                            child: Icon(Icons.pin_drop_outlined),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Ubicación',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                height: UIKitDimens.small,
                              ),
                              Text(
                                  "${_selectedReferral!.workCity} / ${nationality.name}"),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              );
            }
            return const CircularProgressIndicator();
          },
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
              'Registro de referido',
              style: TextStyle(
                fontSize: UIKitDimens.large,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: UIKitDimens.medium,
            ),
            const Text('Estos datos son privados para mejorar tu experiencia.'),
            const SizedBox(
              height: UIKitDimens.extraLarge,
            ),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Buscar por nombre o nro. de WhatsApp',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: UIKitDimens.medium,
                  ),
                  CustomTypeAheadFormField(
                    controller: _autocompleteController,
                    hintText: 'Buscar un referido...',
                    suffixIcon: const Icon(Icons.search),
                    minCharsForSuggestions: 1,
                    suggestionsCallback: (search) async {
                      return await SellerRepository.searchByName(search);
                    },
                    itemBuilder: (context, suggestion) {
                      return ListTile(
                        leading: const Icon(Icons.person_pin_rounded),
                        title: Text(suggestion!.name),
                        subtitle: Text(suggestion.workCity),
                      );
                    },
                    onSuggestionSelected: (suggestion) async {
                      setState(() {
                        _autocompleteController.text = suggestion!.name;
                        _selectedReferral = suggestion;
                      });
                      widget.seller.referralId = suggestion!.id;
                    },
                    noItemsFoundBuilder: (context) {
                      return const Padding(
                        padding: EdgeInsets.all(UIKitDimens.small),
                        child: Text(
                          'Ningún resultado encontrado.',
                          style: TextStyle(
                            fontSize: UIKitDimens.medium,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      );
                    },
                  ),
                  if (_selectedReferral != null) ...[
                    const SizedBox(
                      height: UIKitDimens.medium,
                    ),
                    selectedReferralCard(),
                  ],
                ],
              ),
            ),
            PrimaryElevatedButton(
              onPressed: () async {
                setState(() {
                  isLoading = true;
                });
                if (widget.seller.referralId != null) {
                  await goToSignupSummary();
                }
                setState(() {
                  isLoading = false;
                });
              },
              isFullWidth: true,
              child: widget.seller.referralId == null
                  ? const Text('Selecciona un referido')
                  : isLoading
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

  goToSignupSummary() async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SignupSummaryPage(
          session: widget.session,
          seller: widget.seller,
        ),
      ),
    );
  }
}
