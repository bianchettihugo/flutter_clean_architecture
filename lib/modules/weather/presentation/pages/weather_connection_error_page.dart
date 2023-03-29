import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/core/utils/application.dart';
import 'package:flutter_clean_architecture/core/widgets/errors/error_widget.dart';

class WeatherConnectionErrorPage extends StatelessWidget {
  final VoidCallback onButtonPressed;

  const WeatherConnectionErrorPage({required this.onButtonPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return WeatherErroWidget(
      title: Application.strings.networkError,
      text: Application.strings.networkErrorMsg,
      buttonText: Application.strings.networkErrorBtn,
      type: ErrorWidgetType.network,
      onButtonPressed: onButtonPressed,
    );
  }
}
