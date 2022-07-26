import 'package:mobx/mobx.dart';

part 'main_mobx.g.dart';

class MainMobx extends _MainMobx with _$MainMobx {}

abstract class _MainMobx with Store {
  @observable
  bool darkMode = false;
  // used only for updating brightness according to system and fetching accounts

  @action
  void updateBrightness(bool isDarkMode) {
    darkMode = isDarkMode;
  }
}
