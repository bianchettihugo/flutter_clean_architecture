import 'package:flutter_clean_architecture/modules/user/domain/repositories/user_repository.dart';

import '../../../../core/utils/result.dart';

abstract class UserSignOutUsecase {
  Future<Result<bool>> call();
}

class UserSignOutUsecaseImpl extends UserSignOutUsecase {
  final UserRepository _repository;

  UserSignOutUsecaseImpl({required UserRepository repository})
      : _repository = repository;

  @override
  Future<Result<bool>> call() async {
    return await _repository.signOut();
  }
}
