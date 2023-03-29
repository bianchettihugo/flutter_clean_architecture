import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/modules/location/domain/usecases/fetch_location_usecase.dart';
import 'package:flutter_clean_architecture/modules/weather/domain/entities/weather_entity.dart';
import 'package:flutter_clean_architecture/modules/weather/domain/usecases/fetch_weather_usecase.dart';

enum WeatherPageStatus {
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
  final FetchWeatherUsecase _fetchWeatherUsecase;

  final status = ValueNotifier<WeatherPageStatus>(WeatherPageStatus.loading);
  final weather = ValueNotifier<WeatherEntity>(WeatherEntity.empty());

  WeatherController({
    required FetchLocationUsecase fetchLocationUsecase,
    required FetchWeatherUsecase fetchWeatherUsecase,
  })  : _fetchLocation = fetchLocationUsecase,
        _fetchWeatherUsecase = fetchWeatherUsecase;

  Future<void> fetchWeather() async {
    status.value = WeatherPageStatus.loading;

    final userLocation = await _fetchLocation();
    userLocation.when(
      success: (location) async {
        final currentWeather = await _fetchWeatherUsecase(
          latitude: location.latitude,
          longitude: location.longitude,
        );

        currentWeather.when(
          success: (result) {
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
}
