import 'package:flutter_clean_architecture/core/utils/failure.dart';
import 'package:flutter_clean_architecture/core/utils/result.dart';
import 'package:flutter_clean_architecture/modules/user/domain/entities/user_entity.dart';
import 'package:flutter_clean_architecture/modules/user/domain/repositories/user_repository.dart';
import 'package:flutter_clean_architecture/modules/user/domain/usecases/user_signup_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../utils/mocks.dart';

void main() {
  late UserRepository repository;
  late UserSignUpUsecase signUp;

  setUpAll(() {
    repository = MockUserRepository();
    signUp = UserSignUpUsecaseImpl(repository: repository);
  });

  test('should return invalid name when email is invalid', () async {
    const user = UserEntity(name: '', email: 'sajdkjqw');
    final result = await signUp(user);

    expect(result.isSuccess, false);
    expect(result.error, Failure('Invalid Name'));
  });

  test('should return invalid email when email is invalid', () async {
    const user = UserEntity(name: 'Name', email: 'sajdkjqw');
    final result = await signUp(user);

    expect(result.isSuccess, false);
    expect(result.error, Failure('Invalid Email'));
  });

  test('should return invalid password when password is invalid', () async {
    const user = UserEntity(
      name: 'Name',
      email: 'teste@gmail.com',
      password: '12',
    );
    final result = await signUp(user);

    expect(result.isSuccess, false);
    expect(result.error, Failure('Invalid Password'));
  });

  test('should call repository when all informations are valid', () async {
    const user = UserEntity(
      name: 'Name',
      email: 'teste@gmail.com',
      password: '12345',
    );
    when(() => repository.signUp(user)).thenAnswer(
      (_) async => Result.success(true),
    );

    final result = await signUp(user);

    expect(result.isSuccess, true);
    expect(result.data, true);
    verify(() => repository.signUp(user)).called(1);
  });
}
