import 'package:flutter_clean_architecture/core/utils/exception.dart';
import 'package:flutter_clean_architecture/core/utils/failure.dart';
import 'package:flutter_clean_architecture/modules/user/data/datasources/user_local_datasource.dart';
import 'package:flutter_clean_architecture/modules/user/data/datasources/user_remote_datasource.dart';
import 'package:flutter_clean_architecture/modules/user/domain/entities/user_entity.dart';
import 'package:flutter_clean_architecture/core/utils/result.dart';
import 'package:flutter_clean_architecture/modules/user/domain/repositories/user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  final UserRemoteDatasource _remoteDatasource;
  final UserLocalDatasource _localDatasource;

  UserRepositoryImpl({
    required UserRemoteDatasource remoteDatasource,
    required UserLocalDatasource localDatasource,
  })  : _localDatasource = localDatasource,
        _remoteDatasource = remoteDatasource;

  @override
  Future<Result<bool>> signIn(UserEntity user) async {
    try {
      final loggedUser = await _remoteDatasource.signIn(
        email: user.email,
        password: user.password,
      );
      await _localDatasource.saveUser(loggedUser);
      return Result.success(true);
    } on AppException catch (e) {
      return Result.failure(Failure.fromException(e, 'user'));
    } catch (e) {
      return Result.failure(Failure('Unknown error', module: 'user'));
    }
  }

  @override
  Future<Result<bool>> signOut() async {
    try {
      await _localDatasource.deleteUser();
      return Result.success(true);
    } on AppException catch (e) {
      return Result.failure(Failure.fromException(e, 'user'));
    } catch (e) {
      return Result.failure(Failure('Unknown error', module: 'user'));
    }
  }

  @override
  Future<Result<bool>> signUp(UserEntity user) async {
    try {
      final registeredUser = await _remoteDatasource.signUp(
        name: user.name,
        email: user.email,
        password: user.password,
      );
      await _localDatasource.saveUser(registeredUser);
      return Result.success(true);
    } on AppException catch (e) {
      return Result.failure(Failure.fromException(e, 'user'));
    } catch (e) {
      return Result.failure(Failure('Unknown error', module: 'user'));
    }
  }

  @override
  Future<Result<UserEntity>> getUser() async {
    try {
      final user = await _localDatasource.getUser();
      if (user == null) {
        return Result.failure(Failure('No user found', module: 'user'));
      }
      return Result.success(user);
    } on AppException catch (e) {
      return Result.failure(Failure.fromException(e, 'user'));
    } catch (e) {
      return Result.failure(Failure('Unknown error', module: 'user'));
    }
  }
}
