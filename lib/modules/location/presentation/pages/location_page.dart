import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/core/styles/typography.dart';
import 'package:flutter_clean_architecture/core/utils/application.dart';
import 'package:flutter_clean_architecture/core/widgets/button/button.dart';

class LocationPage extends StatelessWidget {
  const LocationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/weather_location.png',
            width: 164,
          ),
          const SizedBox(height: 30),
          StyledText.titleLarge(Application.strings.enableGeolocation),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 80),
            child: StyledText.bodyLarge(
              Application.strings.enableGeolocationMsg,
              align: TextAlign.center,
            ),
          ),
          const SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Button(
              text: Application.strings.enableGeolocationBtn,
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}
