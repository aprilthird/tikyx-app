import 'package:app/layouts/default.dart';
import 'package:app/pages/signup/signup_phone_input.dart';
import 'package:app/pages/signup/signup_pick_role.dart';
import 'package:core/utils/message.dart';
import 'package:data/repositories/auth.dart';
import 'package:data/repositories/seller.dart';
import 'package:domain/models/session.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:uikit/components/buttons/grey_elevated_button.dart';
import 'package:uikit/components/buttons/primary_elevated_button.dart';
import 'package:uikit/components/loaders/primary_button_loader.dart';
import 'package:uikit/dimens/dimens.dart';
import 'package:uikit/fonts/sizes.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:uikit/helpers/toasts.dart';

class LoginOtpPage extends StatefulWidget {
  const LoginOtpPage({
    super.key,
    required this.countryCode,
    required this.phoneNumber,
  });

  final String countryCode;
  final String phoneNumber;

  @override
  State<LoginOtpPage> createState() => _LoginOtpPageState();
}

class _LoginOtpPageState extends State<LoginOtpPage> {
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  String codeOTP = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
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
                const Text(
                    'Te enviamos un SMS con el código de verificación de 6 dígitos al número:'),
                const SizedBox(
                  height: UIKitDimens.medium,
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      PinCodeTextField(
                        appContext: context,
                        length: 6,
                        // animationType: AnimationType.fade,
                        pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          fieldHeight: 60,
                          fieldWidth: 50,
                          disabledColor: Colors.white,
                          activeFillColor: Colors.white,
                          inactiveColor: Colors.white,
                          activeColor: Colors.white,
                          inactiveFillColor: Colors.white,
                          selectedColor: Theme.of(context).primaryColor,
                          selectedFillColor: Colors.white,
                          borderRadius:
                              BorderRadius.circular(UIKitDimens.medium),
                        ),
                        keyboardType: TextInputType.number,
                        enableActiveFill: true,
                        cursorColor: Theme.of(context).primaryColor,
                        autoFocus: true,
                        boxShadows: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.25),
                            spreadRadius: 5,
                            blurRadius: 10,
                            offset: const Offset(0, 3),
                          ),
                        ],
                        onCompleted: (value) {},
                        onChanged: (value) {},
                        validator: (value) {
                          if (value!.isEmpty) {
                            return MessageUtils.requiredError("Código OTP");
                          } else {
                            codeOTP = value;
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: UIKitDimens.medium,
                      ),
                      RichText(
                        text: TextSpan(
                          text: 'Reenviar código',
                          style: const TextStyle(
                            decoration: TextDecoration.underline,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () async {
                              await AuthRepository.signUp(
                                      "${widget.countryCode}${widget.phoneNumber}")
                                  .then((value) {})
                                  .onError((error, stackTrace) async {
                                await ToastHelpers.showError("Error: $error");
                              });
                            },
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
                      await AuthRepository.verifyOTP(
                              "${widget.countryCode}${widget.phoneNumber}",
                              codeOTP)
                          .then((session) async {
                        await SellerRepository.getBySignedUserId(
                                session.user.id)
                            .then((seller) async {
                          if (seller == null) {
                            await goToSignupPickRole(session);
                          } else {
                            if (seller.verified == null) {
                              await ToastHelpers.showWarning(
                                  "Alerta: Tu cuenta no ha sido aún verificada.");
                              goBack();
                            } else if (!seller.verified!) {
                              await ToastHelpers.showWarning(
                                  "Alerta: Tu cuenta no ha sido aún verificada.");
                              goBack();
                            } else {
                              await goToMainLayout();
                            }
                          }
                        }).onError((error, stackTrace) async {
                          await ToastHelpers.showError("Error: $error");
                        });
                      }).onError((error, stackTrace) async {
                        await ToastHelpers.showError("Error: $error");
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
                            Text('Validando'),
                          ],
                        )
                      : const Text('Verificar Código'),
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
      ),
    );
  }

  goBack() {
    Navigator.pop(context);
  }

  goToSignupPickRole(Session session) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SignupPickRolePage(
          phoneNumber: widget.phoneNumber,
          session: session,
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
}
