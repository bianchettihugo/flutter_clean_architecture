import 'package:flutter_clean_architecture/core/services/storage/storage_service_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../utils/mocks.dart';

void main() {
  late SharedPreferences storage;
  late StorageServiceImpl storageService;

  setUpAll(() {
    storage = MockStorage();
    storageService = StorageServiceImpl(storage);
  });

  test('should create a storage service', () async {
    StorageServiceImpl(MockStorage());
    StorageServiceImpl();
  });

  test('should sava data on secure storage', () {
    when(() => storage.setString('test', '123'))
        .thenAnswer((invocation) async => true);

    storageService.save('test', '123');
  });

  test('should read data on secure storage', () async {
    when(() => storage.getString('test')).thenAnswer((invocation) => '123');

    final result = await storageService.read('test');
    expect(result, '123');
  });

  test('should delete data on secure storage', () async {
    when(() => storage.remove('test')).thenAnswer((invocation) async => true);

    await storageService.delete('test');
  });
}
