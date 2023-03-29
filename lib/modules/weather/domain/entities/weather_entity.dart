class WeatherEntity {
  final double temperature;
  final double windSpeed;
  final double humidity;
  final double rain;
  final bool offlineData;

  WeatherEntity({
    required this.temperature,
    required this.windSpeed,
    required this.humidity,
    required this.rain,
    this.offlineData = false,
  });

  WeatherEntity.empty({
    this.temperature = 0,
    this.windSpeed = 0,
    this.humidity = 0,
    this.rain = 0,
    this.offlineData = false,
  });

  @override
  bool operator ==(covariant WeatherEntity other) {
    if (identical(this, other)) return true;

    return other.temperature == temperature &&
        other.windSpeed == windSpeed &&
        other.humidity == humidity &&
        other.rain == rain &&
        other.offlineData == offlineData;
  }

  @override
  int get hashCode {
    return temperature.hashCode ^
        windSpeed.hashCode ^
        humidity.hashCode ^
        offlineData.hashCode ^
        rain.hashCode;
  }

  WeatherEntity copyWith({
    double? temperature,
    double? windSpeed,
    double? humidity,
    double? rain,
    bool? offlineData,
  }) {
    return WeatherEntity(
      temperature: temperature ?? this.temperature,
      windSpeed: windSpeed ?? this.windSpeed,
      humidity: humidity ?? this.humidity,
      rain: rain ?? this.rain,
      offlineData: offlineData ?? this.offlineData,
    );
  }
}
