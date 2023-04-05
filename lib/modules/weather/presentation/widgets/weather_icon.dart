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
              children: [
                Opacity(
                  opacity: 0.4,
                  child: Image.asset(icon, width: 164),
                ),
                Transform.translate(
                  offset: const Offset(-12, -30),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        StyledText.bodyLarge(temperature),
                        StyledText.displaySmall('°C'),
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
