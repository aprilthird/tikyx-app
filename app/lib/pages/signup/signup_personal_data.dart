import 'package:app/layouts/default.dart';
import 'package:app/pages/signup/signup_phone_validation.dart';
import 'package:app/pages/signup/signup_pick_referral.dart';
import 'package:app/pages/signup/signup_summary.dart';
import 'package:core/utils/message.dart';
import 'package:core/utils/seller.dart';
import 'package:domain/models/nationality.dart';
import 'package:domain/models/gender.dart';
import 'package:domain/models/pup.dart';
import 'package:domain/models/seller.dart';
import 'package:data/repositories/nationality.dart';
import 'package:data/repositories/gender.dart';
import 'package:domain/models/session.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:uikit/components/buttons/grey_elevated_button.dart';
import 'package:uikit/components/buttons/primary_elevated_button.dart';
import 'package:uikit/components/inputs/custom_text_form_field.dart';
import 'package:uikit/components/inputs/custom_dropdown_form_field.dart';
import 'package:uikit/components/loaders/primary_button_loader.dart';
import 'package:uikit/dimens/dimens.dart';
import 'package:uikit/fonts/sizes.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:uikit/helpers/toasts.dart';

class SignupPersonalDataPage extends StatefulWidget {
  const SignupPersonalDataPage({
    super.key,
    required this.session,
    required this.seller,
  });

  final Session session;
  final Seller seller;

  @override
  State<SignupPersonalDataPage> createState() => _SignupPersonalDataPageState();
}

class _SignupPersonalDataPageState extends State<SignupPersonalDataPage> {
  final _formKey = GlobalKey<FormState>();
  Future<List<Nationality>>? _futureNationalities;
  Future<List<Gender>>? _futureGenders;
  bool isLoading = false;

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
    if (_futureNationalities == null || _futureGenders == null) {
      return const CircularProgressIndicator();
    }
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
                    return MessageUtils.requiredError("Nombres y Apellidos");
                  }
                  widget.seller.name = value;
                  return null;
                },
              ),
              const SizedBox(
                height: UIKitDimens.medium,
              ),
              CustomDropdownFormField(
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
              const SizedBox(
                height: UIKitDimens.medium,
              ),
              CustomDropdownFormField(
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
              const SizedBox(
                height: UIKitDimens.medium,
              ),
              CustomTextFormField(
                hideText: false,
                hintText: 'Ciudad de trabajo',
                labelText: 'Ciudad de trabajo',
                prefixIcon: const Icon(Icons.work),
                validator: (value) {
                  if (value!.isEmpty) {
                    return MessageUtils.requiredError("Ciudad de trabajo");
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
                child: Center(
                  child: buildForm(),
                ),
              ),
              PrimaryElevatedButton(
                onPressed: () async {
                  setState(() {
                    isLoading = true;
                  });
                  if (_formKey.currentState!.validate()) {
                    if (widget.seller.type == SellerUtils.typeOwner) {
                      await goToSignupSummary();
                    } else {
                      await goToPickReferral();
                    }
                  }
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

  goToSignupSummary() async {
    final pup = Pup(
      address: "",
      latitude: 0,
      longitude: 0,
      createdAt: "",
    );
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SignupSummaryPage(
          session: widget.session,
          seller: widget.seller,
          pup: pup,
        ),
      ),
    );
  }

  goToPickReferral() async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SignupPickReferralPage(
          session: widget.session,
          seller: widget.seller,
        ),
      ),
    );
  }
}
