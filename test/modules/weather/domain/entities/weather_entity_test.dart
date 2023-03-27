import 'package:flutter_clean_architecture/modules/weather/domain/entities/weather_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('should check weather entity equality', () async {
    final weather1 = WeatherEntity(
      temperature: 10,
      windSpeed: 10,
      humidity: 10,
      rain: 10,
      offlineData: false,
    );

    final weather2 = WeatherEntity(
      temperature: 10,
      windSpeed: 10,
      humidity: 10,
      rain: 10,
      offlineData: false,
    );

    expect(weather1, weather2);
    expect(weather1.hashCode == weather2.hashCode, true);
  });

  test('should create a copy of the entity', () async {
    final weather1 = WeatherEntity(
      temperature: 10,
      windSpeed: 10,
      humidity: 10,
      rain: 10,
      offlineData: false,
    );

    final weather2 = WeatherEntity(
      temperature: 10,
      windSpeed: 10,
      humidity: 10,
      rain: 20,
      offlineData: false,
    );

    expect(weather1.copyWith(), weather1);
    expect(weather1.copyWith(rain: 20), weather2);
  });
}
