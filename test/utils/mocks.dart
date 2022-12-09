import 'package:dio/dio.dart';
import 'package:flutter_clean_architecture/core/services/storage/secure_storage_service.dart';
import 'package:flutter_clean_architecture/modules/user/data/datasources/user_local_datasource.dart';
import 'package:flutter_clean_architecture/modules/user/data/datasources/user_remote_datasource.dart';
import 'package:flutter_clean_architecture/modules/user/domain/repositories/user_repository.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mocktail/mocktail.dart';

class MockDio extends Mock implements Dio {}

class MockSecureStorage extends Mock implements FlutterSecureStorage {}

class MockSecureStorageService extends Mock implements SecureStorageService {}

class MockUserRepository extends Mock implements UserRepository {}

class MockUserLocalDatasource extends Mock implements UserLocalDatasource {}

class MockUserRemoteDatasource extends Mock implements UserRemoteDatasource {}
