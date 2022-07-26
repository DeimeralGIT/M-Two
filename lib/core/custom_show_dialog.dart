import 'package:flutter/material.dart';
import 'package:m_two/core/colors.dart';
import 'package:m_two/core/text_styles.dart';

void customShowDialog({
  required BuildContext context,
  required String content,
  required List<Widget> actions,
}) {
  showDialog(
    context: context,
    builder: (_) => AlertDialog(
      backgroundColor: Theme.of(context).colorScheme.alertDialoBGColor,
      content: Text(
        content,
        style: alertDialogTextStyle(context),
      ),
      actions: actions,
    ),
  );
}
