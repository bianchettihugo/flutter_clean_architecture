import 'dart:io';

import 'package:flutter_clean_architecture/core/utils/failure.dart';
import 'package:flutter_clean_architecture/modules/weather/data/datasources/local_weather_datasource.dart';
import 'package:flutter_clean_architecture/modules/weather/data/datasources/remote_weather_datasource.dart';
import 'package:flutter_clean_architecture/modules/weather/data/mappers/weather_mapper.dart';
import 'package:flutter_clean_architecture/modules/weather/domain/entities/weather_entity.dart';
import 'package:flutter_clean_architecture/core/utils/result.dart';
import 'package:flutter_clean_architecture/modules/weather/domain/repositories/weather_repository.dart';

class WeatherRepositoryImpl extends WeatherRepository {
  final LocalWeatherDatasource _localDatasource;
  final RemoteWeatherDatasource _remoteDatasource;

  WeatherRepositoryImpl({
    required LocalWeatherDatasource localDatasource,
    required RemoteWeatherDatasource remoteDatasource,
  })  : _localDatasource = localDatasource,
        _remoteDatasource = remoteDatasource;

  @override
  Future<Result<WeatherEntity>> fetchWeather({
    required String latitude,
    required String longitude,
  }) async {
    try {
      final weather = await _remoteDatasource.fetchWeather(
        latitude: latitude,
        longitude: longitude,
      );

      final result = WeatherMapper.toEntity(weather);
      await _localDatasource.save(weather);
      return Result.success(result);
    } on SocketException catch (_) {
      final offlineWeather = await _localDatasource.fetchLast();
      if (offlineWeather != null) {
        return Result.success(WeatherMapper.toEntity(offlineWeather).copyWith(
          offlineData: true,
        ));
      } else {
        return Result.failure(Failure('Weather error', statusCode: 0));
      }
    } catch (_) {
      return Result.failure(Failure('Weather error', statusCode: -1));
    }
  }
}
