import 'package:flutter_clean_architecture/core/constants/files.dart';
import 'package:flutter_clean_architecture/modules/weather/domain/usecases/fetch_weather_icon_usecase.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late FetchWeatherIconUsecase fetchIcon;

  setUpAll(() {
    fetchIcon = FetchWeatherIconUsecaseImpl();
  });

  testWidgets('should return the default weather icon', (tester) async {
    expect(fetchIcon(weatherCode: 999), Files.cloudy);
  });

  testWidgets('should return a clear sky day icon', (tester) async {
    expect(fetchIcon(weatherCode: 0), Files.sun);
  });

  testWidgets('should return a partly cloudy day icon', (tester) async {
    expect(fetchIcon(weatherCode: 1), Files.cloudy);
    expect(fetchIcon(weatherCode: 2), Files.cloudy);
    expect(fetchIcon(weatherCode: 3), Files.cloudy);
  });

  testWidgets('should return a fog day icon', (tester) async {
    expect(fetchIcon(weatherCode: 45), Files.cloudy);
    expect(fetchIcon(weatherCode: 48), Files.cloudy);
  });

  testWidgets('should return a drizzle day icon', (tester) async {
    expect(fetchIcon(weatherCode: 51), Files.rain);
    expect(fetchIcon(weatherCode: 53), Files.rain);
    expect(fetchIcon(weatherCode: 55), Files.rain);
    expect(fetchIcon(weatherCode: 56), Files.rain);
    expect(fetchIcon(weatherCode: 57), Files.rain);
    expect(fetchIcon(weatherCode: 80), Files.rain);
    expect(fetchIcon(weatherCode: 81), Files.rain);
    expect(fetchIcon(weatherCode: 82), Files.rain);
  });

  testWidgets('should return a rainy day icon', (tester) async {
    expect(fetchIcon(weatherCode: 61), Files.storm);
    expect(fetchIcon(weatherCode: 63), Files.storm);
    expect(fetchIcon(weatherCode: 65), Files.storm);
    expect(fetchIcon(weatherCode: 66), Files.storm);
    expect(fetchIcon(weatherCode: 67), Files.storm);
    expect(fetchIcon(weatherCode: 95), Files.storm);
    expect(fetchIcon(weatherCode: 96), Files.storm);
    expect(fetchIcon(weatherCode: 99), Files.storm);
  });

  testWidgets('should return a snowy day icon', (tester) async {
    expect(fetchIcon(weatherCode: 71), Files.snow);
    expect(fetchIcon(weatherCode: 73), Files.snow);
    expect(fetchIcon(weatherCode: 75), Files.snow);
    expect(fetchIcon(weatherCode: 77), Files.snow);
    expect(fetchIcon(weatherCode: 85), Files.snow);
    expect(fetchIcon(weatherCode: 86), Files.snow);
  });
}
