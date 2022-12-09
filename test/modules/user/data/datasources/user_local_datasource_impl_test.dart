import 'package:flutter_clean_architecture/core/constants/storage_keys.dart';
import 'package:flutter_clean_architecture/core/services/storage/secure_storage_service.dart';
import 'package:flutter_clean_architecture/modules/user/data/datasources/user_local_datasource_impl.dart';
import 'package:flutter_clean_architecture/modules/user/domain/entities/user_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../utils/mocks.dart';

void main() {
  late SecureStorageService storage;
  late UserLocalDatasourceImpl datasource;

  setUpAll(() {
    storage = MockSecureStorageService();
    datasource = UserLocalDatasourceImpl(storageService: storage);
  });

  test('should be able to save user', () async {
    when(() => storage.save(Keys.userEmail, 'asdas@email.com'))
        .thenAnswer((invocation) async => true);
    when(() => storage.save(Keys.userPassword, '123'))
        .thenAnswer((invocation) async => true);

    final result = await datasource.saveUser(const UserEntity(
      name: 'Name',
      email: 'asdas@email.com',
      password: '123',
    ));

    expect(result, true);
  });

  test('should be able to get the user', () async {
    when(() => storage.read(Keys.userEmail))
        .thenAnswer((invocation) async => 'asdas@email.com');
    when(() => storage.read(Keys.userPassword))
        .thenAnswer((invocation) async => '123');

    final result = await datasource.getUser();

    expect(
        result,
        const UserEntity(
          name: '',
          email: 'asdas@email.com',
          password: '123',
        ));
  });

  test('should be able to delete user', () async {
    when(() => storage.delete(Keys.userEmail))
        .thenAnswer((invocation) async => true);
    when(() => storage.delete(Keys.userPassword))
        .thenAnswer((invocation) async => true);

    final result = await datasource.deleteUser();

    expect(result, true);
  });
}
