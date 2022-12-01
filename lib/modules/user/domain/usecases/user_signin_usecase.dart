import 'package:flutter_clean_architecture/core/utils/failure.dart';
import 'package:flutter_clean_architecture/modules/user/domain/entities/user_entity.dart';
import 'package:flutter_clean_architecture/modules/user/domain/repositories/user_repository.dart';

import '../../../../core/utils/result.dart';

abstract class UserSignInUsecase {
  Future<Result<bool>> call(UserEntity user);
}

class UserSignInUsecaseImpl extends UserSignInUsecase {
  final UserRepository _repository;

  UserSignInUsecaseImpl({required UserRepository repository})
      : _repository = repository;

  @override
  Future<Result<bool>> call(UserEntity user) async {
    if (!user.isEmailValid) return Result.failure(Failure('Invalid Email'));
    if (!user.isPasswordValid) {
      return Result.failure(
        Failure(
          'Invalid Password',
        ),
      );
    }

    return await _repository.signIn(user);
  }
}
