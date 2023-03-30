import 'package:flutter_clean_architecture/core/constants/files.dart';

abstract class FetchWeatherIconUsecase {
  String call({required int weatherCode});
}

class FetchWeatherIconUsecaseImpl extends FetchWeatherIconUsecase {
  FetchWeatherIconUsecaseImpl();

  final _colors = {
    0: Files.sun,
    1: Files.cloudy,
    2: Files.cloudy,
    3: Files.cloudy,
    45: Files.cloudy,
    48: Files.cloudy,
    51: Files.rain,
    53: Files.rain,
    55: Files.rain,
    56: Files.rain,
    57: Files.rain,
    61: Files.storm,
    63: Files.storm,
    65: Files.storm,
    66: Files.storm,
    67: Files.storm,
    71: Files.snow,
    73: Files.snow,
    75: Files.snow,
    77: Files.snow,
    80: Files.rain,
    81: Files.rain,
    82: Files.rain,
    85: Files.snow,
    86: Files.snow,
    95: Files.storm,
    96: Files.storm,
    99: Files.storm,
  };

  @override
  String call({required int weatherCode}) {
    return _colors[weatherCode] ?? Files.cloudy;
  }
}
