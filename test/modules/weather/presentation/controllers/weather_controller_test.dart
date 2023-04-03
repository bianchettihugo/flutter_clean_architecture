import 'package:flutter_clean_architecture/core/utils/failure.dart';
import 'package:flutter_clean_architecture/core/utils/result.dart';
import 'package:flutter_clean_architecture/modules/location/domain/entities/location_entity.dart';
import 'package:flutter_clean_architecture/modules/location/domain/usecases/fetch_location_usecase.dart';
import 'package:flutter_clean_architecture/modules/weather/domain/entities/weather_entity.dart';
import 'package:flutter_clean_architecture/modules/weather/domain/usecases/fetch_weather_color_usecase.dart';
import 'package:flutter_clean_architecture/modules/weather/domain/usecases/fetch_weather_icon_usecase.dart';
import 'package:flutter_clean_architecture/modules/weather/domain/usecases/fetch_weather_usecase.dart';
import 'package:flutter_clean_architecture/modules/weather/presentation/controllers/weather_controller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:value_listenable_test/value_listenable_test.dart';

import '../../../../utils/data.dart';
import '../../../../utils/mocks.dart';

void main() {
  late FetchLocationUsecase fetchLocation;
  late FetchWeatherUsecase fetchWeather;
  late FetchWeatherColorUsecase fetchColor;
  late FetchWeatherIconUsecase fetchIcon;
  late WeatherController controller;

  setUp(() {
    fetchLocation = MockFetchLocationUsecase();
    fetchWeather = MockFetchWeatherUsecase();
    fetchColor = FetchWeatherColorUsecaseImpl();
    fetchIcon = FetchWeatherIconUsecaseImpl();
    controller = WeatherController(
      fetchLocationUsecase: fetchLocation,
      fetchWeatherUsecase: fetchWeather,
      fetchWeatherColorUsecase: fetchColor,
      fetchWeatherIconUsecase: fetchIcon,
    );
  });

  test('should emit [loading, permissionError] status', () async {
    when(fetchLocation).thenAnswer(
      (invocation) async =>
          Result<LocationEntity>.failure(Failure('', statusCode: -1)),
    );

    expect(
      controller.status,
      emitValues([
        WeatherPageStatus.loading,
        WeatherPageStatus.permissionError,
      ]),
    );

    await controller.fetchWeather();
  });

  test('should emit [loading, permissionDenied] status', () async {
    when(fetchLocation).thenAnswer(
      (invocation) async =>
          Result<LocationEntity>.failure(Failure('', statusCode: 0)),
    );

    expect(
      controller.status,
      emitValues([
        WeatherPageStatus.loading,
        WeatherPageStatus.permissionDenied,
      ]),
    );

    await controller.fetchWeather();
  });

  test('should emit [loading, noNetwork] status', () async {
    when(fetchLocation).thenAnswer(
      (invocation) async => Result<LocationEntity>.success(LocationEntity(
        latitude: 10,
        longitude: 10,
      )),
    );

    when(() => fetchWeather(latitude: 10, longitude: 10)).thenAnswer(
      (invocation) async =>
          Result<WeatherEntity>.failure(Failure('', statusCode: 0)),
    );

    expect(
      controller.status,
      emitValues([
        WeatherPageStatus.loading,
        WeatherPageStatus.noNetwork,
      ]),
    );

    await controller.fetchWeather();
  });

  test('should emit [loading, error] status', () async {
    when(fetchLocation).thenAnswer(
      (invocation) async => Result<LocationEntity>.success(LocationEntity(
        latitude: 10,
        longitude: 10,
      )),
    );

    when(() => fetchWeather(latitude: 10, longitude: 10)).thenAnswer(
      (invocation) async =>
          Result<WeatherEntity>.failure(Failure('', statusCode: -1)),
    );

    expect(
      controller.status,
      emitValues([
        WeatherPageStatus.loading,
        WeatherPageStatus.error,
      ]),
    );

    await controller.fetchWeather();
  });

  test('should emit [loading, offlineWeather] status', () async {
    when(fetchLocation).thenAnswer(
      (invocation) async => Result<LocationEntity>.success(LocationEntity(
        latitude: 10,
        longitude: 10,
      )),
    );

    when(() => fetchWeather(latitude: 10, longitude: 10)).thenAnswer(
      (invocation) async => Result<WeatherEntity>.success(
          weatherEntity.copyWith(offlineData: true)),
    );

    expect(
      controller.status,
      emitValues([
        WeatherPageStatus.loading,
        WeatherPageStatus.offlineWeather,
      ]),
    );

    await controller.fetchWeather();
  });

  test('should emit [loading, onlineWeather] status', () async {
    when(fetchLocation).thenAnswer(
      (invocation) async => Result<LocationEntity>.success(LocationEntity(
        latitude: 10,
        longitude: 10,
      )),
    );

    when(() => fetchWeather(latitude: 10, longitude: 10)).thenAnswer(
      (invocation) async => Result<WeatherEntity>.success(weatherEntity),
    );

    expect(
      controller.status,
      emitValues([
        WeatherPageStatus.loading,
        WeatherPageStatus.onlineWeather,
      ]),
    );

    await controller.fetchWeather();
  });

  test('should call dispose without errors', () async {
    controller.dispose();
  });
}
