import 'package:flutter/material.dart';

extension CustomColors on ColorScheme {
  Color get mainBGColor => brightness == Brightness.dark ? const Color.fromRGBO(30, 41, 59, 1) : const Color.fromRGBO(191, 219, 254, 1);
  Color get logoIconWidgetColor => const Color.fromRGBO(23, 207, 151, 1);
  Color get backGroundCardColor => brightness == Brightness.dark ? const Color.fromRGBO(24, 24, 24, 1) : const Color.fromRGBO(247, 247, 247, 1);
  Color get textFormFieldBorderColor => brightness == Brightness.dark ? const Color.fromRGBO(99, 113, 222, 1) : const Color.fromRGBO(129, 136, 193, 1);
  Color get textFormFieldBorderColorFocused => brightness == Brightness.dark ? const Color.fromRGBO(170, 156, 255, 1) : const Color.fromRGBO(189, 196, 253, 1);
  Color get textFormFieldTextColor => brightness == Brightness.dark ? Colors.white : const Color.fromRGBO(91, 94, 100, 1);
  Color get textFormFieldLabelColor => brightness == Brightness.dark ? Colors.white : const Color.fromRGBO(91, 94, 100, 1);
  Color get segmentBGColor => brightness == Brightness.dark ? const Color.fromRGBO(30, 41, 59, 1) : const Color.fromRGBO(191, 219, 254, 1);
  Color get segmentSelectedBGColor => const Color.fromRGBO(26, 92, 255, 1);
  Color get segmentTextColor => Colors.white;
  Color get textButtonTextColor => segmentSelectedBGColor;
  Color get textButtonTextColorPressed => const Color.fromRGBO(26, 92, 255, 0.5);
  Color get alertDialogTextColor => brightness == Brightness.dark ? const Color.fromRGBO(26, 92, 255, 1) : const Color.fromRGBO(30, 41, 59, 1);
  Color get alertDialoBGColor => brightness == Brightness.dark ? const Color.fromRGBO(30, 41, 59, 1) : const Color.fromRGBO(191, 219, 254, 1);
}
