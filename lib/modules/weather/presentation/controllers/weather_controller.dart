import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/core/constants/files.dart';
import 'package:flutter_clean_architecture/modules/location/domain/usecases/fetch_location_usecase.dart';
import 'package:flutter_clean_architecture/modules/weather/domain/entities/weather_entity.dart';
import 'package:flutter_clean_architecture/modules/weather/domain/usecases/fetch_weather_color_usecase.dart';
import 'package:flutter_clean_architecture/modules/weather/domain/usecases/fetch_weather_icon_usecase.dart';
import 'package:flutter_clean_architecture/modules/weather/domain/usecases/fetch_weather_usecase.dart';

enum WeatherPageStatus {
  initial,
  loading,
  permissionDenied,
  permissionError,
  noNetwork,
  error,
  offlineWeather,
  onlineWeather,
}

class WeatherController {
  final FetchLocationUsecase _fetchLocation;
  final FetchWeatherUsecase _fetchWeather;
  final FetchWeatherColorUsecase _fetchWeatherColor;
  final FetchWeatherIconUsecase _fetchWeatherIcon;

  final status = ValueNotifier<WeatherPageStatus>(WeatherPageStatus.initial);
  final weather = ValueNotifier<WeatherEntity>(WeatherEntity.empty());
  final color = ValueNotifier<Color>(const Color(0xff191919));
  final icon = ValueNotifier<String>(Files.cloudy);

  WeatherController({
    required FetchLocationUsecase fetchLocationUsecase,
    required FetchWeatherUsecase fetchWeatherUsecase,
    required FetchWeatherColorUsecase fetchWeatherColorUsecase,
    required FetchWeatherIconUsecase fetchWeatherIconUsecase,
  })  : _fetchLocation = fetchLocationUsecase,
        _fetchWeather = fetchWeatherUsecase,
        _fetchWeatherColor = fetchWeatherColorUsecase,
        _fetchWeatherIcon = fetchWeatherIconUsecase;

  Future<void> fetchWeather() async {
    color.value = const Color(0xff191919);
    status.value = WeatherPageStatus.loading;

    final userLocation = await _fetchLocation();
    userLocation.when(
      success: (location) async {
        final currentWeather = await _fetchWeather(
          latitude: location.latitude,
          longitude: location.longitude,
        );

        currentWeather.when(
          success: (result) {
            color.value = _fetchWeatherColor(weatherCode: result.weatherCode);
            icon.value = _fetchWeatherIcon(weatherCode: result.weatherCode);
            weather.value = result;
            status.value = result.offlineData
                ? WeatherPageStatus.offlineWeather
                : WeatherPageStatus.onlineWeather;
          },
          failure: (error) {
            status.value = error.statusCode == 0
                ? WeatherPageStatus.noNetwork
                : WeatherPageStatus.error;
          },
        );
      },
      failure: (error) {
        status.value = error.statusCode == 0
            ? WeatherPageStatus.permissionDenied
            : WeatherPageStatus.permissionError;
      },
    );
  }

  void dispose() {
    status.dispose();
    weather.dispose();
    color.dispose();
    icon.dispose();
  }
}
