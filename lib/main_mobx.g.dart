// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_mobx.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MainMobx on _MainMobx, Store {
  late final _$darkModeAtom =
      Atom(name: '_MainMobx.darkMode', context: context);

  @override
  bool get darkMode {
    _$darkModeAtom.reportRead();
    return super.darkMode;
  }

  @override
  set darkMode(bool value) {
    _$darkModeAtom.reportWrite(value, super.darkMode, () {
      super.darkMode = value;
    });
  }

  late final _$_MainMobxActionController =
      ActionController(name: '_MainMobx', context: context);

  @override
  void updateBrightness(bool isDarkMode) {
    final _$actionInfo = _$_MainMobxActionController.startAction(
        name: '_MainMobx.updateBrightness');
    try {
      return super.updateBrightness(isDarkMode);
    } finally {
      _$_MainMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
darkMode: ${darkMode}
    ''';
  }
}
