import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/core/utils/result.dart';
import 'package:flutter_clean_architecture/modules/location/domain/entities/location_entity.dart';
import 'package:flutter_clean_architecture/modules/location/domain/usecases/fetch_location_usecase.dart';
import 'package:flutter_clean_architecture/modules/weather/domain/entities/weather_entity.dart';
import 'package:flutter_clean_architecture/modules/weather/domain/usecases/fetch_weather_color_usecase.dart';
import 'package:flutter_clean_architecture/modules/weather/domain/usecases/fetch_weather_icon_usecase.dart';
import 'package:flutter_clean_architecture/modules/weather/domain/usecases/fetch_weather_usecase.dart';
import 'package:flutter_clean_architecture/modules/weather/presentation/controllers/weather_controller.dart';
import 'package:flutter_clean_architecture/modules/weather/presentation/widgets/weather_color.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../utils/data.dart';
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

  testWidgets('should render a WeatherColor widget', (tester) async {
    await tester.pumpWidgetWithApp(WeatherColor(controller: controller));

    expect(find.byType(WeatherColor), findsOneWidget);
  });

  testWidgets('should change background color', (tester) async {
    when(fetchLocation).thenAnswer(
      (invocation) async => Result<LocationEntity>.success(LocationEntity(
        latitude: 10,
        longitude: 10,
      )),
    );

    when(() => fetchWeather(latitude: 10, longitude: 10)).thenAnswer(
      (invocation) async => Result<WeatherEntity>.success(
          weatherEntity.copyWith(offlineData: true, weatherCode: 63)),
    );

    await tester.pumpWidgetWithApp(WeatherColor(controller: controller));

    await tester.ensureVisible(find.byType(AnimatedContainer));

    var container = tester.firstWidget<AnimatedContainer>(
      find.byType(AnimatedContainer),
    );

    expect(
      (container.decoration as BoxDecoration).color,
      const Color(0xff191919),
    );

    await controller.fetchWeather();

    await tester.pumpAndSettle();

    container = tester.firstWidget<AnimatedContainer>(
      find.byType(AnimatedContainer),
    );

    expect(
      (container.decoration as BoxDecoration).color,
      const Color(0xff333B87),
    );
  });
}
