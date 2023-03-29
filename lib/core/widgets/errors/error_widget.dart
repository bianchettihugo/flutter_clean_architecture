import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/core/constants/files.dart';
import 'package:flutter_clean_architecture/core/styles/typography.dart';
import 'package:flutter_clean_architecture/core/widgets/button/button.dart';

enum ErrorWidgetType {
  network,
  location,
  error,
}

class WeatherErroWidget extends StatelessWidget {
  final String title;
  final String text;
  final String buttonText;
  final ErrorWidgetType type;
  final VoidCallback onButtonPressed;

  const WeatherErroWidget({
    required this.onButtonPressed,
    super.key,
    required this.title,
    required this.text,
    required this.buttonText,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            type == ErrorWidgetType.location
                ? Files.weatherLocation
                : type == ErrorWidgetType.network
                    ? Files.weatherConnection
                    : Files.weatherError,
            width: 164,
          ),
          const SizedBox(height: 30),
          StyledText.titleLarge(title),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 80),
            child: StyledText.bodyLarge(
              text,
              align: TextAlign.center,
            ),
          ),
          const SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Button(
              text: buttonText,
              onTap: onButtonPressed,
            ),
          ),
        ],
      ),
    );
  }
}
