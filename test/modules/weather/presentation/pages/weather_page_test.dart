import 'package:flutter_clean_architecture/core/services/dependency/dependency_service.dart';
import 'package:flutter_clean_architecture/core/utils/failure.dart';
import 'package:flutter_clean_architecture/core/utils/result.dart';
import 'package:flutter_clean_architecture/modules/location/domain/entities/location_entity.dart';
import 'package:flutter_clean_architecture/modules/location/domain/usecases/fetch_location_usecase.dart';
import 'package:flutter_clean_architecture/modules/location/presentation/pages/location_error_page.dart';
import 'package:flutter_clean_architecture/modules/location/presentation/pages/location_page.dart';
import 'package:flutter_clean_architecture/modules/weather/domain/entities/weather_entity.dart';
import 'package:flutter_clean_architecture/modules/weather/domain/usecases/fetch_weather_color_usecase.dart';
import 'package:flutter_clean_architecture/modules/weather/domain/usecases/fetch_weather_icon_usecase.dart';
import 'package:flutter_clean_architecture/modules/weather/domain/usecases/fetch_weather_usecase.dart';
import 'package:flutter_clean_architecture/modules/weather/presentation/controllers/weather_controller.dart';
import 'package:flutter_clean_architecture/modules/weather/presentation/pages/weather_connection_error_page.dart';
import 'package:flutter_clean_architecture/modules/weather/presentation/pages/weather_error_page.dart';
import 'package:flutter_clean_architecture/modules/weather/presentation/pages/weather_info_page.dart';
import 'package:flutter_clean_architecture/modules/weather/presentation/pages/weather_page.dart';
import 'package:flutter_clean_architecture/modules/weather/presentation/widgets/weather_loading.dart';
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

  bool registered = false;

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

    if (!registered) {
      Dependency.register<WeatherController>(controller);
      registered = true;
    }
  });

  testWidgets('should render a WeatherLoading widget', (tester) async {
    when(fetchLocation).thenAnswer(
      (invocation) async => Result<LocationEntity>.success(LocationEntity(
        latitude: 10,
        longitude: 10,
      )),
    );

    when(() => fetchWeather(latitude: 10, longitude: 10))
        .thenAnswer((invocation) async {
      await Future.delayed(const Duration(milliseconds: 800));
      return Result<WeatherEntity>.success(
          weatherEntity.copyWith(offlineData: false, weatherCode: 63));
    });

    await tester.pumpWidgetWithApp(const WeatherPage());
    await tester.pump();

    expect(find.byType(WeatherLoading), findsOneWidget);
    expect(find.byType(WeatherConnectionErrorPage), findsNothing);
    expect(find.byType(WeatherErrorPage), findsNothing);
    expect(find.byType(LocationPage), findsNothing);
    expect(find.byType(LocationErrorPage), findsNothing);
    expect(find.byType(WeatherInfoPage), findsNothing);

    await tester.pumpAndSettle();
  });

  testWidgets('should render a WeatherConnectionErrorPage widget',
      (tester) async {
    final controller = WeatherController(
      fetchLocationUsecase: fetchLocation,
      fetchWeatherUsecase: fetchWeather,
      fetchWeatherColorUsecase: fetchColor,
      fetchWeatherIconUsecase: fetchIcon,
    );

    when(fetchLocation).thenAnswer(
      (invocation) async => Result<LocationEntity>.success(LocationEntity(
        latitude: 10,
        longitude: 10,
      )),
    );

    when(() => fetchWeather(latitude: 10, longitude: 10))
        .thenAnswer((invocation) async {
      return Result<WeatherEntity>.failure(Failure('', statusCode: 0));
    });

    await tester.pumpWidgetWithApp(WeatherPage(controller: controller));
    await tester.pump();

    expect(find.byType(WeatherLoading), findsNothing);
    expect(find.byType(WeatherConnectionErrorPage), findsOneWidget);
    expect(find.byType(WeatherErrorPage), findsNothing);
    expect(find.byType(LocationPage), findsNothing);
    expect(find.byType(LocationErrorPage), findsNothing);
    expect(find.byType(WeatherInfoPage), findsNothing);
  });

  testWidgets('should render a WeatherErrorPage widget', (tester) async {
    final controller = WeatherController(
      fetchLocationUsecase: fetchLocation,
      fetchWeatherUsecase: fetchWeather,
      fetchWeatherColorUsecase: fetchColor,
      fetchWeatherIconUsecase: fetchIcon,
    );

    when(fetchLocation).thenAnswer(
      (invocation) async => Result<LocationEntity>.success(LocationEntity(
        latitude: 10,
        longitude: 10,
      )),
    );

    when(() => fetchWeather(latitude: 10, longitude: 10))
        .thenAnswer((invocation) async {
      return Result<WeatherEntity>.failure(Failure('', statusCode: -1));
    });

    await tester.pumpWidgetWithApp(WeatherPage(controller: controller));
    await tester.pump();

    expect(find.byType(WeatherLoading), findsNothing);
    expect(find.byType(WeatherConnectionErrorPage), findsNothing);
    expect(find.byType(WeatherErrorPage), findsOneWidget);
    expect(find.byType(LocationPage), findsNothing);
    expect(find.byType(LocationErrorPage), findsNothing);
    expect(find.byType(WeatherInfoPage), findsNothing);
  });

  testWidgets('should render a LocationPage widget', (tester) async {
    final controller = WeatherController(
      fetchLocationUsecase: fetchLocation,
      fetchWeatherUsecase: fetchWeather,
      fetchWeatherColorUsecase: fetchColor,
      fetchWeatherIconUsecase: fetchIcon,
    );

    when(fetchLocation).thenAnswer(
      (invocation) async => Result<LocationEntity>.failure(Failure(
        '',
        statusCode: 0,
      )),
    );

    when(() => fetchWeather(latitude: 10, longitude: 10))
        .thenAnswer((invocation) async {
      return Result<WeatherEntity>.failure(Failure('', statusCode: -1));
    });

    await tester.pumpWidgetWithApp(WeatherPage(controller: controller));
    await tester.pump();

    expect(find.byType(WeatherLoading), findsNothing);
    expect(find.byType(WeatherConnectionErrorPage), findsNothing);
    expect(find.byType(WeatherErrorPage), findsNothing);
    expect(find.byType(LocationPage), findsOneWidget);
    expect(find.byType(LocationErrorPage), findsNothing);
    expect(find.byType(WeatherInfoPage), findsNothing);
  });

  testWidgets('should render a LocationErrorPage widget', (tester) async {
    final controller = WeatherController(
      fetchLocationUsecase: fetchLocation,
      fetchWeatherUsecase: fetchWeather,
      fetchWeatherColorUsecase: fetchColor,
      fetchWeatherIconUsecase: fetchIcon,
    );

    when(fetchLocation).thenAnswer(
      (invocation) async => Result<LocationEntity>.failure(Failure(
        '',
        statusCode: -1,
      )),
    );

    when(() => fetchWeather(latitude: 10, longitude: 10))
        .thenAnswer((invocation) async {
      return Result<WeatherEntity>.failure(Failure('', statusCode: -1));
    });

    await tester.pumpWidgetWithApp(WeatherPage(controller: controller));
    await tester.pump();

    expect(find.byType(WeatherLoading), findsNothing);
    expect(find.byType(WeatherConnectionErrorPage), findsNothing);
    expect(find.byType(WeatherErrorPage), findsNothing);
    expect(find.byType(LocationPage), findsNothing);
    expect(find.byType(LocationErrorPage), findsOneWidget);
    expect(find.byType(WeatherInfoPage), findsNothing);
  });

  testWidgets('should render a WeatherInfoPage widget', (tester) async {
    final controller = WeatherController(
      fetchLocationUsecase: fetchLocation,
      fetchWeatherUsecase: fetchWeather,
      fetchWeatherColorUsecase: fetchColor,
      fetchWeatherIconUsecase: fetchIcon,
    );

    when(fetchLocation).thenAnswer(
      (invocation) async => Result<LocationEntity>.success(LocationEntity(
        latitude: 10,
        longitude: 10,
      )),
    );

    when(() => fetchWeather(latitude: 10, longitude: 10))
        .thenAnswer((invocation) async {
      return Result<WeatherEntity>.success(
          weatherEntity.copyWith(offlineData: false, weatherCode: 63));
    });

    await tester.pumpWidgetWithApp(WeatherPage(controller: controller));
    await tester.pump();

    expect(find.byType(WeatherLoading), findsNothing);
    expect(find.byType(WeatherConnectionErrorPage), findsNothing);
    expect(find.byType(WeatherErrorPage), findsNothing);
    expect(find.byType(LocationPage), findsNothing);
    expect(find.byType(LocationErrorPage), findsNothing);
    expect(find.byType(WeatherInfoPage), findsOneWidget);
  });
}
