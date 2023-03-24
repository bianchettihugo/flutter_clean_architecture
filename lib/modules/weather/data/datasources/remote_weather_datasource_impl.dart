import 'package:flutter_clean_architecture/core/constants/api.dart';
import 'package:flutter_clean_architecture/core/services/http/http_service.dart';
import 'package:flutter_clean_architecture/modules/weather/data/datasources/remote_weather_datasource.dart';
import 'package:flutter_clean_architecture/modules/weather/data/models/weather_model.dart';

class RemoteWeatherDatasourceImpl extends RemoteWeatherDatasource {
  final HttpService _httpService;

  RemoteWeatherDatasourceImpl({required HttpService httpService})
      : _httpService = httpService;

  @override
  Future<WeatherModel> fetchWeather({
    required String latitude,
    required String longitude,
  }) async {
    final result = await _httpService.request(
      method: Method.get,
      url: Api.weather(latitude: latitude, longitude: longitude),
    );

    return WeatherModel.fromMap(result);
  }
}
