import 'package:flutter_clean_architecture/core/utils/exception.dart';
import 'package:flutter_clean_architecture/core/utils/failure.dart';
import 'package:flutter_clean_architecture/modules/user/data/datasources/user_local_datasource.dart';
import 'package:flutter_clean_architecture/modules/user/data/datasources/user_remote_datasource.dart';
import 'package:flutter_clean_architecture/modules/user/data/repositories/user_repository_impl.dart';
import 'package:flutter_clean_architecture/modules/user/domain/entities/user_entity.dart';
import 'package:flutter_clean_architecture/modules/user/domain/repositories/user_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../utils/mocks.dart';

void main() {
  late UserLocalDatasource localDatasource;
  late UserRemoteDatasource remoteDatasource;
  late UserRepository repository;

  setUpAll(() {
    localDatasource = MockUserLocalDatasource();
    remoteDatasource = MockUserRemoteDatasource();
    repository = UserRepositoryImpl(
      remoteDatasource: remoteDatasource,
      localDatasource: localDatasource,
    );
  });

  group('Sign in', () {
    test('should return success when datasource returns success', () async {
      const user = UserEntity(
        name: 'Name',
        email: 'email@email.com',
        password: '123456',
      );
      when(() => localDatasource.saveUser(user)).thenAnswer(
        (invocation) async => true,
      );
      when(() => remoteDatasource.signIn(
          email: 'email@email.com', password: '123456')).thenAnswer(
        (invocation) async => user,
      );

      final result = await repository.signIn(user);
      expect(result.isSuccess, true);
      expect(result.data, true);
      verify(() => localDatasource.saveUser(user)).called(1);
      verify(
        () => remoteDatasource.signIn(
          email: 'email@email.com',
          password: '123456',
        ),
      ).called(1);
    });

    test('should return failure when datasource throws an AppException',
        () async {
      const user = UserEntity(
        name: 'Name',
        email: 'email@email.com',
        password: '123456',
      );
      when(() => localDatasource.saveUser(user)).thenAnswer(
        (invocation) async => true,
      );
      when(() => remoteDatasource.signIn(
          email: 'email@email.com', password: '123456')).thenThrow(
        AppException(message: 'Message'),
      );

      final result = await repository.signIn(user);
      expect(result.isSuccess, false);
      expect(result.error, Failure('Message', module: 'user'));
      verify(
        () => remoteDatasource.signIn(
          email: 'email@email.com',
          password: '123456',
        ),
      ).called(1);
      verifyNever(() => localDatasource.saveUser(user));
    });

    test('should return failure when datasource throws an Exception', () async {
      const user = UserEntity(
        name: 'Name',
        email: 'email@email.com',
        password: '123456',
      );
      when(() => localDatasource.saveUser(user)).thenAnswer(
        (invocation) async => true,
      );
      when(() => remoteDatasource.signIn(
          email: 'email@email.com', password: '123456')).thenThrow(
        Exception('Message'),
      );

      final result = await repository.signIn(user);
      expect(result.isSuccess, false);
      expect(result.error, Failure('Unknown error', module: 'user'));
      verify(
        () => remoteDatasource.signIn(
          email: 'email@email.com',
          password: '123456',
        ),
      ).called(1);
      verifyNever(() => localDatasource.saveUser(user));
    });

    test('should return failure when datasource throws unknown error',
        () async {
      const user = UserEntity(
        name: 'Name',
        email: 'email@email.com',
        password: '123456',
      );
      when(() => localDatasource.saveUser(user)).thenAnswer(
        (invocation) async => true,
      );
      when(() => remoteDatasource.signIn(
          email: 'email@email.com', password: '123456')).thenThrow(
        1233,
      );

      final result = await repository.signIn(user);
      expect(result.isSuccess, false);
      expect(result.error, Failure('Unknown error', module: 'user'));
      verify(
        () => remoteDatasource.signIn(
          email: 'email@email.com',
          password: '123456',
        ),
      ).called(1);
      verifyNever(() => localDatasource.saveUser(user));
    });
  });

  group('Sign up', () {
    test('should return success when datasource returns success', () async {
      const user = UserEntity(
        name: 'Name',
        email: 'email@email.com',
        password: '123456',
      );
      when(() => localDatasource.saveUser(user)).thenAnswer(
        (invocation) async => true,
      );
      when(() => remoteDatasource.signUp(
          name: 'Name',
          email: 'email@email.com',
          password: '123456')).thenAnswer(
        (invocation) async => user,
      );

      final result = await repository.signUp(user);
      expect(result.isSuccess, true);
      expect(result.data, true);
      verify(() => localDatasource.saveUser(user)).called(1);
      verify(
        () => remoteDatasource.signUp(
          name: 'Name',
          email: 'email@email.com',
          password: '123456',
        ),
      ).called(1);
    });

    test('should return failure when datasource throws an AppException',
        () async {
      const user = UserEntity(
        name: 'Name',
        email: 'email@email.com',
        password: '123456',
      );
      when(() => localDatasource.saveUser(user)).thenAnswer(
        (invocation) async => true,
      );
      when(() => remoteDatasource.signUp(
          name: 'Name',
          email: 'email@email.com',
          password: '123456')).thenThrow(
        AppException(message: 'Message'),
      );

      final result = await repository.signUp(user);
      expect(result.isSuccess, false);
      expect(result.error, Failure('Message', module: 'user'));
      verify(
        () => remoteDatasource.signUp(
          name: 'Name',
          email: 'email@email.com',
          password: '123456',
        ),
      ).called(1);
      verifyNever(() => localDatasource.saveUser(user));
    });

    test('should return failure when datasource throws an Exception', () async {
      const user = UserEntity(
        name: 'Name',
        email: 'email@email.com',
        password: '123456',
      );
      when(() => localDatasource.saveUser(user)).thenAnswer(
        (invocation) async => true,
      );
      when(() => remoteDatasource.signUp(
          name: 'Name',
          email: 'email@email.com',
          password: '123456')).thenThrow(
        Exception('Message'),
      );

      final result = await repository.signUp(user);
      expect(result.isSuccess, false);
      expect(result.error, Failure('Unknown error', module: 'user'));
      verify(
        () => remoteDatasource.signUp(
          name: 'Name',
          email: 'email@email.com',
          password: '123456',
        ),
      ).called(1);
      verifyNever(() => localDatasource.saveUser(user));
    });

    test('should return failure when datasource throws unknown error',
        () async {
      const user = UserEntity(
        name: 'Name',
        email: 'email@email.com',
        password: '123456',
      );
      when(() => localDatasource.saveUser(user)).thenAnswer(
        (invocation) async => true,
      );
      when(() => remoteDatasource.signUp(
          name: 'Name',
          email: 'email@email.com',
          password: '123456')).thenThrow(
        1233,
      );

      final result = await repository.signUp(user);
      expect(result.isSuccess, false);
      expect(result.error, Failure('Unknown error', module: 'user'));
      verify(
        () => remoteDatasource.signUp(
          name: 'Name',
          email: 'email@email.com',
          password: '123456',
        ),
      ).called(1);
      verifyNever(() => localDatasource.saveUser(user));
    });
  });

  group('Sign out', () {
    test('should return success when datasource returns success', () async {
      when(() => localDatasource.deleteUser()).thenAnswer(
        (invocation) async => true,
      );

      final result = await repository.signOut();
      expect(result.isSuccess, true);
      expect(result.data, true);
      verify(() => localDatasource.deleteUser()).called(1);
    });

    test('should return failure when datasource throws an AppException',
        () async {
      when(() => localDatasource.deleteUser()).thenThrow(
        AppException(message: 'Message'),
      );

      final result = await repository.signOut();
      expect(result.isSuccess, false);
      expect(result.error, Failure('Message', module: 'user'));
      verify(() => localDatasource.deleteUser()).called(1);
    });

    test('should return failure when datasource throws an Exception', () async {
      when(() => localDatasource.deleteUser()).thenThrow(
        Exception('Message'),
      );

      final result = await repository.signOut();
      expect(result.isSuccess, false);
      expect(result.error, Failure('Unknown error', module: 'user'));
      verify(() => localDatasource.deleteUser()).called(1);
    });

    test('should return failure when datasource throws unknown error',
        () async {
      when(() => localDatasource.deleteUser()).thenThrow('dmqimio123');

      final result = await repository.signOut();
      expect(result.isSuccess, false);
      expect(result.error, Failure('Unknown error', module: 'user'));
      verify(() => localDatasource.deleteUser()).called(1);
    });
  });

  group('Sign out', () {
    test('should return success when datasource returns success', () async {
      when(() => localDatasource.deleteUser()).thenAnswer(
        (invocation) async => true,
      );

      final result = await repository.signOut();
      expect(result.isSuccess, true);
      expect(result.data, true);
      verify(() => localDatasource.deleteUser()).called(1);
    });

    test('should return failure when datasource throws an AppException',
        () async {
      when(() => localDatasource.deleteUser()).thenThrow(
        AppException(message: 'Message'),
      );

      final result = await repository.signOut();
      expect(result.isSuccess, false);
      expect(result.error, Failure('Message', module: 'user'));
      verify(() => localDatasource.deleteUser()).called(1);
    });

    test('should return failure when datasource throws an Exception', () async {
      when(() => localDatasource.deleteUser()).thenThrow(
        Exception('Message'),
      );

      final result = await repository.signOut();
      expect(result.isSuccess, false);
      expect(result.error, Failure('Unknown error', module: 'user'));
      verify(() => localDatasource.deleteUser()).called(1);
    });

    test('should return failure when datasource throws unknown error',
        () async {
      when(() => localDatasource.deleteUser()).thenThrow('dmqimio123');

      final result = await repository.signOut();
      expect(result.isSuccess, false);
      expect(result.error, Failure('Unknown error', module: 'user'));
      verify(() => localDatasource.deleteUser()).called(1);
    });
  });

  group('Get user', () {
    test('should return success when datasource returns success', () async {
      const user = UserEntity(
        name: 'Name',
        email: 'email@email.com',
        password: '123456',
      );
      when(() => localDatasource.getUser()).thenAnswer(
        (invocation) async => user,
      );

      final result = await repository.getUser();
      expect(result.isSuccess, true);
      expect(result.data, user);
      verify(() => localDatasource.getUser()).called(1);
    });

    test('should return failure when datasource throws an AppException',
        () async {
      when(() => localDatasource.getUser()).thenThrow(
        AppException(message: 'Message'),
      );

      final result = await repository.getUser();
      expect(result.isSuccess, false);
      expect(result.error, Failure('Message', module: 'user'));
      verify(() => localDatasource.getUser()).called(1);
    });

    test('should return failure when datasource throws an Exception', () async {
      when(() => localDatasource.getUser()).thenThrow(
        Exception('Message'),
      );

      final result = await repository.getUser();
      expect(result.isSuccess, false);
      expect(result.error, Failure('Unknown error', module: 'user'));
      verify(() => localDatasource.getUser()).called(1);
    });

    test('should return failure when datasource throws unknown error',
        () async {
      when(() => localDatasource.getUser()).thenThrow('dmqimio123');

      final result = await repository.getUser();
      expect(result.isSuccess, false);
      expect(result.error, Failure('Unknown error', module: 'user'));
      verify(() => localDatasource.getUser()).called(1);
    });
  });
}
