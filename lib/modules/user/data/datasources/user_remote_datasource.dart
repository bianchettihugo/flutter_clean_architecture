import 'package:flutter_clean_architecture/modules/user/domain/entities/user_entity.dart';

abstract class UserRemoteDatasource {
  Future<UserEntity> signIn({
    required String email,
    required String password,
  });

  Future<UserEntity> signUp({
    required String name,
    required String email,
    required String password,
  });
}
