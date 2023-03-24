import 'package:flutter_clean_architecture/core/utils/result.dart';
import 'package:flutter_clean_architecture/modules/weather/domain/entities/weather_entity.dart';

abstract class WeatherRepository {
  Future<Result<WeatherEntity>> fetchWeather();
}
