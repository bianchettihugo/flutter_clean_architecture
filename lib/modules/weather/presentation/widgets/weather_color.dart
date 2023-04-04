import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/modules/weather/presentation/controllers/weather_controller.dart';

class WeatherColor extends StatelessWidget {
  final WeatherController controller;

  const WeatherColor({required this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: controller.color,
      builder: (context, color, child) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 600),
          color: color,
        );
      },
    );
  }
}
