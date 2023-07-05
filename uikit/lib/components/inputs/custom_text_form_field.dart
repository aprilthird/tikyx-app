import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uikit/dimens/dimens.dart';

// ignore: camel_case_extensions
extension StringValidator on String {
  bool get isValidEmail {
    final emailRegExp = RegExp(
        (r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"));

    return emailRegExp.hasMatch(this);
  }

  bool get isValidName {
    final nameRegExp = RegExp(r"^[a-z ,.\'-]+$");
    return nameRegExp.hasMatch(this);
  }

  bool get isValidPassword {
    final passwordRegExp = RegExp(
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~.]).{8,}$');
    return passwordRegExp.hasMatch(this);
  }

  bool isValidRepeatPassword(String password) {
    return this == password;
  }

  bool get isNotNull {
    // ignore: unnecessary_null_comparison
    return this != null;
  }
}

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key,
    this.initialValue,
    this.inputFormattters,
    this.validator,
    this.onChanged,
    this.labelText,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    required this.hideText,
  }) : super(key: key);

  final String? initialValue;
  final String? hintText;
  final String? labelText;
  final List<TextInputFormatter>? inputFormattters;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool hideText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: Column(
        children: [
          Container(
            height: 70,
            decoration: BoxDecoration(
              //color: Colors.grey[200],
              borderRadius: BorderRadius.circular(UIKitDimens.small),
            ),
            child: TextFormField(
              initialValue: initialValue,
              inputFormatters: inputFormattters,
              validator: validator,
              obscureText: hideText,
              onChanged: onChanged,
              decoration: InputDecoration(
                hintText: hintText,
                labelText: labelText,
                prefixIcon: prefixIcon,
                suffixIcon: suffixIcon,
                isDense: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(UIKitDimens.small),
                  borderSide: const BorderSide(
                    color: Color.fromRGBO(208, 213, 221, 1),
                    width: 1,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
