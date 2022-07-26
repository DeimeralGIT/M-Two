// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:m_two/Features/introduction/preview/introduction_page_page.dart';
import 'package:m_two/Features/recover_password/manager/recover_password_mobx.dart';
import 'package:m_two/core/button_styles.dart';
import 'package:m_two/core/custom_show_dialog.dart';
import 'package:m_two/core/data_manager.dart';
import 'package:m_two/core/reusable_widgets/custom_text_form_field.dart';

class VerifyRecoveryCodeSection extends StatelessWidget {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  RecoverPasswordMobx manager;
  VerifyRecoveryCodeSection({
    required this.manager,
  }) : super(key: const ValueKey(2));

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Form(
            key: formKey,
            child: Column(
              children: [
                CustomTextFormField(
                  label: "Verification Code",
                ),
                CustomTextFormField(
                  label: "New Password",
                  controller: passwordController,
                  isObscure: true,
                ),
                CustomTextFormField(
                  label: "Confirm Password",
                  controller: confirmPasswordController,
                  isObscure: true,
                  validate: (value) {
                    if (value == null || value.isEmpty) {
                      return "Cannot be Empty";
                    } else if (value != passwordController.text) {
                      return "Passwords do not match";
                    }
                    return null;
                  },
                ),
              ],
            )),
        ElevatedButton(
          onPressed: () {
            if (formKey.currentState!.validate()) {
              //removing old user info
              removeUser(manager.currentUser).then((pass) {
                manager.currentUser.password = passwordController.text;
                //adding updated user info
                addUser(manager.currentUser).then((pass) {
                  customShowDialog(context: context, content: "Password Updated Successfully", actions: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_) => IntroductionPage()), (route) => false),
                      style: textButtonStyle,
                      child: const Text("OK"),
                    ),
                  ]);
                });
              });
            }
          },
          style: elevatedButtonStyle,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [Text("Verify")],
          ),
        ),
      ],
    );
  }
}
