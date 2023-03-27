import 'package:flutter_clean_architecture/core/utils/failure.dart';
import 'package:flutter_clean_architecture/core/utils/result.dart';
import 'package:flutter_clean_architecture/modules/weather/domain/repositories/weather_repository.dart';
import 'package:flutter_clean_architecture/modules/weather/domain/usecases/fetch_weather_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../utils/data.dart';
import '../../../../utils/mocks.dart';

void main() {
  late WeatherRepository weatherRepository;
  late FetchWeatherUsecase fetchWeather;

  setUpAll(() {
    weatherRepository = MockWeatherRepository();
    fetchWeather = FetchWeatherUsecaseImpl(repository: weatherRepository);
  });

  test('should return a Failure when latitude is invalid', () async {
    final result = await fetchWeather(latitude: -99, longitude: 10);

    expect(result, Result.failure(Failure('Invalid params')));
    verifyNever(
      () =>
          weatherRepository.fetchWeather(latitude: '-99.0', longitude: '10.0'),
    );
  });

  test('should return a Failure when longitude is invalid', () async {
    final result = await fetchWeather(latitude: 20, longitude: 195);

    expect(result, Result.failure(Failure('Invalid params')));
    verifyNever(
      () =>
          weatherRepository.fetchWeather(latitude: '20.0', longitude: '195.0'),
    );
  });

  test('should return a WeatherEntity', () async {
    when(() =>
            weatherRepository.fetchWeather(latitude: '20.0', longitude: '20.0'))
        .thenAnswer(
      (invocation) async => Result.success(weatherEntity),
    );
    final result = await fetchWeather(latitude: 20, longitude: 20);

    expect(result, Result.success(weatherEntity));
    verify(
      () => weatherRepository.fetchWeather(latitude: '20.0', longitude: '20.0'),
    ).called(1);
  });
}
