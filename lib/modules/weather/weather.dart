import 'package:flutter_clean_architecture/core/services/dependency/dependency_service.dart';
import 'package:flutter_clean_architecture/core/services/http/http_service.dart';
import 'package:flutter_clean_architecture/core/services/storage/storage_service.dart';
import 'package:flutter_clean_architecture/modules/location/domain/usecases/fetch_location_usecase.dart';
import 'package:flutter_clean_architecture/modules/weather/data/datasources/local_weather_datasource.dart';
import 'package:flutter_clean_architecture/modules/weather/data/datasources/local_weather_datasource_impl.dart';
import 'package:flutter_clean_architecture/modules/weather/data/datasources/remote_weather_datasource.dart';
import 'package:flutter_clean_architecture/modules/weather/data/datasources/remote_weather_datasource_impl.dart';
import 'package:flutter_clean_architecture/modules/weather/data/repositories/weather_repository_impl.dart';
import 'package:flutter_clean_architecture/modules/weather/domain/repositories/weather_repository.dart';
import 'package:flutter_clean_architecture/modules/weather/domain/usecases/fetch_weather_color_usecase.dart';
import 'package:flutter_clean_architecture/modules/weather/domain/usecases/fetch_weather_icon_usecase.dart';
import 'package:flutter_clean_architecture/modules/weather/domain/usecases/fetch_weather_usecase.dart';
import 'package:flutter_clean_architecture/modules/weather/presentation/controllers/weather_controller.dart';

class WeatherModule {
  static void init() {
    Dependency.register<RemoteWeatherDatasource>(
      RemoteWeatherDatasourceImpl(
        httpService: Dependency.get<HttpService>(),
      ),
    );

    Dependency.register<LocalWeatherDatasource>(
      LocalWeatherDatasourceImpl(
        storageService: Dependency.get<StorageService>(),
      ),
    );

    Dependency.register<WeatherRepository>(
      WeatherRepositoryImpl(
        localDatasource: Dependency.get<LocalWeatherDatasource>(),
        remoteDatasource: Dependency.get<RemoteWeatherDatasource>(),
      ),
    );

    Dependency.register<FetchWeatherUsecase>(
      FetchWeatherUsecaseImpl(
        repository: Dependency.get<WeatherRepository>(),
      ),
    );

    Dependency.register<FetchWeatherColorUsecase>(
      FetchWeatherColorUsecaseImpl(),
    );

    Dependency.register<FetchWeatherIconUsecase>(
      FetchWeatherIconUsecaseImpl(),
    );

    Dependency.registerLazy<WeatherController>(
      WeatherController(
        fetchLocationUsecase: Dependency.get<FetchLocationUsecase>(),
        fetchWeatherUsecase: Dependency.get<FetchWeatherUsecase>(),
        fetchWeatherColorUsecase: Dependency.get<FetchWeatherColorUsecase>(),
        fetchWeatherIconUsecase: Dependency.get<FetchWeatherIconUsecase>(),
      ),
    );
  }
}
