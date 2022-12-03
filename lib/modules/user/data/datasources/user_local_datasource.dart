import 'package:flutter_clean_architecture/modules/user/domain/entities/user_entity.dart';

abstract class UserLocalDatasource {
  Future<bool> saveUser(UserEntity user);

  Future<bool> deleteUser();

  Future<UserEntity?> getUser();
}
