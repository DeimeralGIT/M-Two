// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:m_two/core/models/user_model.dart';
import 'package:m_two/core/reusable_widgets/custom_text_form_field.dart';

class SignInSection extends StatelessWidget {
  GlobalKey<FormState> signInFormKey;
  UserModel userModel;
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  SignInSection({
    Key? key,
    required this.signInFormKey,
    required this.userModel,
  }) : super(key: const ValueKey("sign_in"));
  @override
  Widget build(BuildContext context) {
    return Form(
      onChanged: () {
        userModel.username = userNameController.text;
        userModel.password = passwordController.text;
      },
      key: signInFormKey,
      child: Column(
        children: [
          CustomTextFormField(
            label: "Username",
            controller: userNameController,
          ),
          CustomTextFormField(
            label: "Password",
            isObscure: true,
            controller: passwordController,
          ),
        ],
      ),
    );
  }
}
