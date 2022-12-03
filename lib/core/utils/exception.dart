class AppException {
  final String title;
  final String message;
  final StackTrace? stackTrace;
  final Object? error;

  AppException({
    required this.message,
    this.title = '',
    this.stackTrace,
    this.error,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AppException && other.message == message;
  }

  @override
  int get hashCode {
    return message.hashCode;
  }
}
