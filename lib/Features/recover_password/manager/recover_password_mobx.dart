import 'package:m_two/core/models/user_model.dart';
import 'package:mobx/mobx.dart';

part 'recover_password_mobx.g.dart';

class RecoverPasswordMobx extends _RecoverPasswordMobx with _$RecoverPasswordMobx {}

abstract class _RecoverPasswordMobx with Store {
  @observable
  bool emailSent = false;
  bool verified = false;
  UserModel currentUser = UserModel(username: "", password: "");
  //not sure if this is an optimal way to hold the user model for static access

  @action
  void sendEmail() {
    emailSent = true;
  }
}
