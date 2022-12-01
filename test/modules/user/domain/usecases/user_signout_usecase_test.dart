import 'package:flutter_clean_architecture/core/utils/result.dart';
import 'package:flutter_clean_architecture/modules/user/domain/repositories/user_repository.dart';
import 'package:flutter_clean_architecture/modules/user/domain/usecases/user_signout_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../utils/mocks.dart';

void main() {
  late UserRepository repository;
  late UserSignOutUsecase signOut;

  setUpAll(() {
    repository = MockUserRepository();
    signOut = UserSignOutUsecaseImpl(repository: repository);
  });

  test('should call repository when all informations are valid', () async {
    when(() => repository.signOut()).thenAnswer(
      (_) async => Result.success(true),
    );

    final result = await signOut();

    expect(result.isSuccess, true);
    expect(result.data, true);
    verify(repository.signOut).called(1);
  });
}
