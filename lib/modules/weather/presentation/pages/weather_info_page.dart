import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/core/constants/files.dart';
import 'package:flutter_clean_architecture/modules/weather/presentation/controllers/weather_controller.dart';
import 'package:flutter_clean_architecture/modules/weather/presentation/widgets/weather_card.dart';
import 'package:flutter_clean_architecture/modules/weather/presentation/widgets/weather_icon.dart';

class WeatherInfoPage extends StatelessWidget {
  final WeatherController controller;

  const WeatherInfoPage({required this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(),
          WeatherIcon(
            controller: controller,
            temperature:
                controller.weather.value.temperature.round().toString(),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Wrap(
              spacing: 15,
              children: [
                WeatherCard(
                  iconPath: Files.wind,
                  title: 'Vento',
                  content: controller.weather.value.windSpeed.toString(),
                ),
                WeatherCard(
                  iconPath: Files.drops,
                  title: 'Umidade',
                  content: controller.weather.value.humidity.toString(),
                ),
                WeatherCard(
                  iconPath: Files.cloud,
                  title: 'Chuva',
                  content: controller.weather.value.rain.toString(),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
