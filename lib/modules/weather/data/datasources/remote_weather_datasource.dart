import 'package:flutter_clean_architecture/modules/weather/data/models/weather_model.dart';

abstract class RemoteWeatherDatasource {
  Future<WeatherModel> fetchWeather({
    required String latitude,
    required String longitude,
  });
}
