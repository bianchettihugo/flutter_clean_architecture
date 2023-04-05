import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/core/styles/typography.dart';
import 'package:flutter_clean_architecture/modules/weather/presentation/controllers/weather_controller.dart';

class WeatherIcon extends StatelessWidget {
  final WeatherController controller;
  final String temperature;

  const WeatherIcon({
    required this.controller,
    this.temperature = '0',
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: controller.icon,
      builder: (context, icon, child) {
        return Center(
          child: SizedBox(
            width: 200,
            height: 100,
            child: Stack(
              fit: StackFit.loose,
              alignment: Alignment.center,
              children: [
                Opacity(
                  opacity: 0.07,
                  child: Image.asset(icon, width: 124),
                ),
                Transform.translate(
                  offset: const Offset(-30, 10),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        StyledText.displayMedium(temperature),
                        const SizedBox(width: 5),
                        StyledText.bodyLarge('°C'),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
