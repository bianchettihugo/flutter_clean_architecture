import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/modules/location/presentation/pages/location_page.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xff191919),
      body: LocationPage(),
    );
  }
}
