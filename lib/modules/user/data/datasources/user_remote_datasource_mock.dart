import 'package:flutter_clean_architecture/modules/user/data/datasources/user_remote_datasource.dart';
import 'package:flutter_clean_architecture/modules/user/domain/entities/user_entity.dart';

class UserRemoteDatasourceMock extends UserRemoteDatasource {
  @override
  Future<UserEntity> signIn({
    required String email,
    required String password,
  }) async {
    await Future.delayed(const Duration(seconds: 1));
    return UserEntity(name: 'UserMock', email: email);
  }

  @override
  Future<UserEntity> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    await Future.delayed(const Duration(seconds: 1));
    return UserEntity(name: 'UserMock', email: email);
  }
}
