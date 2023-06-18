import 'package:app/layouts/default.dart';
import 'package:app/pages/signup/signup_phone_validation.dart';
import 'package:app/pages/signup/signup_summary.dart';
import 'package:data/repositories/auth.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:uikit/components/buttons/grey_elevated_button.dart';
import 'package:uikit/components/buttons/primary_elevated_button.dart';
import 'package:uikit/components/loaders/primary_button_loader.dart';
import 'package:uikit/dimens/dimens.dart';
import 'package:uikit/fonts/sizes.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:uikit/helpers/toasts.dart';

class SignupPersonalDataPage extends StatefulWidget {
  const SignupPersonalDataPage({super.key});

  @override
  State<SignupPersonalDataPage> createState() => _SignupPersonalDataPageState();
}

class _SignupPersonalDataPageState extends State<SignupPersonalDataPage> {
  bool isLoading = false;
  final List<String> genderItems = [
    'Masculino',
    'Femenino',
  ];
  final List<String> nationalityItems = [
    'Argentina',
    'Colombia',
    'Chile',
    'Perú',
    'Uruguay',
    'Bolivia',
    'Paraguay',
    'Ecuador',
    'Venezuela',
    'Brasil',
  ];

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
              'Información personal',
              style: TextStyle(
                fontSize: UIKitDimens.large,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: UIKitDimens.medium,
            ),
            const Text('Estos datos son privados para mejorar tu experiencia.'),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Nombres y Apellidos',
                      labelText: 'Nombres y Apellidos',
                      prefixIcon: Icon(Icons.info_outline),
                      isDense: true,
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromRGBO(208, 213, 221, 1),
                          width: 1,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: UIKitDimens.medium,
                  ),
                  DropdownButtonFormField2(
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.zero,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(UIKitDimens.medium),
                      ),
                      prefixIcon: Icon(Icons.battery_saver),
                    ),
                    isExpanded: true,
                    hint: const Text('Género'),
                    buttonStyleData: const ButtonStyleData(
                      height: 60,
                      padding: EdgeInsets.only(left: 20, right: 10),
                    ),
                    dropdownStyleData: DropdownStyleData(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          UIKitDimens.medium,
                        ),
                      ),
                    ),
                    onChanged: (value) {},
                    items: genderItems
                        .map(
                          (item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(item),
                          ),
                        )
                        .toList(),
                  ),
                  const SizedBox(
                    height: UIKitDimens.medium,
                  ),
                  DropdownButtonFormField2(
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.zero,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(UIKitDimens.medium),
                      ),
                      prefixIcon: Icon(Icons.flag),
                    ),
                    isExpanded: true,
                    hint: Text('Nacionalidad'),
                    buttonStyleData: ButtonStyleData(
                      height: 60,
                      padding: EdgeInsets.only(left: 20, right: 10),
                    ),
                    onChanged: (value) {},
                    items: nationalityItems
                        .map(
                          (item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(item),
                          ),
                        )
                        .toList(),
                  ),
                  const SizedBox(
                    height: UIKitDimens.medium,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Ciudad de trabajo',
                      labelText: 'Ciudad de trabajo',
                      prefixIcon: Icon(Icons.person_2),
                      isDense: true,
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromRGBO(208, 213, 221, 1),
                          width: 1,
                        ),
                      ),
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
                await goToSignupPhoneValidation();
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

  goToSignupPhoneValidation() async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SignupSummaryPage(),
      ),
    );
  }
}
