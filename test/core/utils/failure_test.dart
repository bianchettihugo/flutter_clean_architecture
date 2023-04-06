import 'package:flutter_clean_architecture/core/utils/exception.dart';
import 'package:flutter_clean_architecture/core/utils/failure.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('should check failure equality', () async {
    final exception = AppException(message: 'message');

    final failure1 = Failure('message');
    final failure2 = Failure.fromException(exception);

    expect(failure1, failure2);
    expect(failure1.hashCode, failure2.hashCode);
  });
}
