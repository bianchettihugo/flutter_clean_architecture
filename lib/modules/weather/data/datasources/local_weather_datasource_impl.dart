import 'package:flutter_clean_architecture/core/constants/keys.dart';
import 'package:flutter_clean_architecture/core/services/storage/storage_service.dart';
import 'package:flutter_clean_architecture/modules/weather/data/datasources/local_weather_datasource.dart';
import 'package:flutter_clean_architecture/modules/weather/data/models/weather_model.dart';

class LocalWeatherDatasourceImpl extends LocalWeatherDatasource {
  final StorageService _storageService;

  LocalWeatherDatasourceImpl({required StorageService storageService})
      : _storageService = storageService;

  @override
  Future<void> delete() async {
    await _storageService.delete(Keys.weather);
    await _storageService.delete(Keys.rain);
    await _storageService.delete(Keys.humidity);
    await _storageService.delete(Keys.windSpeed);
  }

  @override
  Future<WeatherModel?> fetchLast() async {
    final weather = await _storageService.read(Keys.weather);
    final rain = await _storageService.read(Keys.rain);
    final humidity = await _storageService.read(Keys.humidity);
    final windSpeed = await _storageService.read(Keys.windSpeed);
    final weatherCode = await _storageService.read(Keys.code);

    if (weather == null ||
        rain == null ||
        humidity == null ||
        windSpeed == null ||
        weatherCode == null) {
      return null;
    }

    return WeatherModel(
      temperature: double.parse(weather),
      windSpeed: double.parse(windSpeed),
      humidity: double.parse(humidity),
      rain: double.parse(rain),
      weatherCode: int.parse(weatherCode),
    );
  }

  @override
  Future<void> save(WeatherModel weather) async {
    await _storageService.save(Keys.weather, weather.temperature.toString());
    await _storageService.save(Keys.rain, weather.rain.toString());
    await _storageService.save(Keys.humidity, weather.humidity.toString());
    await _storageService.save(Keys.windSpeed, weather.windSpeed.toString());
    await _storageService.save(Keys.code, weather.weatherCode.toString());
  }
}
