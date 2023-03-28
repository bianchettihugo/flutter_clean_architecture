import 'package:flutter/material.dart';

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
          //Text('Enable Geolocation')
        ],
      ),
    );
  }
}
