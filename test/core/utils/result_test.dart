import 'package:flutter_clean_architecture/core/utils/failure.dart';
import 'package:flutter_clean_architecture/core/utils/result.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('should check if result returns success', () async {
    final result = Result.success(true);
    expect(result.isSuccess, true);
  });

  test('should return result data', () async {
    final result = Result.success(true);
    expect(result.error, null);
    expect(result.data, true);
  });

  test('should return result error', () async {
    final result = Result.failure(Failure('Error'));
    expect(result.data, null);
    expect(result.error, Failure('Error'));
  });

  test('should call success function when result returns success', () async {
    int count = 0;
    final result = Result.success(1);
    result.when(
      failure: (error) => count = 2,
      success: (success) => count = success,
    );
    expect(count, 1);
  });

  test('should call error function when result returns error', () async {
    int count = 0;
    final result = Result.failure(Failure('error'));
    result.when(
      failure: (error) => count = 2,
      success: (success) => count = success,
    );
    expect(count, 2);
  });

  test('should check result equality', () async {
    final result = Result.success(true);
    final result2 = Result.success(true);

    expect(result, result2);
    expect(result.hashCode, result2.hashCode);
  });
}
