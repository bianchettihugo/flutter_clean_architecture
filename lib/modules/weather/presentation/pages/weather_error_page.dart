import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/core/utils/application.dart';
import 'package:flutter_clean_architecture/core/widgets/errors/error_widget.dart';

class WeatherErrorPage extends StatelessWidget {
  final VoidCallback onButtonPressed;

  const WeatherErrorPage({required this.onButtonPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return WeatherErroWidget(
      title: Application.strings.weatherError,
      text: Application.strings.weatherErrorMsg,
      buttonText: Application.strings.weatherErrorBtn,
      type: ErrorWidgetType.error,
      onButtonPressed: onButtonPressed,
    );
  }
}
