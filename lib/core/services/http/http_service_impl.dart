import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter_clean_architecture/core/services/http/http_service.dart';
import 'package:flutter_clean_architecture/core/utils/exception.dart';
import 'package:flutter_clean_architecture/core/utils/failure.dart';

class DioHttpService extends HttpService {
  late Dio _dio;

  DioHttpService({
    Dio? dio,
    String baseUrl = '',
  }) {
    _dio = dio ??
        Dio(BaseOptions(
          baseUrl: baseUrl,
          receiveTimeout: const Duration(seconds: 9999),
          connectTimeout: const Duration(seconds: 9999),
          contentType: "application/json",
        ));
  }

  @override
  Future<dynamic> request({
    required Method method,
    required String url,
    Map<String, dynamic>? data,
    Map<String, dynamic>? params,
    Map<String, dynamic>? headers,
  }) async {
    try {
      var response = await _dio.request(
        url,
        data: data,
        queryParameters: params,
        options: Options(
          method: methods[method],
          headers: headers,
        ),
      );

      return response.data;
    } catch (e) {
      final error = handleError(e);
      throw AppException(
        message: error.message,
        statusCode: error.statusCode,
      );
    }
  }

  Failure handleError(dynamic error) {
    String errorModel = HttpErrors.error;
    int statusCode = 500;

    if (error is DioError) {
      switch (error.type) {
        case DioErrorType.sendTimeout:
          statusCode = 408;
          break;
        case DioErrorType.cancel:
          statusCode = 444;
          break;
        case DioErrorType.connectionTimeout:
          statusCode = 408;
          break;
        case DioErrorType.receiveTimeout:
          statusCode = 408;
          break;
        case DioErrorType.connectionError:
          statusCode = 502;
          break;
        default:
          statusCode = error.response?.statusCode ?? 500;
          errorModel =
              error.response?.data?.toString() ?? HttpErrors.unknownError;
          break;
      }
    }
    return Failure(
      errorModel,
      statusCode: statusCode,
    );
  }
}
