import 'package:flutter_clean_architecture/core/services/storage/secure_storage_service_impl.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../utils/mocks.dart';

void main() {
  late FlutterSecureStorage secureStorage;
  late SecureStorageServiceImpl storageService;

  setUpAll(() {
    secureStorage = MockSecureStorage();
    storageService = SecureStorageServiceImpl(secureStorage);
  });

  test('should create a storage service', () async {
    SecureStorageServiceImpl(MockSecureStorage());
    SecureStorageServiceImpl();
  });

  test('should sava data on secure storage', () {
    when(() => secureStorage.write(key: 'test', value: '123'))
        .thenAnswer((invocation) async {});

    storageService.save('test', '123');
  });

  test('should read data on secure storage', () async {
    when(() => secureStorage.read(key: 'test'))
        .thenAnswer((invocation) async => '123');

    final result = await storageService.read('test');
    expect(result, '123');
  });

  test('should delete data on secure storage', () async {
    when(() => secureStorage.delete(key: 'test'))
        .thenAnswer((invocation) async {});

    await storageService.delete('test');
  });
}
