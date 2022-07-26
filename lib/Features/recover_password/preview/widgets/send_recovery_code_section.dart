// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:m_two/Features/recover_password/manager/recover_password_mobx.dart';
import 'package:m_two/core/button_styles.dart';
import 'package:m_two/core/custom_show_dialog.dart';
import 'package:m_two/core/data_manager.dart';
import 'package:m_two/core/reusable_widgets/custom_text_form_field.dart';

class SendRecoveryCodeSection extends StatelessWidget {
  RecoverPasswordMobx manager;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  SendRecoveryCodeSection({
    required this.manager,
  }) : super(key: const ValueKey(1));

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Form(
            key: formKey,
            child: Column(
              children: [
                CustomTextFormField(
                  label: "Username",
                  controller: usernameController,
                ),
                CustomTextFormField(
                  label: "Email",
                ),
              ],
            )),
        ElevatedButton(
          onPressed: () {
            if (formKey.currentState!.validate()) {
              readUsers().then(
                (value) {
                  if (!value.containsKey(usernameController.text)) {
                    customShowDialog(
                      context: context,
                      content: "Username not Found",
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          style: textButtonStyle,
                          child: const Text("OK"),
                        ),
                      ],
                    );
                  } else {
                    manager.currentUser.username = usernameController.text;
                    manager.sendEmail();
                  }
                },
              );
            }
          },
          style: elevatedButtonStyle,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [Text("Send Code")],
          ),
        ),
      ],
    );
  }
}
