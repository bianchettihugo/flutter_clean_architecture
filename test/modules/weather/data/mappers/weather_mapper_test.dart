import 'package:flutter_clean_architecture/modules/weather/data/mappers/weather_mapper.dart';
import 'package:flutter_clean_architecture/modules/weather/data/models/weather_model.dart';
import 'package:flutter_clean_architecture/modules/weather/domain/entities/weather_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('should convert a model to entity', () async {
    const weather1 = WeatherModel(
      temperature: 10,
      windSpeed: 10,
      humidity: 10,
      rain: 10,
    );

    expect(
        WeatherMapper.toEntity(weather1),
        WeatherEntity(
          temperature: 10,
          windSpeed: 10,
          humidity: 10,
          rain: 10,
        ));
  });

  test('should convert a entity to model', () async {
    final weather1 = WeatherEntity(
      temperature: 10,
      windSpeed: 10,
      humidity: 10,
      rain: 10,
    );

    expect(
        WeatherMapper.toModel(weather1),
        const WeatherModel(
          temperature: 10,
          windSpeed: 10,
          humidity: 10,
          rain: 10,
        ));
  });
}
