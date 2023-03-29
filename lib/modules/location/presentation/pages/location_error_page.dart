import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/core/constants/files.dart';
import 'package:flutter_clean_architecture/core/styles/typography.dart';
import 'package:flutter_clean_architecture/core/utils/application.dart';
import 'package:flutter_clean_architecture/core/widgets/button/button.dart';

class LocationErrorPage extends StatelessWidget {
  final VoidCallback onButtonPressed;

  const LocationErrorPage({required this.onButtonPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            Files.weatherError,
            width: 164,
          ),
          const SizedBox(height: 30),
          StyledText.titleLarge(Application.strings.geolocationError),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 80),
            child: StyledText.bodyLarge(
              Application.strings.geolocationErrorMsg,
              align: TextAlign.center,
            ),
          ),
          const SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Button(
              text: Application.strings.geolocationErrorBtn,
              onTap: onButtonPressed,
            ),
          ),
        ],
      ),
    );
  }
}
