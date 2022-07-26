// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:m_two/Features/introduction/manager/introduction_mobx.dart';
import 'package:m_two/Features/introduction/preview/introduction_page_page.dart';
import 'package:m_two/core/button_styles.dart';
import 'package:m_two/core/colors.dart';
import 'package:m_two/core/custom_show_dialog.dart';
import 'package:m_two/core/data_manager.dart';
import 'package:m_two/core/models/user_model.dart';
import 'package:m_two/core/numeric_params.dart';
import 'package:m_two/core/text_styles.dart';

class LoginSignupSegment extends StatelessWidget {
  final IntroductionMobx manager;
  UserModel signInUserModel;
  UserModel signUpUserModel;
  GlobalKey segmentParentKey = GlobalKey();
  GlobalKey<FormState> signInFormKey;
  GlobalKey<FormState> signUpFormKey;
  LoginSignupSegment({
    Key? key,
    required this.manager,
    required this.signInFormKey,
    required this.signUpFormKey,
    required this.signInUserModel,
    required this.signUpUserModel,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: segmentHeight,
      child: Observer(
        builder: (_) => Stack(
          children: [
            Container(
              key: segmentParentKey,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(segmentRadius),
                color: Theme.of(context).colorScheme.segmentBGColor,
              ),
            ),
            AnimatedAlign(
              alignment: manager.signinSegment ? Alignment.centerLeft : Alignment.centerRight,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
              widthFactor: 2,
              onEnd: () => manager.end(),
              child: Container(
                width: MediaQuery.of(context).size.width / 2 - pageSidePadding,
                height: segmentHeight,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.segmentSelectedBGColor,
                  borderRadius: BorderRadius.circular(segmentRadius),
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    //if the selected segment is pressed - it will trigger a form validation and a signin/signup event
                    //inkwell used instead of gestureprovider to fill the expanded widget with tapArea
                    onTap: !manager.signinSegment ? () => manager.switchToLogin() : () => signIn(context),
                    overlayColor: MaterialStateProperty.all(Colors.transparent),
                    child: Center(
                      child: Text(
                        "Login",
                        style: segmentTextStyle(context),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    overlayColor: MaterialStateProperty.all(Colors.transparent),
                    onTap: manager.signinSegment ? () => manager.switchToSignUp() : () => signUp(context),
                    child: Center(
                      child: Text(
                        "Sign-up",
                        style: segmentTextStyle(context),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void signIn(BuildContext context) {
    if (signInFormKey.currentState!.validate()) {
      readUsers().then((users) {
        if ((checkByUserName(signInUserModel.username, users) || checkByEmail(signInUserModel.username, users))) {
          if (fetchUser(signInUserModel.username, users).password == signInUserModel.password) {
            customShowDialog(
              context: context,
              content: "Successfully Signed in",
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  style: textButtonStyle(context),
                  child: const Text("OK"),
                ),
              ],
            );
          } else {
            customShowDialog(
              context: context,
              content: "Incorrect Password",
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  style: textButtonStyle(context),
                  child: const Text("OK"),
                ),
              ],
            );
          }
        } else {
          customShowDialog(
            context: context,
            content: "User not Found",
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                style: textButtonStyle(context),
                child: const Text("OK"),
              ),
            ],
          );
        }
      });
    }
  }

  void signUp(BuildContext context) {
    if (signUpFormKey.currentState!.validate()) {
      readUsers().then((users) {
        if (checkByUserName(signUpUserModel.username, users)) {
          customShowDialog(
            context: context,
            content: "Account With This Username Already Exists",
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                style: textButtonStyle(context),
                child: const Text("OK"),
              ),
            ],
          );
        } else if (checkByEmail(signUpUserModel.email, users)) {
          customShowDialog(
            context: context,
            content: "Account With This Email Already Exists",
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                style: textButtonStyle(context),
                child: const Text("OK"),
              ),
            ],
          );
        } else {
          addUser(signUpUserModel).then(
            (pass) => customShowDialog(
              context: context,
              content: "Account Registered Successfully",
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_) => IntroductionPage()), (route) => false),
                  style: textButtonStyle(context),
                  child: const Text("OK"),
                ),
              ],
            ),
          );
        }
      });
    }
  }
}
