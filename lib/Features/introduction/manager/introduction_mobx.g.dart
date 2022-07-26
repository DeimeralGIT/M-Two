// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'introduction_mobx.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$IntroductionMobx on _IntroductionMobx, Store {
  late final _$signinSegmentAtom =
      Atom(name: '_IntroductionMobx.signinSegment', context: context);

  @override
  bool get signinSegment {
    _$signinSegmentAtom.reportRead();
    return super.signinSegment;
  }

  @override
  set signinSegment(bool value) {
    _$signinSegmentAtom.reportWrite(value, super.signinSegment, () {
      super.signinSegment = value;
    });
  }

  late final _$_IntroductionMobxActionController =
      ActionController(name: '_IntroductionMobx', context: context);

  @override
  void switchToLogin() {
    final _$actionInfo = _$_IntroductionMobxActionController.startAction(
        name: '_IntroductionMobx.switchToLogin');
    try {
      return super.switchToLogin();
    } finally {
      _$_IntroductionMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  void switchToSignUp() {
    final _$actionInfo = _$_IntroductionMobxActionController.startAction(
        name: '_IntroductionMobx.switchToSignUp');
    try {
      return super.switchToSignUp();
    } finally {
      _$_IntroductionMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  void end() {
    final _$actionInfo = _$_IntroductionMobxActionController.startAction(
        name: '_IntroductionMobx.end');
    try {
      return super.end();
    } finally {
      _$_IntroductionMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
signinSegment: ${signinSegment}
    ''';
  }
}
