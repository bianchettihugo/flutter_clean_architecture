import 'package:flutter_clean_architecture/core/utils/result.dart';
import 'package:flutter_clean_architecture/modules/location/domain/entities/location_entity.dart';
import 'package:flutter_clean_architecture/modules/location/domain/usecases/fetch_location_usecase.dart';
import 'package:flutter_clean_architecture/modules/weather/domain/entities/weather_entity.dart';
import 'package:flutter_clean_architecture/modules/weather/domain/usecases/fetch_weather_color_usecase.dart';
import 'package:flutter_clean_architecture/modules/weather/domain/usecases/fetch_weather_icon_usecase.dart';
import 'package:flutter_clean_architecture/modules/weather/domain/usecases/fetch_weather_usecase.dart';
import 'package:flutter_clean_architecture/modules/weather/presentation/controllers/weather_controller.dart';
import 'package:flutter_clean_architecture/modules/weather/presentation/pages/weather_info_page.dart';
import 'package:flutter_clean_architecture/modules/weather/presentation/widgets/weather_card.dart';
import 'package:flutter_clean_architecture/modules/weather/presentation/widgets/weather_icon.dart';
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

  testWidgets('should render a WeatherInfoPage', (tester) async {
    controller.weather.value = weatherEntity;

    await tester.pumpWidgetWithApp(WeatherInfoPage(controller: controller));

    expect(find.byType(WeatherInfoPage), findsOneWidget);
    expect(find.byType(WeatherIcon), findsOneWidget);
    expect(find.byType(WeatherCard), findsNWidgets(3));
    expect(find.text('Offline'), findsNothing);
  });

  testWidgets('should render an offline WeatherInfoPage', (tester) async {
    controller.weather.value = weatherEntity.copyWith(offlineData: true);

    await tester.pumpWidgetWithApp(WeatherInfoPage(controller: controller));

    expect(find.byType(WeatherInfoPage), findsOneWidget);
    expect(find.byType(WeatherIcon), findsOneWidget);
    expect(find.byType(WeatherCard), findsNWidgets(3));
    expect(find.text('Offline'), findsOneWidget);
  });

  testWidgets('should call fetchWeather method on update', (tester) async {
    controller.weather.value = weatherEntity;

    when(fetchLocation).thenAnswer(
      (invocation) async => Result<LocationEntity>.success(LocationEntity(
        latitude: 10,
        longitude: 10,
      )),
    );

    when(() => fetchWeather(latitude: 10, longitude: 10)).thenAnswer(
      (invocation) async => Result<WeatherEntity>.success(
          weatherEntity.copyWith(offlineData: false, weatherCode: 63)),
    );

    await tester.pumpWidgetWithApp(WeatherInfoPage(controller: controller));

    expect(find.byType(WeatherInfoPage), findsOneWidget);
    expect(find.byType(WeatherIcon), findsOneWidget);
    expect(find.byType(WeatherCard), findsNWidgets(3));
    expect(find.text('Offline'), findsNothing);

    await tester.dragFrom(
      const Offset(0.0, 10.0),
      const Offset(0.0, 100.0),
    );

    verify(fetchLocation).called(1);
    verify(() => fetchWeather(latitude: 10, longitude: 10)).called(1);
  });
}
