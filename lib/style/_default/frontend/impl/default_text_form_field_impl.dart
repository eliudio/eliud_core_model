import 'package:eliud_core_model/model/app_model.dart';
import 'package:eliud_core_model/style/frontend/frontend_style.dart';
import 'package:eliud_core_model/style/frontend/has_text_form_field.dart';
import 'package:flutter/material.dart';

class DefaultTextFormFieldImpl implements HasTexFormField {
  final FrontEndStyle theFontEndStyle;

  DefaultTextFormFieldImpl(this.theFontEndStyle);

  @override
  Widget textFormField(
    AppModel app,
    BuildContext context, {
    required bool readOnly,
    String? initialValue,
    FormFieldValidator<String>? validator,
    TextInputType? keyboardType,
    IconData? icon,
    String? labelText,
    String? hintText,
    int? maxLines,
    ValueChanged<String>? onChanged,
    TextEditingController? textEditingController,
  }) {
    return TextFormField(
        readOnly: readOnly,
        onChanged: onChanged,
        controller: textEditingController,
        keyboardType: TextInputType.text,
        validator: validator,
        initialValue: initialValue);
  }

  @override
  Widget textField(
    AppModel app,
    BuildContext context, {
    required bool readOnly,
    String? initialValue,
    FormFieldValidator<String>? validator,
    TextInputType? keyboardType,
    IconData? icon,
    String? labelText,
    String? hintText,
    int? maxLines,
    ValueChanged<String>? onChanged,
    TextEditingController? textEditingController,
    TextAlign? textAlign,
    TextInputAction? textInputAction,
    ValueChanged<String>? onSubmitted,
    TextEditingController? controller,
  }) {
    return TextField(
      textAlign: TextAlign.left,
      textInputAction: TextInputAction.go,
      controller: controller,
      keyboardType: TextInputType.text,
    );
  }
}
