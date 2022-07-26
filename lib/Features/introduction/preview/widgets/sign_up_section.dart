// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:m_two/core/models/user_model.dart';
import 'package:m_two/core/reusable_widgets/custom_text_form_field.dart';

class SignUpSection extends StatelessWidget {
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  GlobalKey<FormState> signUpFormKey;
  UserModel userModel;
  SignUpSection({
    Key? key,
    required this.signUpFormKey,
    required this.userModel,
  }) : super(key: const ValueKey("sign_up"));
  @override
  Widget build(BuildContext context) {
    return Form(
      onChanged: () {
        userModel.username = userNameController.text;
        userModel.email = emailController.text;
        userModel.password = passwordController.text;
      },
      key: signUpFormKey,
      child: Column(
        children: [
          CustomTextFormField(
            label: "Username",
            controller: userNameController,
          ),
          CustomTextFormField(
            label: "Email",
            controller: emailController,
            validate: (value) {
              if (value == null || value.isEmpty) {
                return "Cannot be Empty";
              } else if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)) {
                return "Invalid Email";
              }
              return null;
            },
          ),
          CustomTextFormField(
            label: "Password",
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
      ),
    );
  }
}
