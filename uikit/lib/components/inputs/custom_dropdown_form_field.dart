import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:uikit/dimens/dimens.dart';

class CustomDropdownFormField<T> extends StatelessWidget {
  const CustomDropdownFormField({
    Key? key,
    this.validator,
    this.onChanged,
    this.hint,
    this.prefixIcon,
    this.suffixIcon,
    this.items,
  }) : super(key: key);

  final Widget? hint;
  final String? Function(T?)? validator;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final List<DropdownMenuItem<T>>? items;
  final void Function(T?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField2<T>(
      decoration: InputDecoration(
        isDense: true,
        contentPadding: EdgeInsets.zero,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(UIKitDimens.small),
        ),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ),
      isExpanded: true,
      hint: hint,
      buttonStyleData: ButtonStyleData(
          height: 55,
          padding: EdgeInsets.zero,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(UIKitDimens.small),
          )),
      onChanged: onChanged,
      items: items,
      validator: validator,
    );
  }
}
