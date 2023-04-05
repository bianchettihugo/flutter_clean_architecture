import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/core/constants/files.dart';
import 'package:flutter_clean_architecture/core/styles/typography.dart';
import 'package:flutter_clean_architecture/core/utils/application.dart';
import 'package:flutter_clean_architecture/modules/weather/presentation/controllers/weather_controller.dart';
import 'package:flutter_clean_architecture/modules/weather/presentation/widgets/weather_card.dart';
import 'package:flutter_clean_architecture/modules/weather/presentation/widgets/weather_icon.dart';

class WeatherInfoPage extends StatelessWidget {
  final WeatherController controller;

  const WeatherInfoPage({required this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => controller.fetchWeather(),
      triggerMode: RefreshIndicatorTriggerMode.anywhere,
      color: Theme.of(context).primaryColor,
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (controller.weather.value.offlineData)
                  Tooltip(
                    message: Application.strings.offline,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.black.withOpacity(0.15),
                    ),
                    textStyle: Theme.of(context).textTheme.bodyMedium,
                    margin: const EdgeInsets.only(top: 30, right: 70, left: 70),
                    textAlign: TextAlign.center,
                    triggerMode: TooltipTriggerMode.tap,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.black.withOpacity(0.15),
                      ),
                      margin: const EdgeInsets.only(top: 50),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      child: StyledText.titleMedium('Offline'),
                    ),
                  ),
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
                        title: Application.strings.wind,
                        content: controller.weather.value.windSpeed.toString(),
                      ),
                      WeatherCard(
                        iconPath: Files.drops,
                        title: Application.strings.humidity,
                        content: controller.weather.value.humidity.toString(),
                      ),
                      WeatherCard(
                        iconPath: Files.cloud,
                        title: Application.strings.rain,
                        content: controller.weather.value.rain.toString(),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
