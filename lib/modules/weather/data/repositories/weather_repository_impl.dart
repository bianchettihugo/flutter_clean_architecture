import 'package:flutter_clean_architecture/modules/weather/domain/entities/weather_entity.dart';
import 'package:flutter_clean_architecture/core/utils/result.dart';
import 'package:flutter_clean_architecture/modules/weather/domain/repositories/weather_repository.dart';

class WeatherRepositoryImpl extends WeatherRepository {
  @override
  Future<Result<WeatherEntity>> fetchWeather() {
    // TODO: implement fetchWeather
    throw UnimplementedError();
  }
}
