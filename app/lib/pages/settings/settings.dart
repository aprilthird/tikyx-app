import 'dart:io';

import 'package:core/utils/message.dart';
import 'package:cross_file/cross_file.dart';
import 'package:data/repositories/file.dart';
import 'package:data/repositories/gender.dart';
import 'package:data/repositories/nationality.dart';
import 'package:domain/models/gender.dart';
import 'package:domain/models/nationality.dart';
import 'package:domain/models/seller.dart';
import 'package:domain/models/session.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:uikit/components/cards/shadow_card.dart';
import 'package:uikit/components/inputs/custom_dropdown_form_field.dart';
import 'package:uikit/components/inputs/custom_text_form_field.dart';
import 'package:uikit/dimens/dimens.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({
    super.key,
    required this.session,
    required this.seller,
  });

  final Session session;
  final Seller seller;

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  Widget profilePicture() {
    if (widget.seller.profileImageUrl == null) {
      return Image.asset('assets/images/placeholder_user.png');
    }
    final future =
        FileRepository.downloadFile("sellers", widget.seller.profileImageUrl!);
    return FutureBuilder(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return kIsWeb
              ? Image.network(XFile.fromData(snapshot.data as Uint8List).path)
              : Image.file(
                  File(XFile.fromData(snapshot.data as Uint8List).path));
        }
        return Image.asset('assets/images/placeholder_user.png');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(UIKitDimens.medium),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 140,
            child: Stack(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 120,
                      alignment: Alignment.center,
                      clipBehavior: Clip.antiAlias,
                      margin: const EdgeInsets.only(bottom: UIKitDimens.large),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(200),
                      ),
                      child: profilePicture(),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: ShadowCard(
                    onPressed: () {},
                    borderRadiusValue: UIKitDimens.extraExtraLarge,
                    child: Icon(
                      Icons.camera_alt_outlined,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Center(
              child: FutureBuilder(
                future: Future.wait([
                  NationalityRepository.getAll(),
                  GenderRepository.getAll()
                ]),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final nationalities =
                        snapshot.data![0] as List<Nationality>;
                    final genders = snapshot.data![1] as List<Gender>;
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextFormField(
                          initialValue: "31131941",
                          hideText: false,
                          hintText: 'ID de referido',
                          labelText: 'ID de referido',
                          prefixIcon: const Icon(Icons.info_outline),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return MessageUtils.requiredError(
                                  "ID de referido");
                            }
                            widget.seller.name = value;
                            return null;
                          },
                        ),
                        CustomTextFormField(
                          initialValue: widget.seller.userId,
                          hideText: false,
                          hintText: 'CBU o cuenta de MercadoPago',
                          labelText: 'CBU o cuenta de MercadoPago',
                          prefixIcon: const Icon(Icons.info_outline),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return MessageUtils.requiredError(
                                  "CBU o cuenta de MercadoPago");
                            }
                            widget.seller.name = value;
                            return null;
                          },
                        ),
                        CustomTextFormField(
                          initialValue: widget.seller.name,
                          hideText: false,
                          hintText: 'Nombres y Apellidos',
                          labelText: 'Nombres y Apellidos',
                          prefixIcon: const Icon(Icons.info_outline),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return MessageUtils.requiredError(
                                  "Nombres y Apellidos");
                            }
                            widget.seller.name = value;
                            return null;
                          },
                        ),
                        CustomDropdownFormField(
                          value: widget.seller.genderId,
                          hint: const Text('Género'),
                          prefixIcon: const Icon(Icons.people),
                          onChanged: (value) {},
                          items: genders
                              .map(
                                (item) => DropdownMenuItem<int>(
                                  value: item.id,
                                  child: Text(item.name),
                                ),
                              )
                              .toList(),
                          validator: (value) {
                            if (value == null) {
                              return MessageUtils.requiredError("Género");
                            }
                            widget.seller.genderId = value;
                            return null;
                          },
                        ),
                        CustomDropdownFormField(
                          value: widget.seller.nationalityId,
                          hint: const Text('Nacionalidad'),
                          prefixIcon: const Icon(Icons.flag),
                          onChanged: (value) {},
                          items: nationalities
                              .map(
                                (item) => DropdownMenuItem<int>(
                                  value: item.id,
                                  child: Text(item.name),
                                ),
                              )
                              .toList(),
                          validator: (value) {
                            if (value == null) {
                              return MessageUtils.requiredError("Nacionalidad");
                            }
                            widget.seller.nationalityId = value;
                            return null;
                          },
                        ),
                        CustomTextFormField(
                          initialValue: widget.seller.workCity,
                          hideText: false,
                          hintText: 'Ciudad de trabajo',
                          labelText: 'Ciudad de trabajo',
                          prefixIcon: const Icon(Icons.work),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return MessageUtils.requiredError(
                                  "Ciudad de trabajo");
                            }
                            widget.seller.workCity = value;
                            return null;
                          },
                        ),
                      ],
                    );
                  }
                  return const CircularProgressIndicator();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
