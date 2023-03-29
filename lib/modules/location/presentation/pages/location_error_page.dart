import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/core/utils/application.dart';
import 'package:flutter_clean_architecture/core/widgets/errors/error_widget.dart';

class LocationErrorPage extends StatelessWidget {
  final VoidCallback onButtonPressed;

  const LocationErrorPage({required this.onButtonPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return WeatherErroWidget(
      title: Application.strings.geolocationError,
      text: Application.strings.geolocationErrorMsg,
      buttonText: Application.strings.geolocationErrorBtn,
      type: ErrorWidgetType.error,
      onButtonPressed: onButtonPressed,
    );
  }
}
