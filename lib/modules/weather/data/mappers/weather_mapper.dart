import 'package:flutter_clean_architecture/modules/weather/data/models/weather_model.dart';
import 'package:flutter_clean_architecture/modules/weather/domain/entities/weather_entity.dart';

class WeatherMapper {
  static WeatherModel toModel(WeatherEntity entity) {
    return WeatherModel(
      temperature: entity.temperature,
      windSpeed: entity.windSpeed,
      humidity: entity.humidity,
      rain: entity.rain,
      weatherCode: entity.weatherCode,
    );
  }

  static WeatherEntity toEntity(WeatherModel model) {
    return WeatherEntity(
      temperature: model.temperature,
      windSpeed: model.windSpeed,
      humidity: model.humidity,
      rain: model.rain,
      weatherCode: model.weatherCode,
    );
  }
}
