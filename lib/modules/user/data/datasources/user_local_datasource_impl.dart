import 'package:flutter_clean_architecture/core/constants/constants.dart';
import 'package:flutter_clean_architecture/core/services/storage/secure_storage_service.dart';
import 'package:flutter_clean_architecture/modules/user/data/datasources/user_local_datasource.dart';
import 'package:flutter_clean_architecture/modules/user/domain/entities/user_entity.dart';

class UserLocalDatasourceImpl extends UserLocalDatasource {
  final SecureStorageService _storage;

  UserLocalDatasourceImpl({required SecureStorageService storageService})
      : _storage = storageService;

  @override
  Future<bool> deleteUser() async {
    await _storage.delete(Keys.userEmail);
    await _storage.delete(Keys.userPassword);
    return true;
  }

  @override
  Future<UserEntity?> getUser() async {
    final email = await _storage.read(Keys.userEmail);
    final password = await _storage.read(Keys.userPassword);
    if (email == null || password == null) return null;
    return UserEntity(name: '', email: email, password: password);
  }

  @override
  Future<bool> saveUser(UserEntity user) async {
    await _storage.save(Keys.userEmail, user.email);
    await _storage.save(Keys.userPassword, user.password);
    return true;
  }
}
