import 'package:app/layouts/default.dart';
import 'package:app/pages/signup/signup_phone_validation.dart';
import 'package:app/pages/signup/signup_summary.dart';
import 'package:domain/models/nationality.dart';
import 'package:domain/models/gender.dart';
import 'package:data/repositories/nationality.dart';
import 'package:data/repositories/gender.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:uikit/components/buttons/grey_elevated_button.dart';
import 'package:uikit/components/buttons/primary_elevated_button.dart';
import 'package:uikit/components/inputs/custom_text_form_field.dart';
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
  final _formKey = GlobalKey<FormState>();
  Future<List<Nationality>>? _futureNationalities;
  Future<List<Gender>>? _futureGenders;
  String name = "";
  String nationalityId = "";
  String genderId = "";
  String workCity = "";

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
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getAllNationalities();
      getAllGenders();
    });
  }

  getAllNationalities() async {
    setState(() {
      _futureNationalities = NationalityRepository.getAll();
    });
  }

  getAllGenders() async {
    setState(() {
      _futureGenders = GenderRepository.getAll();
    });
  }

  Widget buildForm() {
    return FutureBuilder(
      future: Future.wait([_futureNationalities!, _futureGenders!]),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final nationalities = snapshot.data![0] as List<Nationality>;
          final genders = snapshot.data![1] as List<Gender>;
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextFormField(
                hideText: false,
                hintText: 'Nombres y Apellidos',
                labelText: 'Nombres y Apellidos',
                prefixIcon: const Icon(Icons.info_outline),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "El campo es obligatorio";
                  }
                  setState(() {});
                  return null;
                },
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
                items: genders
                    .map(
                      (item) => DropdownMenuItem<String>(
                        value: item.id,
                        child: Text(item.name),
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
                  prefixIcon: const Icon(Icons.flag),
                ),
                isExpanded: true,
                hint: const Text('Nacionalidad'),
                buttonStyleData: const ButtonStyleData(
                  height: 60,
                  padding: EdgeInsets.only(left: 20, right: 10),
                ),
                onChanged: (value) {},
                items: nationalities
                    .map(
                      (item) => DropdownMenuItem<String>(
                        value: item.id,
                        child: Text(item.name),
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
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Padding(
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
              const Text(
                  'Estos datos son privados para mejorar tu experiencia.'),
              Expanded(
                flex: 1,
                child: buildForm(),
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
