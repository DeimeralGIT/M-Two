// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recover_password_mobx.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RecoverPasswordMobx on _RecoverPasswordMobx, Store {
  late final _$emailSentAtom =
      Atom(name: '_RecoverPasswordMobx.emailSent', context: context);

  @override
  bool get emailSent {
    _$emailSentAtom.reportRead();
    return super.emailSent;
  }

  @override
  set emailSent(bool value) {
    _$emailSentAtom.reportWrite(value, super.emailSent, () {
      super.emailSent = value;
    });
  }

  late final _$_RecoverPasswordMobxActionController =
      ActionController(name: '_RecoverPasswordMobx', context: context);

  @override
  void sendEmail() {
    final _$actionInfo = _$_RecoverPasswordMobxActionController.startAction(
        name: '_RecoverPasswordMobx.sendEmail');
    try {
      return super.sendEmail();
    } finally {
      _$_RecoverPasswordMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
emailSent: ${emailSent}
    ''';
  }
}
