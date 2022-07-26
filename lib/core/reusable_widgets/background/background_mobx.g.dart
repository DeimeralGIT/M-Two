// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'background_mobx.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BackgroundMobx on _BackgroundMobx, Store {
  late final _$turnsAtom =
      Atom(name: '_BackgroundMobx.turns', context: context);

  @override
  double get turns {
    _$turnsAtom.reportRead();
    return super.turns;
  }

  @override
  set turns(double value) {
    _$turnsAtom.reportWrite(value, super.turns, () {
      super.turns = value;
    });
  }

  late final _$touchEnabledAtom =
      Atom(name: '_BackgroundMobx.touchEnabled', context: context);

  @override
  bool get touchEnabled {
    _$touchEnabledAtom.reportRead();
    return super.touchEnabled;
  }

  @override
  set touchEnabled(bool value) {
    _$touchEnabledAtom.reportWrite(value, super.touchEnabled, () {
      super.touchEnabled = value;
    });
  }

  late final _$_BackgroundMobxActionController =
      ActionController(name: '_BackgroundMobx', context: context);

  @override
  void animate() {
    final _$actionInfo = _$_BackgroundMobxActionController.startAction(
        name: '_BackgroundMobx.animate');
    try {
      return super.animate();
    } finally {
      _$_BackgroundMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  void end() {
    final _$actionInfo = _$_BackgroundMobxActionController.startAction(
        name: '_BackgroundMobx.end');
    try {
      return super.end();
    } finally {
      _$_BackgroundMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
turns: ${turns},
touchEnabled: ${touchEnabled}
    ''';
  }
}
