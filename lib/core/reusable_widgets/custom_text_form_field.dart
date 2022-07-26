// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:m_two/core/colors.dart';
import 'package:m_two/core/numeric_params.dart';
import 'package:m_two/core/text_styles.dart';

class CustomTextFormField extends StatelessWidget {
  bool isObscure;
  String label;
  TextEditingController? controller;
  String? Function(String?)? validate;
  CustomTextFormField({
    Key? key,
    this.isObscure = false,
    required this.label,
    this.controller,
    this.validate,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        validator: validate ??
            (value) {
              if (value == null || value.isEmpty) {
                return "Cannot be Empty";
              }
              return null;
            },
        controller: controller,
        obscureText: isObscure,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(textFormFieldRadius),
            borderSide: BorderSide(color: textFormFieldBorderColor),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(textFormFieldRadius),
            borderSide: BorderSide(color: textFormFieldBorderColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(textFormFieldRadius),
            borderSide: BorderSide(color: textFormFieldBorderColorFocused, width: 2),
          ),
          label: Text(
            label,
            style: textFormFieldLabelStyle,
          ),
        ),
        style: textFormFieldTextStyle,
      ),
    );
  }
}
