import 'package:flutter_clean_architecture/modules/user/data/datasources/user_local_datasource.dart';
import 'package:flutter_clean_architecture/modules/user/data/datasources/user_remote_datasource.dart';
import 'package:flutter_clean_architecture/modules/user/domain/repositories/user_repository.dart';
import 'package:mocktail/mocktail.dart';

class MockUserRepository extends Mock implements UserRepository {}

class MockUserLocalDatasource extends Mock implements UserLocalDatasource {}

class MockUserRemoteDatasource extends Mock implements UserRemoteDatasource {}
