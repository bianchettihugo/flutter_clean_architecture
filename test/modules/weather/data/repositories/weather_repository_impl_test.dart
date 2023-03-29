import 'dart:io';

import 'package:flutter_clean_architecture/core/utils/failure.dart';
import 'package:flutter_clean_architecture/core/utils/result.dart';
import 'package:flutter_clean_architecture/modules/weather/data/datasources/local_weather_datasource.dart';
import 'package:flutter_clean_architecture/modules/weather/data/datasources/remote_weather_datasource.dart';
import 'package:flutter_clean_architecture/modules/weather/data/repositories/weather_repository_impl.dart';
import 'package:flutter_clean_architecture/modules/weather/domain/repositories/weather_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../utils/data.dart';
import '../../../../utils/mocks.dart';

void main() {
  late LocalWeatherDatasource localDatasource;
  late RemoteWeatherDatasource remoteDatasource;
  late WeatherRepository weatherRepository;

  setUpAll(() {
    localDatasource = MockLocalWeatherDatasource();
    remoteDatasource = MockRemoteWeatherDatasource();
    weatherRepository = WeatherRepositoryImpl(
      localDatasource: localDatasource,
      remoteDatasource: remoteDatasource,
    );
  });

  test('should return a WeatherEntity', () async {
    when(() => remoteDatasource.fetchWeather(latitude: '10', longitude: '10'))
        .thenAnswer(
      (invocation) async => weatherModel,
    );
    when(() => localDatasource.save(weatherModel)).thenAnswer(
      (invocation) async => true,
    );

    final result = await weatherRepository.fetchWeather(
      latitude: '10',
      longitude: '10',
    );

    expect(result, Result.success(weatherEntity));
    verify(() => remoteDatasource.fetchWeather(latitude: '10', longitude: '10'))
        .called(1);
    verify(() => localDatasource.save(weatherModel)).called(1);
  });

  test('should return a WeatherEntity with offline data when available',
      () async {
    when(() => remoteDatasource.fetchWeather(latitude: '10', longitude: '10'))
        .thenThrow(const SocketException(''));
    when(() => localDatasource.fetchLast()).thenAnswer(
      (invocation) async => weatherModel,
    );

    final result = await weatherRepository.fetchWeather(
      latitude: '10',
      longitude: '10',
    );

    expect(result, Result.success(weatherEntity.copyWith(offlineData: true)));
    verify(() => remoteDatasource.fetchWeather(latitude: '10', longitude: '10'))
        .called(1);
    verify(() => localDatasource.fetchLast()).called(1);
    verifyNever(() => localDatasource.save(weatherModel));
  });

  test('should return a Failure with offline data is not available', () async {
    when(() => remoteDatasource.fetchWeather(latitude: '10', longitude: '10'))
        .thenThrow(const SocketException(''));
    when(() => localDatasource.fetchLast()).thenAnswer(
      (invocation) async => null,
    );

    final result = await weatherRepository.fetchWeather(
      latitude: '10',
      longitude: '10',
    );

    expect(result, Result.failure(Failure('Weather error', statusCode: 0)));
    verify(() => remoteDatasource.fetchWeather(latitude: '10', longitude: '10'))
        .called(1);
    verify(() => localDatasource.fetchLast()).called(1);
    verifyNever(() => localDatasource.save(weatherModel));
  });

  test('should return a Failure when any other exception occurs', () async {
    when(() => remoteDatasource.fetchWeather(latitude: '10', longitude: '10'))
        .thenThrow(const ProcessException('', []));
    when(() => localDatasource.fetchLast()).thenAnswer(
      (invocation) async => null,
    );

    final result = await weatherRepository.fetchWeather(
      latitude: '10',
      longitude: '10',
    );

    expect(result, Result.failure(Failure('Weather error', statusCode: -1)));
    verify(() => remoteDatasource.fetchWeather(latitude: '10', longitude: '10'))
        .called(1);
    verifyNever(() => localDatasource.fetchLast());
    verifyNever(() => localDatasource.save(weatherModel));
  });

  test('should return a Failure when a flutter error occurs', () async {
    when(() => remoteDatasource.fetchWeather(latitude: '10', longitude: '10'))
        .thenThrow('error');
    when(() => localDatasource.fetchLast()).thenAnswer(
      (invocation) async => null,
    );

    final result = await weatherRepository.fetchWeather(
      latitude: '10',
      longitude: '10',
    );

    expect(result, Result.failure(Failure('Weather error', statusCode: -1)));
    verify(() => remoteDatasource.fetchWeather(latitude: '10', longitude: '10'))
        .called(1);
    verifyNever(() => localDatasource.fetchLast());
    verifyNever(() => localDatasource.save(weatherModel));
  });
}
