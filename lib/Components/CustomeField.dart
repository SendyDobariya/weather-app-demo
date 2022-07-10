import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

Widget CustomeField(
    {ValueChanged<String?>? onchange,
    FormFieldValidator<String>? validator,
    TextCapitalization textcapitalization = TextCapitalization.none,
    required String labeltext,
    TextInputType keyboardtype = TextInputType.text,
    TextInputAction textinputaction = TextInputAction.done}) {
  return FormBuilderTextField(
    name: labeltext,
    textCapitalization: textcapitalization,
    decoration:
        InputDecoration(labelText: labeltext, border: OutlineInputBorder()),
    onChanged: onchange,
    validator: validator,
    keyboardType: keyboardtype,
    textInputAction: textinputaction,
  );
}
