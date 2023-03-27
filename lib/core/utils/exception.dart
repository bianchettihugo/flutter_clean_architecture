class AppException {
  final String title;
  final String message;
  final StackTrace? stackTrace;
  final Object? error;
  final int statusCode;

  AppException({
    required this.message,
    this.title = '',
    this.stackTrace,
    this.error,
    this.statusCode = 0,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AppException &&
        other.message == message &&
        other.statusCode == statusCode;
  }

  @override
  int get hashCode {
    return message.hashCode ^ statusCode.hashCode;
  }
}

class PermissionException implements Exception {}
