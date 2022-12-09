import 'package:flutter_clean_architecture/core/services/dependency/dependency_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('should be able to register and retrieve a dependency', () async {
    Dependency.register<String>('Test');
    final str = Dependency.get<String>();
    expect(str, 'Test');
  });

  test('should be able to register and retrieve a lazy dependency', () async {
    Dependency.registerLazy<int>(10);
    final str = Dependency.get<int>();
    expect(str, 10);
  });
}
