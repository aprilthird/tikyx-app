import 'package:app/pages/signup/signup_phone_validation.dart';
import 'package:core/utils/message.dart';
import 'package:data/repositories/auth.dart';
import 'package:flutter/material.dart';
import 'package:uikit/components/buttons/grey_elevated_button.dart';
import 'package:uikit/components/buttons/primary_elevated_button.dart';
import 'package:uikit/components/loaders/primary_button_loader.dart';
import 'package:uikit/components/inputs/custom_text_form_field.dart';
import 'package:uikit/dimens/dimens.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:uikit/helpers/toasts.dart';

class SignupPhoneInputPage extends StatefulWidget {
  const SignupPhoneInputPage({super.key});

  @override
  State<SignupPhoneInputPage> createState() => _SignupPhoneInputPageState();
}

class _SignupPhoneInputPageState extends State<SignupPhoneInputPage> {
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  String countryCode = "+54";
  String phoneNumber = "";

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
                'Registro No. celular',
                style: TextStyle(
                  fontSize: UIKitDimens.large,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: UIKitDimens.medium,
              ),
              const Text(
                  'Usaremos tu número telefónico para enviarte un toiken único (OTP) que no debes compartir.'),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Ingresa tu número telefónico',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: UIKitDimens.medium,
                    ),
                    CustomTextFormField(
                      hideText: false,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return MessageUtils.requiredError("Teléfono");
                        } else {
                          phoneNumber = value;
                        }
                        return null;
                      },
                      hintText: 'Teléfono',
                      labelText: 'Teléfono',
                      prefixIcon: CountryCodePicker(
                        onChanged: (code) {
                          if (code.dialCode != null) {
                            setState(() {
                              countryCode = code.dialCode!;
                            });
                          }
                        },
                        // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                        initialSelection: 'AR',
                        favorite: const ['+54', 'AR'],
                        // optional. Shows only country name and flag
                        showCountryOnly: false,
                        // optional. Shows only country name and flag when popup is closed.
                        showOnlyCountryWhenClosed: false,
                        // optional. aligns the flag and the Text left
                        alignLeft: false,
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
                  if (_formKey.currentState!.validate()) {
                    await AuthRepository.signIn("$countryCode$phoneNumber")
                        .then((value) async {
                      await goToSignupSummary();
                    }).onError((error, stackTrace) async {
                      await ToastHelpers.showError("Error:$error");
                    });
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
                          Text('Enviando'),
                        ],
                      )
                    : const Text('Obtener Código OTP'),
              ),
              const SizedBox(
                height: UIKitDimens.medium,
              ),
              GreyElevatedButton(
                onPressed: () {
                  goBack();
                },
                isFullWidth: true,
                child: const Text('Volver a empezar'),
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
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SignupPhoneValidationPage(
            countryCode: countryCode, phoneNumber: phoneNumber),
      ),
    );
  }
}
