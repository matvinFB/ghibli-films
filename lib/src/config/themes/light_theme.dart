import 'package:flutter/material.dart';

final $lightTheme = ThemeData(
  primaryColor: Colors.amber,
  scaffoldBackgroundColor: Colors.amber.shade100,
  backgroundColor: Colors.amber,
  cardColor: Colors.amber.shade900,
  textTheme: TextTheme(
      titleLarge: TextStyle(
          color: Colors.amber.shade900,
          fontSize: 25,
          fontWeight: FontWeight.w700),
      titleMedium: const TextStyle(
          shadows: [Shadow(blurRadius: 5, offset: Offset(0, 2))],
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w500),
      bodySmall: const TextStyle(
          shadows: [Shadow(blurRadius: 4, offset: Offset(0, 1))],
          color: Colors.white,
          fontSize: 15,
          fontWeight: FontWeight.w500),
      labelSmall: TextStyle(
          color: Colors.amber.shade900,
          fontSize: 16,
          fontWeight: FontWeight.w500,
          shadows: [
            Shadow(
                color: Colors.amber.shade900.withOpacity(0.5),
                blurRadius: 2,
                offset: const Offset(0, 1))
          ])),
  iconTheme: IconThemeData(
    color: Colors.amber.shade900,
  ),
  textSelectionTheme: TextSelectionThemeData(
      cursorColor: Colors.amber.shade700,
      selectionColor: Colors.amber.shade300,
      selectionHandleColor: Colors.amber.shade900),
  inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.amber.shade100,
      focusColor: Colors.amber.shade900,
      iconColor: Colors.amber.shade900,
      enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.amber.shade600, width: 3)),
      focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.amber.shade900)),
      errorStyle: const TextStyle(shadows: [])),
  appBarTheme: AppBarTheme(
      color: Colors.amber.shade100,
      iconTheme: IconThemeData(
        color: Colors.amber.shade900,
      )),
  pageTransitionsTheme: const PageTransitionsTheme(builders: {
    TargetPlatform.android: CupertinoPageTransitionsBuilder(),
    TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
  }),
);
