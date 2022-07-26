import 'package:flutter/material.dart';
import 'package:m_two/core/colors.dart';

ButtonStyle textButtonStyle(BuildContext context) {
  return ButtonStyle(
      overlayColor: MaterialStateProperty.all(Colors.transparent),
      foregroundColor: MaterialStateProperty.resolveWith((states) {
        return states.contains(MaterialState.pressed)
            ? Theme.of(context).colorScheme.textButtonTextColorPressed
            : Theme.of(context).colorScheme.textButtonTextColor;
      }));
}

ButtonStyle elevatedButtonStyle = ButtonStyle(
    shape: MaterialStateProperty.all(RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(50),
)));
