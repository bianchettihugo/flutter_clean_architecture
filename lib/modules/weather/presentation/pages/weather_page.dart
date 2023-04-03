import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/modules/weather/presentation/widgets/weather_loading.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff191919),
      body: WeatherLoading(),
    );
  }
}
