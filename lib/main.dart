import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/core/styles/text_theme.dart';
import 'package:flutter_clean_architecture/modules/weather/presentation/pages/weather_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: const Color(0xff6D67D0),
        textTheme: customTextTheme.apply(
          bodyColor: const Color(0xffE7E6FB),
          displayColor: const Color(0xffE7E6FB),
        ),
      ),
      home: const WeatherPage(),
    );
  }
}
