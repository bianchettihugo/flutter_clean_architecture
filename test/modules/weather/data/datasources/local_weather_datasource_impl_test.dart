import 'package:flutter_clean_architecture/core/constants/keys.dart';
import 'package:flutter_clean_architecture/core/services/storage/storage_service.dart';
import 'package:flutter_clean_architecture/modules/weather/data/datasources/local_weather_datasource.dart';
import 'package:flutter_clean_architecture/modules/weather/data/datasources/local_weather_datasource_impl.dart';
import 'package:flutter_clean_architecture/modules/weather/data/models/weather_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../utils/mocks.dart';

void main() {
  late StorageService storageService;
  late LocalWeatherDatasource datasource;

  setUpAll(() {
    storageService = MockStorageService();
    datasource = LocalWeatherDatasourceImpl(storageService: storageService);
  });

  test('should save, fetch and delete a WeatherModel', () async {
    bool deleted = false;
    const weather1 = WeatherModel(
      temperature: 0.0,
      windSpeed: 0.0,
      humidity: 0.0,
      rain: 0.0,
      weatherCode: 0,
    );

    when(() => storageService.save(Keys.weather, '0.0')).thenAnswer(
      (invocation) async => true,
    );
    when(() => storageService.save(Keys.rain, '0.0')).thenAnswer(
      (invocation) async => true,
    );
    when(() => storageService.save(Keys.humidity, '0.0')).thenAnswer(
      (invocation) async => true,
    );
    when(() => storageService.save(Keys.windSpeed, '0.0')).thenAnswer(
      (invocation) async => true,
    );
    when(() => storageService.save(Keys.code, '0')).thenAnswer(
      (invocation) async => true,
    );

    when(() => storageService.read(Keys.weather)).thenAnswer(
      (invocation) async => deleted ? null : '0.0',
    );
    when(() => storageService.read(Keys.rain)).thenAnswer(
      (invocation) async => deleted ? null : '0.0',
    );
    when(() => storageService.read(Keys.humidity)).thenAnswer(
      (invocation) async => deleted ? null : '0.0',
    );
    when(() => storageService.read(Keys.windSpeed)).thenAnswer(
      (invocation) async => deleted ? null : '0.0',
    );
    when(() => storageService.read(Keys.code)).thenAnswer(
      (invocation) async => deleted ? null : '0',
    );

    when(() => storageService.delete(Keys.weather)).thenAnswer(
      (invocation) async {
        deleted = true;
        return true;
      },
    );
    when(() => storageService.delete(Keys.rain)).thenAnswer(
      (invocation) async => true,
    );
    when(() => storageService.delete(Keys.humidity)).thenAnswer(
      (invocation) async => true,
    );
    when(() => storageService.delete(Keys.windSpeed)).thenAnswer(
      (invocation) async => true,
    );

    await datasource.save(weather1);
    final weather = await datasource.fetchLast();

    expect(weather, weather1);

    await datasource.delete();

    final weather2 = await datasource.fetchLast();

    expect(weather2, null);
  });
}
