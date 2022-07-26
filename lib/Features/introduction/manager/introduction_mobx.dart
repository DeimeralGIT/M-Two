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
  void end() {
    touchEnabled = true;
  }
}
