import 'package:mobx/mobx.dart';

part 'background_mobx.g.dart';

class BackgroundMobx extends _BackgroundMobx with _$BackgroundMobx {}

abstract class _BackgroundMobx with Store {
  @observable
  double turns = 0;

  @observable
  bool touchEnabled = true; //ensure to enable touch only when there is no ongoing animation

  @action
  void animate() {
    turns == 0 ? turns += 3 : turns -= 3;
    touchEnabled = false;
  }

  @action
  void end() {
    touchEnabled = true;
  }
}
