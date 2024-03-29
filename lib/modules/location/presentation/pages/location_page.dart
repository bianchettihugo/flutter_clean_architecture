import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/core/utils/application.dart';
import 'package:flutter_clean_architecture/core/widgets/errors/error_widget.dart';

class LocationPage extends StatelessWidget {
  final VoidCallback onButtonPressed;

  const LocationPage({required this.onButtonPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return WeatherErroWidget(
      title: Application.strings.enableGeolocation,
      text: Application.strings.enableGeolocationMsg,
      buttonText: Application.strings.enableGeolocationBtn,
      type: ErrorWidgetType.location,
      onButtonPressed: onButtonPressed,
    );
  }
}
