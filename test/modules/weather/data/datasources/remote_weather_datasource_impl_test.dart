import 'dart:convert';

import 'package:flutter_clean_architecture/core/constants/api.dart';
import 'package:flutter_clean_architecture/core/services/http/http_service.dart';
import 'package:flutter_clean_architecture/modules/weather/data/datasources/remote_weather_datasource.dart';
import 'package:flutter_clean_architecture/modules/weather/data/datasources/remote_weather_datasource_impl.dart';
import 'package:flutter_clean_architecture/modules/weather/data/models/weather_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../utils/data.dart';
import '../../../../utils/fixture_reader.dart';
import '../../../../utils/mocks.dart';

void main() {
  late HttpService httpService;
  late RemoteWeatherDatasource datasource;

  setUpAll(() {
    httpService = MockHttpService();
    datasource = RemoteWeatherDatasourceImpl(httpService: httpService);
  });

  test('should return the current weather based on latitude and longitude',
      () async {
    final js = fixture('weather.json');
    final map = json.decode(js);
    when(() => httpService.request(
        method: Method.get,
        url: Api.weather(latitude: '0', longitude: '0'))).thenAnswer(
      (invocation) async => map,
    );

    final weather = WeatherModel(
      temperature: 15.9,
      windSpeed: 15.5,
      humidity: humidity[DateTime.now().hour],
      rain: rain[DateTime.now().hour],
    );

    final result = await datasource.fetchWeather(latitude: '0', longitude: '0');
    expect(result, weather);
  });
}
