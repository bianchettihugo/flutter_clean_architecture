class WeatherEntity {
  final double temperature;
  final double windSpeed;
  final double humidity;
  final double rain;

  WeatherEntity({
    required this.temperature,
    required this.windSpeed,
    required this.humidity,
    required this.rain,
  });

  @override
  bool operator ==(covariant WeatherEntity other) {
    if (identical(this, other)) return true;

    return other.temperature == temperature &&
        other.windSpeed == windSpeed &&
        other.humidity == humidity &&
        other.rain == rain;
  }

  @override
  int get hashCode {
    return temperature.hashCode ^
        windSpeed.hashCode ^
        humidity.hashCode ^
        rain.hashCode;
  }
}
