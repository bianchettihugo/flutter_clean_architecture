import 'package:flutter_clean_architecture/core/utils/exception.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('should check AppException equality', () async {
    final ae1 = AppException(message: 'Message');
    final ae2 = AppException(message: 'Message');

    expect(ae1, ae2);
    expect(ae1.hashCode, ae2.hashCode);
  });
}
