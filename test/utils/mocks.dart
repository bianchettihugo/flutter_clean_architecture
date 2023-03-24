import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/core/services/http/http_service.dart';
import 'package:flutter_clean_architecture/core/services/storage/storage_service.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

class MockStorage extends Mock implements SharedPreferences {}

class MockStorageService extends Mock implements StorageService {}

class MockDio extends Mock implements Dio {}

class MockHttpService extends Mock implements HttpService {}
