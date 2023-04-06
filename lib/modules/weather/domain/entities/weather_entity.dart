class WeatherEntity {
  final double temperature;
  final double windSpeed;
  final double humidity;
  final double rain;
  final int weatherCode;
  final bool offlineData;

  WeatherEntity({
    required this.temperature,
    required this.windSpeed,
    required this.humidity,
    required this.rain,
    this.offlineData = false,
    this.weatherCode = 0,
  });

  WeatherEntity.empty({
    this.temperature = 0,
    this.windSpeed = 0,
    this.humidity = 0,
    this.rain = 0,
    this.offlineData = false,
    this.weatherCode = 0,
  });

  @override
  bool operator ==(covariant WeatherEntity other) {
    if (identical(this, other)) return true;

    return other.temperature == temperature &&
        other.windSpeed == windSpeed &&
        other.humidity == humidity &&
        other.rain == rain &&
        other.offlineData == offlineData &&
        other.weatherCode == weatherCode;
  }

  @override
  int get hashCode {
    return temperature.hashCode ^
        windSpeed.hashCode ^
        humidity.hashCode ^
        offlineData.hashCode ^
        weatherCode.hashCode ^
        rain.hashCode;
  }

  WeatherEntity copyWith({
    double? temperature,
    double? windSpeed,
    double? humidity,
    double? rain,
    int? weatherCode,
    bool? offlineData,
  }) {
    return WeatherEntity(
      temperature: temperature ?? this.temperature,
      windSpeed: windSpeed ?? this.windSpeed,
      humidity: humidity ?? this.humidity,
      rain: rain ?? this.rain,
      weatherCode: weatherCode ?? this.weatherCode,
      offlineData: offlineData ?? this.offlineData,
    );
  }
}
