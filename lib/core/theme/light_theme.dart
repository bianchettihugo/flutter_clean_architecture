import 'package:flutter/material.dart';

class LightTheme {
  static get theme => ThemeData(
        primaryColor: const Color(0xff0177FB),
        backgroundColor: const Color(0xffF5F5F7),
        scaffoldBackgroundColor: const Color(0xffE8E8E8),
        cardColor: const Color(0xffFFFFFF),
        disabledColor: const Color(0xff8F90A6),
        unselectedWidgetColor: const Color(0xffDDDDDD),
        textTheme: const TextTheme().apply(
          bodyColor: const Color(0xff000000),
          displayColor: const Color(0xff000000),
        ),
        colorScheme: const ColorScheme.light(
          primary: Color(0xff0177FB),
          secondary: Color(0xff01FB83),
          surface: Color(0xffFFFFFF),
          background: Color(0xffF5F5F7),
          error: Color(0xffFF3B3B),
          onPrimary: Color(0xffFFFFFF),
          onSecondary: Color(0xffFFFFFF),
          onError: Color(0xffFFFFFF),
          onBackground: Color(0xff000000),
          onSurface: Color(0xff000000),
        ),
      );
}
