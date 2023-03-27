import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/core/services/connection/address_checker.dart';
import 'package:flutter_clean_architecture/core/services/connection/connection_service.dart';
import 'package:flutter_clean_architecture/core/services/http/http_service.dart';
import 'package:flutter_clean_architecture/core/services/location/geolocator_handler.dart';
import 'package:flutter_clean_architecture/core/services/location/location_service.dart';
import 'package:flutter_clean_architecture/core/services/permissions/permission_handler.dart';
import 'package:flutter_clean_architecture/core/services/storage/storage_service.dart';
import 'package:flutter_clean_architecture/modules/weather/data/datasources/local_weather_datasource.dart';
import 'package:flutter_clean_architecture/modules/weather/data/datasources/remote_weather_datasource.dart';
import 'package:flutter_clean_architecture/modules/weather/domain/repositories/weather_repository.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

class MockStorage extends Mock implements SharedPreferences {}

class MockStorageService extends Mock implements StorageService {}

class MockDio extends Mock implements Dio {}

class MockAddressChecker extends Mock implements AddressChecker {}

class MockHttpService extends Mock implements HttpService {}

class MockConnectivity extends Mock implements Connectivity {}

class MockConnectionService extends Mock implements ConnectionService {}

class MockPermissionHandler extends Mock implements PermissionHandler {}

class MockLocationService extends Mock implements LocationService {}

class MockGeolocatorHandler extends Mock implements GeolocatorHandler {}

class MockLocalWeatherDatasource extends Mock
    implements LocalWeatherDatasource {}

class MockRemoteWeatherDatasource extends Mock
    implements RemoteWeatherDatasource {}

class MockWeatherRepository extends Mock implements WeatherRepository {}
