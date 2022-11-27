import 'package:flutter_clean_architecture/core/utils/failure.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('should check failure equality', () async {
    final failure1 = Failure('message');
    final failure2 = Failure('message');

    expect(failure1, failure2);
    expect(failure1.hashCode, failure2.hashCode);
  });
}
