import 'package:flutter_clean_architecture/core/utils/result.dart';
import 'package:flutter_clean_architecture/modules/user/domain/entities/user_entity.dart';
import 'package:flutter_clean_architecture/modules/user/domain/repositories/user_repository.dart';
import 'package:flutter_clean_architecture/modules/user/domain/usecases/get_current_user_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../utils/mocks.dart';

void main() {
  late UserRepository repository;
  late GetCurrentUserUsecase getUser;

  setUpAll(() {
    repository = MockUserRepository();
    getUser = GetCurrentUserUsecaseImpl(repository: repository);
  });

  test('should call repository when all informations are valid', () async {
    const user = UserEntity(name: 'name', email: 'email');
    when(() => repository.getUser()).thenAnswer(
      (_) async => Result.success(user),
    );

    final result = await getUser();

    expect(result.isSuccess, true);
    expect(result.data, user);
    verify(repository.getUser).called(1);
  });
}
