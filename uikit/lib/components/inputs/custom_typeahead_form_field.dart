import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:uikit/dimens/dimens.dart';

class CustomTypeAheadFormField<T> extends StatelessWidget {
  const CustomTypeAheadFormField({
    Key? key,
    this.hintText,
    this.labelText,
    this.minCharsForSuggestions,
    this.filled,
    this.fillColor,
    this.prefixIcon,
    this.suffixIcon,
    this.controller,
    required this.suggestionsCallback,
    required this.itemBuilder,
    this.noItemsFoundBuilder,
    required this.onSuggestionSelected,
    this.onSuggestionsBoxToggle,
  }) : super(key: key);

  final String? hintText;
  final String? labelText;
  final int? minCharsForSuggestions;
  final bool? filled;
  final Color? fillColor;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Future<Iterable<T>> Function(String) suggestionsCallback;
  final Widget Function(BuildContext, T?) itemBuilder;
  final Widget Function(BuildContext)? noItemsFoundBuilder;
  final void Function(T?) onSuggestionSelected;
  final void Function(bool)? onSuggestionsBoxToggle;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TypeAheadField<T>(
      textFieldConfiguration: TextFieldConfiguration(
        controller: controller,
        autofocus: true,
        style: DefaultTextStyle.of(context)
            .style
            .copyWith(fontStyle: FontStyle.italic),
        decoration: InputDecoration(
          isDense: true,
          filled: filled,
          fillColor: fillColor,
          hintText: hintText,
          labelText: labelText,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(UIKitDimens.small),
            borderSide: const BorderSide(
              color: Color.fromRGBO(208, 213, 221, 1),
              width: 1,
            ),
          ),
        ),
      ),
      minCharsForSuggestions: minCharsForSuggestions ?? 1,
      onSuggestionsBoxToggle: onSuggestionsBoxToggle,
      getImmediateSuggestions: false,
      suggestionsCallback: suggestionsCallback,
      itemBuilder: itemBuilder,
      onSuggestionSelected: onSuggestionSelected,
      noItemsFoundBuilder: noItemsFoundBuilder,
    );
  }
}
