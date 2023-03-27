import 'package:flutter_clean_architecture/core/utils/failure.dart';
import 'package:flutter_clean_architecture/core/utils/result.dart';
import 'package:flutter_clean_architecture/modules/weather/domain/entities/weather_entity.dart';
import 'package:flutter_clean_architecture/modules/weather/domain/repositories/weather_repository.dart';

abstract class FetchWeatherUsecase {
  Future<Result<WeatherEntity>> call({
    required double latitude,
    required double longitude,
  });
}

class FetchWeatherUsecaseImpl extends FetchWeatherUsecase {
  final WeatherRepository _repository;

  FetchWeatherUsecaseImpl({required WeatherRepository repository})
      : _repository = repository;

  @override
  Future<Result<WeatherEntity>> call({
    required double latitude,
    required double longitude,
  }) async {
    if (latitude.abs() > 90 || longitude.abs() > 180) {
      return Result.failure(Failure('Invalid params'));
    }

    return await _repository.fetchWeather(
      latitude: latitude.toString(),
      longitude: longitude.toString(),
    );
  }
}
