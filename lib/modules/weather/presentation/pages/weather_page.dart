import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/core/services/dependency/dependency_service.dart';
import 'package:flutter_clean_architecture/modules/location/presentation/pages/location_error_page.dart';
import 'package:flutter_clean_architecture/modules/location/presentation/pages/location_page.dart';
import 'package:flutter_clean_architecture/modules/weather/presentation/controllers/weather_controller.dart';
import 'package:flutter_clean_architecture/modules/weather/presentation/pages/weather_connection_error_page.dart';
import 'package:flutter_clean_architecture/modules/weather/presentation/pages/weather_error_page.dart';
import 'package:flutter_clean_architecture/modules/weather/presentation/pages/weather_info_page.dart';
import 'package:flutter_clean_architecture/modules/weather/presentation/widgets/weather_color.dart';
import 'package:flutter_clean_architecture/modules/weather/presentation/widgets/weather_loading.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  late WeatherController _controller;

  @override
  void initState() {
    _controller = Dependency.get<WeatherController>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          WeatherColor(controller: _controller),
          ValueListenableBuilder(
            valueListenable: _controller.status,
            builder: (context, status, child) {
              return ValueListenableBuilder(
                valueListenable: _controller.weather,
                builder: (context, weather, child) {
                  switch (status) {
                    case WeatherPageStatus.noNetwork:
                      return WeatherConnectionErrorPage(
                        onButtonPressed: _controller.fetchWeather,
                      );
                    case WeatherPageStatus.error:
                      return WeatherErrorPage(
                        onButtonPressed: _controller.fetchWeather,
                      );
                    case WeatherPageStatus.permissionDenied:
                      return LocationPage(
                        onButtonPressed: _controller.fetchWeather,
                      );
                    case WeatherPageStatus.permissionError:
                      return LocationErrorPage(
                        onButtonPressed: _controller.fetchWeather,
                      );
                    case WeatherPageStatus.loading:
                      return const WeatherLoading();
                    default:
                      return WeatherInfoPage(
                        controller: _controller,
                      );
                  }
                },
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
