import 'package:flutter/material.dart';
import 'package:learning_project/src/config/themes/dark_theme.dart';
import 'package:mobx/mobx.dart';

import 'light_theme.dart';
part 'theme_controller.g.dart';

class ThemeController = _ThemeControllerBase with _$ThemeController;

abstract class _ThemeControllerBase with Store {
  @observable
  bool isDarkThemeActive = false;

  @action
  void switchTheme() {
    isDarkThemeActive = !isDarkThemeActive;
  }

  ThemeData get lightTheme => $lightTheme;

  ThemeData get darkTheme => $darkTheme;

  ThemeData get currentTheme => isDarkThemeActive?darkTheme:lightTheme;
}
