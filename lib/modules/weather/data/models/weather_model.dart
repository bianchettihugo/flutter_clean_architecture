import 'dart:convert';

import 'package:equatable/equatable.dart';

class WeatherModel extends Equatable {
  final double temperature;
  final double windSpeed;
  final double humidity;
  final double rain;

  const WeatherModel({
    required this.temperature,
    required this.windSpeed,
    required this.humidity,
    required this.rain,
  });

  @override
  List<Object?> get props => [
        temperature,
        windSpeed,
        humidity,
        rain,
      ];

  @override
  bool? get stringify => true;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'temperature': temperature,
      'windSpeed': windSpeed,
      'humidity': humidity,
      'rain': rain,
    };
  }

  factory WeatherModel.fromMap(Map<String, dynamic> map) {
    final index = DateTime.now().hour;
    return WeatherModel(
      temperature: double.parse(
          map['current_weather']?['temperature']?.toString() ?? '0'),
      windSpeed:
          double.parse(map['current_weather']?['windspeed']?.toString() ?? '0'),
      humidity: double.parse(
          map['hourly']?['relativehumidity_2m']?[index]?.toString() ?? '0'),
      rain: double.parse(
          map['hourly']?['precipitation_probability']?[index]?.toString() ??
              '0'),
    );
  }

  String toJson() => json.encode(toMap());

  factory WeatherModel.fromJson(String source) =>
      WeatherModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
