import 'package:flutter/material.dart';
import 'package:learning_project/src/config/themes/theme_controller.dart';
import 'package:learning_project/src/login/login_view.dart';

class MyApp extends StatelessWidget {
  final _themeManager = ThemeController();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ghibliS',
      theme: _themeManager.lightTheme,
      darkTheme: _themeManager.darkTheme,
      themeMode:
          _themeManager.isDarkThemeActive ? ThemeMode.dark : ThemeMode.light,
      debugShowCheckedModeBanner: false,
      home: const LoginView(),
    );
  }
}
