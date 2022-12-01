import 'package:flutter_clean_architecture/core/utils/result.dart';
import 'package:flutter_clean_architecture/modules/user/domain/entities/user_entity.dart';

abstract class UserRepository {
  Future<Result<bool>> signIn(UserEntity user);

  Future<Result<bool>> signUp(UserEntity user);

  Future<Result<bool>> signOut();
}
