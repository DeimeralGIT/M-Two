import 'package:flutter/material.dart';
import 'package:m_two/Features/recover_password/preview/recover_password_page.dart';
import 'package:m_two/core/button_styles.dart';

class RecoverPasswordSection extends StatelessWidget {
  const RecoverPasswordSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => RecoverPasswordPage()),
        );
      },
      style: textButtonStyle(context),
      child: const Text(
        "Forgot Password?",
      ),
    );
  }
}
