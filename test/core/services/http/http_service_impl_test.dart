import 'package:dio/dio.dart';
import 'package:flutter_clean_architecture/core/services/http/http_service_impl.dart';
import 'package:flutter_clean_architecture/core/services/http/http_service.dart';
import 'package:flutter_clean_architecture/core/utils/exception.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../utils/mocks.dart';

void main() {
  late Dio dio;
  late DioHttpService httpService;

  setUpAll(() {
    dio = MockDio();
    httpService = DioHttpService(dio: dio);
    registerFallbackValue(Options(
      method: 'GET',
      headers: {},
    ));
  });

  test('should create a Dio http service', () async {
    DioHttpService(dio: MockDio());
    DioHttpService();
  });

  test('should make http requests', () async {
    when(() => dio.request(
          '/path',
          data: null,
          options: any(named: 'options'),
        )).thenAnswer(
      (invocation) async => Response(
        data: true,
        requestOptions: RequestOptions(
          path: '/path',
        ),
      ),
    );

    final result = await httpService.request(method: Method.get, url: '/path');
    expect(result, true);
  });

  test('should throw error code 500', () async {
    when(() => dio.request(
          '/path',
          data: null,
          options: any(named: 'options'),
        )).thenThrow(Exception(''));

    expect(
      () => httpService.request(method: Method.get, url: '/path'),
      throwsA(
        AppException(
          message: HttpErrors.error,
          statusCode: 500,
        ),
      ),
    );
  });

  test('should throw error code 408 on sendTimeout', () async {
    final options = RequestOptions(
      path: '/path',
    );
    when(() => dio.request(
          '/path',
          data: null,
          options: any(named: 'options'),
        )).thenThrow(DioError(
      requestOptions: options,
      type: DioErrorType.sendTimeout,
    ));

    expect(
      () => httpService.request(method: Method.get, url: '/path'),
      throwsA(
        AppException(
          message: HttpErrors.error,
          statusCode: 408,
        ),
      ),
    );
  });

  test('should throw error code 444', () async {
    final options = RequestOptions(
      path: '/path',
    );
    when(() => dio.request(
          '/path',
          data: null,
          options: any(named: 'options'),
        )).thenThrow(DioError(
      requestOptions: options,
      type: DioErrorType.cancel,
    ));

    expect(
      () => httpService.request(method: Method.get, url: '/path'),
      throwsA(
        AppException(
          message: HttpErrors.error,
          statusCode: 444,
        ),
      ),
    );
  });

  test('should throw error code 408 on connectTimeout', () async {
    final options = RequestOptions(
      path: '/path',
    );
    when(() => dio.request(
          '/path',
          data: null,
          options: any(named: 'options'),
        )).thenThrow(DioError(
      requestOptions: options,
      type: DioErrorType.connectionTimeout,
    ));

    expect(
      () => httpService.request(method: Method.get, url: '/path'),
      throwsA(
        AppException(
          message: HttpErrors.error,
          statusCode: 408,
        ),
      ),
    );
  });

  test('should throw error code 502', () async {
    final options = RequestOptions(
      path: '/path',
    );
    when(() => dio.request(
          '/path',
          data: null,
          options: any(named: 'options'),
        )).thenThrow(DioError(
      requestOptions: options,
      type: DioErrorType.connectionError,
    ));

    expect(
      () => httpService.request(method: Method.get, url: '/path'),
      throwsA(
        AppException(
          message: HttpErrors.error,
          statusCode: 502,
        ),
      ),
    );
  });

  test('should throw error code 408 on receiveTimeout', () async {
    final options = RequestOptions(
      path: '/path',
    );
    when(() => dio.request(
          '/path',
          data: null,
          options: any(named: 'options'),
        )).thenThrow(DioError(
      requestOptions: options,
      type: DioErrorType.receiveTimeout,
    ));

    expect(
      () => httpService.request(method: Method.get, url: '/path'),
      throwsA(
        AppException(
          message: HttpErrors.error,
          statusCode: 408,
        ),
      ),
    );
  });

  test('should throw error custom status code and error message', () async {
    final options = RequestOptions(
      path: '/path',
    );
    when(() => dio.request(
          '/path',
          data: null,
          options: any(named: 'options'),
        )).thenThrow(DioError(
      requestOptions: options,
      response: Response(requestOptions: options, statusCode: 409, data: 'err'),
      type: DioErrorType.unknown,
    ));

    expect(
      () => httpService.request(method: Method.get, url: '/path'),
      throwsA(
        AppException(
          message: 'err',
          statusCode: 409,
        ),
      ),
    );
  });

  test('should throw unknown error', () async {
    final options = RequestOptions(
      path: '/path',
    );
    when(() => dio.request(
          '/path',
          data: null,
          options: any(named: 'options'),
        )).thenThrow(DioError(
      requestOptions: options,
      response: Response(requestOptions: options, statusCode: null, data: null),
      type: DioErrorType.unknown,
    ));

    expect(
      () => httpService.request(method: Method.get, url: '/path'),
      throwsA(
        AppException(
          message: HttpErrors.unknownError,
          statusCode: 500,
        ),
      ),
    );
  });
}
