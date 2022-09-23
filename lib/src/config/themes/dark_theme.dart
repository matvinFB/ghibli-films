import 'package:flutter/material.dart';

final $darkTheme = ThemeData(
      primaryColor: Colors.amber,
      scaffoldBackgroundColor: Colors.amber.shade100,
      backgroundColor: Colors.amber,
      textTheme: TextTheme(
          titleLarge: TextStyle(
              color: Colors.amber.shade900,
              fontSize: 25,
              fontWeight: FontWeight.w700),
          titleMedium: const TextStyle(
              shadows: [Shadow(blurRadius: 5, offset: Offset(0, 2))],
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w200),
          bodySmall: const TextStyle(
              shadows: [Shadow(blurRadius: 3, offset: Offset(0, 1))],
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w200)),
      iconTheme: IconThemeData(
        color: Colors.amber.shade900,
      ),
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
