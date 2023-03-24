import 'package:flutter_clean_architecture/modules/weather/data/models/weather_model.dart';

abstract class LocalWeatherDatasource {
  Future<void> save(WeatherModel weather);

  Future<void> delete();

  Future<WeatherModel?> fetchLast();
}
