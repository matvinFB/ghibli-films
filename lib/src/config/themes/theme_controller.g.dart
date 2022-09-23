// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ThemeController on _ThemeControllerBase, Store {
  late final _$isDarkThemeActiveAtom =
      Atom(name: '_ThemeControllerBase.isDarkThemeActive', context: context);

  @override
  bool get isDarkThemeActive {
    _$isDarkThemeActiveAtom.reportRead();
    return super.isDarkThemeActive;
  }

  @override
  set isDarkThemeActive(bool value) {
    _$isDarkThemeActiveAtom.reportWrite(value, super.isDarkThemeActive, () {
      super.isDarkThemeActive = value;
    });
  }

  late final _$_ThemeControllerBaseActionController =
      ActionController(name: '_ThemeControllerBase', context: context);

  @override
  void switchTheme() {
    final _$actionInfo = _$_ThemeControllerBaseActionController.startAction(
        name: '_ThemeControllerBase.switchTheme');
    try {
      return super.switchTheme();
    } finally {
      _$_ThemeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isDarkThemeActive: ${isDarkThemeActive}
    ''';
  }
}
