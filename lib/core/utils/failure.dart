import 'package:flutter_clean_architecture/core/utils/exception.dart';

class Failure {
  final String message;
  final String module;
  final int statusCode;

  Failure(
    this.message, {
    this.module = '',
    this.statusCode = 0,
  });

  factory Failure.fromException(AppException exception, [String module = '']) {
    return Failure(exception.message, module: module);
  }

  @override
  bool operator ==(covariant Failure other) {
    if (identical(this, other)) return true;

    return other.message == message &&
        other.module == module &&
        other.statusCode == statusCode;
  }

  @override
  int get hashCode => message.hashCode ^ module.hashCode ^ statusCode.hashCode;
}
