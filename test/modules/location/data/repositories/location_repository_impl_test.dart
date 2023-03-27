import 'package:flutter_clean_architecture/core/utils/exception.dart';
import 'package:flutter_clean_architecture/core/utils/failure.dart';
import 'package:flutter_clean_architecture/core/utils/result.dart';
import 'package:flutter_clean_architecture/modules/location/data/datasources/service_location_datasource.dart';
import 'package:flutter_clean_architecture/modules/location/data/repositories/location_repository_impl.dart';
import 'package:flutter_clean_architecture/modules/location/domain/repositories/location_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../utils/data.dart';
import '../../../../utils/mocks.dart';

void main() {
  late ServiceLocationDatasource serviceDatasource;
  late LocationRepository locationRepository;

  setUpAll(() {
    serviceDatasource = MockServiceLocationDatasource();
    locationRepository = LocationRepositoryImpl(
      locationDatasource: serviceDatasource,
    );
  });

  test('should return a LocationEntity', () async {
    when(() => serviceDatasource.fetchLocation()).thenAnswer(
      (invocation) async => locationModel,
    );

    final result = await locationRepository.fetchLocation();
    expect(result, Result.success(locationEnity));
    verify(() => serviceDatasource.fetchLocation()).called(1);
  });

  test('should return a failure when permission is denied', () async {
    when(() => serviceDatasource.fetchLocation()).thenThrow(
      PermissionException(),
    );

    final result = await locationRepository.fetchLocation();
    expect(result, Result.failure(Failure('Permission denied', statusCode: 0)));
    verify(() => serviceDatasource.fetchLocation()).called(1);
  });

  test('should return a failure when an exception occurs', () async {
    when(() => serviceDatasource.fetchLocation()).thenThrow(
      Exception(),
    );

    final result = await locationRepository.fetchLocation();
    expect(result, Result.failure(Failure('Permission error', statusCode: -1)));
    verify(() => serviceDatasource.fetchLocation()).called(1);
  });

  test('should return a failure when a flutter error occurs', () async {
    when(() => serviceDatasource.fetchLocation()).thenThrow(
      'error',
    );

    final result = await locationRepository.fetchLocation();
    expect(result, Result.failure(Failure('Permission error', statusCode: -1)));
    verify(() => serviceDatasource.fetchLocation()).called(1);
  });
}
