// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:m_two/Features/introduction/manager/introduction_mobx.dart';
import 'package:m_two/Features/introduction/preview/widgets/login_signup_segment.dart';
import 'package:m_two/Features/introduction/preview/widgets/recover_password_section.dart';
import 'package:m_two/Features/introduction/preview/widgets/sign_in_section.dart';
import 'package:m_two/Features/introduction/preview/widgets/sign_up_section.dart';
import 'package:m_two/core/models/user_model.dart';
import 'package:m_two/core/reusable_widgets/background/background.dart';

class IntroductionPage extends StatelessWidget {
  final introductionMobx = IntroductionMobx();
  final GlobalKey<FormState> signInFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();

  TextEditingController siginInUserNameController = TextEditingController();
  TextEditingController signInPasswordController = TextEditingController();
  //two usermodels are going to be updated on every form input
  //once the form is validated, the usermodel will be submitted
  UserModel signInUserModel = UserModel(username: "", email: "", password: "");
  UserModel signUpUserModel = UserModel(username: "", email: "", password: "");

  IntroductionPage({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    //make sure to press on the logo icon
    introductionMobx.fetchFirstAccount(
      siginInUserNameController,
      signInPasswordController,
    );
    return Background(
      showIcon: true,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        resizeToAvoidBottomInset: false,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            const Spacer(),
            Observer(
              builder: (_) => AnimatedSize(
                duration: const Duration(milliseconds: 500),
                child: AnimatedSwitcher(
                  switchInCurve: Curves.easeInOut,
                  switchOutCurve: Curves.easeInOut,
                  duration: const Duration(milliseconds: 500),
                  child: introductionMobx.signinSegment
                      ? SignInSection(
                          signInFormKey: signInFormKey,
                          userModel: signInUserModel,
                          userNameController: siginInUserNameController,
                          passwordController: signInPasswordController,
                        )
                      : SignUpSection(
                          signUpFormKey: signUpFormKey,
                          userModel: signUpUserModel,
                        ),
                ),
              ),
            ),
            const Spacer(),
            LoginSignupSegment(
              manager: introductionMobx,
              signInFormKey: signInFormKey,
              signUpFormKey: signUpFormKey,
              signInUserModel: signInUserModel,
              signUpUserModel: signUpUserModel,
            ),
            const Spacer(),
            const RecoverPasswordSection(),
            const Spacer(
              flex: 3,
            ),
          ],
        ),
      ),
    );
  }
}
