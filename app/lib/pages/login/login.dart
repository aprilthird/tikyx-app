import 'package:app/layouts/default.dart';
import 'package:app/pages/login/login_otp.dart';
import 'package:app/pages/signup/signup_phone_input.dart';
import 'package:core/utils/environment.dart';
import 'package:data/repositories/auth.dart';
import 'package:domain/models/session.dart';
import 'package:flutter/material.dart';
import 'package:uikit/components/buttons/grey_elevated_button.dart';
import 'package:uikit/components/buttons/primary_elevated_button.dart';
import 'package:uikit/components/inputs/custom_text_form_field.dart';
import 'package:uikit/components/loaders/primary_button_loader.dart';
import 'package:uikit/dimens/dimens.dart';
import 'package:uikit/fonts/sizes.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:uikit/helpers/toasts.dart';
import 'package:core/utils/message.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  bool isLogin = false;
  String phoneNumber = "";
  String countryCode = "+54";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(UIKitDimens.medium),
          child: Column(
            children: [
              const Image(
                image: AssetImage('assets/images/icon_marketplace.png'),
              ),
              const SizedBox(
                height: UIKitDimens.medium,
              ),
              const SizedBox(
                width: 150,
                child: Image(
                  image: AssetImage('assets/images/logo_alt_primary.png'),
                ),
              ),
              const SizedBox(
                height: UIKitDimens.extraLarge,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Bienvenido!',
                  style: TextStyle(
                    fontSize: UIKitFontSize.doubleExtraLarge,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: UIKitDimens.medium,
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
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
                      validator: (value) {
                        if (EnvironmentUtils.isDevelopment) {
                          return null;
                        }
                        if (value!.isEmpty) {
                          return MessageUtils.requiredError("Teléfono");
                        } else {
                          phoneNumber = value;
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
              PrimaryElevatedButton(
                onPressed: () {
                  setState(() {
                    isLogin = true;
                  });
                  if (_formKey.currentState!.validate()) {
                    final authCallback = EnvironmentUtils.isDevelopment
                        ? AuthRepository.signInDevelopment("")
                        : AuthRepository.signIn("$countryCode$phoneNumber");
                    authCallback.then((value) async {
                      if (value is Session) {
                        await ToastHelpers.showSuccess("Sesión iniciada.");
                        goToMainLayout();
                      } else {
                        goToLoginOtp();
                      }
                    }).onError((error, stackTrace) async {
                      setState(() {
                        isLogin = false;
                      });
                      await ToastHelpers.showError("Error al iniciar sesión.");
                    });
                  }
                },
                isFullWidth: true,
                child: isLogin
                    ? const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          PrimaryButtonLoader(),
                          SizedBox(
                            width: UIKitDimens.small,
                          ),
                          Text('Entrando'),
                        ],
                      )
                    : const Text('Entrar'),
              ),
              const SizedBox(
                height: UIKitDimens.medium,
              ),
              GreyElevatedButton(
                onPressed: () {
                  goToSingupPhoneInput();
                },
                isFullWidth: true,
                child: const Text('Crear cuenta'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  goToMainLayout() async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const DefaultLayout(),
      ),
    );
  }

  goToSingupPhoneInput() async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SignupPhoneInputPage(),
      ),
    );
  }

  goToLoginOtp() async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LoginOtpPage(
          countryCode: countryCode,
          phoneNumber: phoneNumber,
        ),
      ),
    );
  }
}
