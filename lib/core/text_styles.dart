import 'package:flutter/material.dart';
import 'package:m_two/core/colors.dart';

TextStyle textFormFieldLabelStyle(BuildContext context) {
  return TextStyle(
    color: Theme.of(context).colorScheme.textFormFieldLabelColor,
  );
}

TextStyle textFormFieldTextStyle(BuildContext context) {
  return TextStyle(
    color: Theme.of(context).colorScheme.textFormFieldTextColor,
  );
}

TextStyle segmentTextStyle(BuildContext context) {
  return TextStyle(
    color: Theme.of(context).colorScheme.segmentTextColor,
  );
}

TextStyle alertDialogTextStyle(BuildContext context) {
  return TextStyle(
    color: Theme.of(context).colorScheme.alertDialogTextColor,
  );
}
