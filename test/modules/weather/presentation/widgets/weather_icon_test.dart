import 'package:animated_digit/animated_digit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/modules/location/domain/usecases/fetch_location_usecase.dart';
import 'package:flutter_clean_architecture/modules/weather/domain/usecases/fetch_weather_color_usecase.dart';
import 'package:flutter_clean_architecture/modules/weather/domain/usecases/fetch_weather_icon_usecase.dart';
import 'package:flutter_clean_architecture/modules/weather/domain/usecases/fetch_weather_usecase.dart';
import 'package:flutter_clean_architecture/modules/weather/presentation/controllers/weather_controller.dart';
import 'package:flutter_clean_architecture/modules/weather/presentation/widgets/weather_icon.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../utils/mocks.dart';
import '../../../../utils/test_utils.dart';

void main() {
  late FetchLocationUsecase fetchLocation;
  late FetchWeatherUsecase fetchWeather;
  late FetchWeatherColorUsecase fetchColor;
  late FetchWeatherIconUsecase fetchIcon;
  late WeatherController controller;

  setUp(() {
    fetchLocation = MockFetchLocationUsecase();
    fetchWeather = MockFetchWeatherUsecase();
    fetchColor = FetchWeatherColorUsecaseImpl();
    fetchIcon = FetchWeatherIconUsecaseImpl();
    controller = WeatherController(
      fetchLocationUsecase: fetchLocation,
      fetchWeatherUsecase: fetchWeather,
      fetchWeatherColorUsecase: fetchColor,
      fetchWeatherIconUsecase: fetchIcon,
    );
  });

  testWidgets('should render a WeatherIcon widget', (tester) async {
    await tester.pumpWidgetWithApp(WeatherIcon(
      controller: controller,
      temperature: '10',
    ));

    expect(find.byType(Image), findsOneWidget);
    expect(find.byType(AnimatedDigitWidget), findsOneWidget);
    expect(find.text('°C'), findsOneWidget);
  });
}
