import 'package:flutter/cupertino.dart';
import 'package:m_two/core/data_manager.dart';
import 'package:m_two/core/models/user_model.dart';
import 'package:mobx/mobx.dart';

part 'introduction_mobx.g.dart';

class IntroductionMobx extends _IntroductionMobx with _$IntroductionMobx {}

abstract class _IntroductionMobx with Store {
  @observable
  bool signinSegment = true;
  bool touchEnabled = true;

  @action
  void switchToLogin() {
    touchEnabled = false;
    signinSegment = true;
  }

  @action
  void switchToSignUp() {
    touchEnabled = false;
    signinSegment = false;
  }

  @action
  void fetchFirstAccount(
    TextEditingController userNameController,
    TextEditingController passwordController,
  ) {
    readUsers().then((users) {
      if (users.isNotEmpty) {
        //sure this wasn't the right way but the observer did not trigger when accounts were loaded
        UserModel initialAccount = extractUsers(users).values.first;
        userNameController.text = initialAccount.username;
        passwordController.text = initialAccount.password;
      }
    });
  }

  @action
  void end() {
    touchEnabled = true;
  }
}
