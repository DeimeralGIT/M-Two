import 'package:flutter/material.dart';
import 'package:m_two/core/colors.dart';

ButtonStyle textButtonStyle = ButtonStyle(
    overlayColor: MaterialStateProperty.all(Colors.transparent),
    foregroundColor: MaterialStateProperty.resolveWith((states) {
      return states.contains(MaterialState.pressed) ? textButtonTextColorPressed : textButtonTextColor;
    }));

ButtonStyle elevatedButtonStyle = ButtonStyle(
    shape: MaterialStateProperty.all(RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(50),
)));
