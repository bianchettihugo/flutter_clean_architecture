import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/core/services/http/http_service.dart';
import 'package:mocktail/mocktail.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

class MockDio extends Mock implements Dio {}

class MockHttpService extends Mock implements HttpService {}
