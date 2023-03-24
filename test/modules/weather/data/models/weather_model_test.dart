import 'package:flutter_clean_architecture/modules/weather/data/models/weather_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../utils/data.dart';
import '../../../../utils/fixture_reader.dart';

void main() {
  test('should check weather model equality', () async {
    const weather1 = WeatherModel(
      temperature: 10,
      windSpeed: 10,
      humidity: 10,
      rain: 10,
    );

    const weather2 = WeatherModel(
      temperature: 10,
      windSpeed: 10,
      humidity: 10,
      rain: 10,
    );

    expect(weather1.stringify, true);
    expect(weather2.stringify, true);
    expect(weather1, weather2);
    expect(weather1.hashCode == weather2.hashCode, true);
  });

  test('should covert weather model to JSON', () async {
    const weather1 = WeatherModel(
      temperature: 10,
      windSpeed: 10,
      humidity: 10,
      rain: 11,
    );

    expect(
      weather1.toJson(),
      '{"temperature":10.0,"windSpeed":10.0,"humidity":10.0,"rain":11.0}',
    );
  });

  test('should covert weather model from JSON', () async {
    final weather1 = WeatherModel(
      temperature: 15.9,
      windSpeed: 15.5,
      humidity: humidity[DateTime.now().hour],
      rain: rain[DateTime.now().hour],
    );

    expect(
      WeatherModel.fromJson(fixture('weather.json')),
      weather1,
    );
  });

  test('should covert weather model from JSON even with missing values',
      () async {
    const weather1 = WeatherModel(
      temperature: 0,
      windSpeed: 0,
      humidity: 0,
      rain: 0,
    );

    expect(
      WeatherModel.fromJson('{}'),
      weather1,
    );
  });
}
