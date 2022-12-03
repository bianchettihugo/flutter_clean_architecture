import 'package:flutter_clean_architecture/modules/user/domain/entities/user_entity.dart';
import 'package:flutter_clean_architecture/modules/user/domain/repositories/user_repository.dart';

import '../../../../core/utils/result.dart';

abstract class GetCurrentUserUsecase {
  Future<Result<UserEntity>> call();
}

class GetCurrentUserUsecaseImpl extends GetCurrentUserUsecase {
  final UserRepository _repository;

  GetCurrentUserUsecaseImpl({required UserRepository repository})
      : _repository = repository;

  @override
  Future<Result<UserEntity>> call() async {
    return await _repository.getUser();
  }
}
