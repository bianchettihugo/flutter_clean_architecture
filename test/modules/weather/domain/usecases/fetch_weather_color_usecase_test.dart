import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/modules/weather/domain/usecases/fetch_weather_color_usecase.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late FetchWeatherColorUsecase fetchColor;

  setUpAll(() {
    fetchColor = FetchWeatherColorUsecaseImpl();
  });

  testWidgets('should return the default weather color', (tester) async {
    expect(fetchColor(weatherCode: 999), const Color(0xff6D67D0));
  });

  testWidgets('should return a clear sky day color', (tester) async {
    expect(fetchColor(weatherCode: 0), const Color(0xffCEB0A0));
  });

  testWidgets('should return a partly cloudy day color', (tester) async {
    expect(fetchColor(weatherCode: 1), const Color(0xff837EDE));
    expect(fetchColor(weatherCode: 2), const Color(0xff837EDE));
    expect(fetchColor(weatherCode: 3), const Color(0xff837EDE));
  });

  testWidgets('should return a fog day color', (tester) async {
    expect(fetchColor(weatherCode: 45), const Color(0xff6D67D0));
    expect(fetchColor(weatherCode: 48), const Color(0xff6D67D0));
  });

  testWidgets('should return a drizzle day color', (tester) async {
    expect(fetchColor(weatherCode: 51), const Color(0xff4550B2));
    expect(fetchColor(weatherCode: 53), const Color(0xff4550B2));
    expect(fetchColor(weatherCode: 55), const Color(0xff4550B2));
    expect(fetchColor(weatherCode: 56), const Color(0xff4550B2));
    expect(fetchColor(weatherCode: 57), const Color(0xff4550B2));
    expect(fetchColor(weatherCode: 80), const Color(0xff4550B2));
    expect(fetchColor(weatherCode: 81), const Color(0xff4550B2));
    expect(fetchColor(weatherCode: 82), const Color(0xff4550B2));
  });

  testWidgets('should return a rainy day color', (tester) async {
    expect(fetchColor(weatherCode: 61), const Color(0xff333B87));
    expect(fetchColor(weatherCode: 63), const Color(0xff333B87));
    expect(fetchColor(weatherCode: 65), const Color(0xff333B87));
    expect(fetchColor(weatherCode: 66), const Color(0xff333B87));
    expect(fetchColor(weatherCode: 67), const Color(0xff333B87));
    expect(fetchColor(weatherCode: 95), const Color(0xff333B87));
    expect(fetchColor(weatherCode: 96), const Color(0xff333B87));
    expect(fetchColor(weatherCode: 99), const Color(0xff333B87));
  });

  testWidgets('should return a snowy day color', (tester) async {
    expect(fetchColor(weatherCode: 71), const Color(0xff809DBE));
    expect(fetchColor(weatherCode: 73), const Color(0xff809DBE));
    expect(fetchColor(weatherCode: 75), const Color(0xff809DBE));
    expect(fetchColor(weatherCode: 77), const Color(0xff809DBE));
    expect(fetchColor(weatherCode: 85), const Color(0xff809DBE));
    expect(fetchColor(weatherCode: 86), const Color(0xff809DBE));
  });
}
