import 'package:flutter_clean_architecture/core/utils/exception.dart';
import 'package:flutter_clean_architecture/core/utils/failure.dart';
import 'package:flutter_clean_architecture/modules/location/data/datasources/service_location_datasource.dart';
import 'package:flutter_clean_architecture/modules/location/data/mappers/location_mapper.dart';
import 'package:flutter_clean_architecture/modules/location/domain/entities/location_entity.dart';
import 'package:flutter_clean_architecture/core/utils/result.dart';
import 'package:flutter_clean_architecture/modules/location/domain/repositories/location_repository.dart';

class LocationRepositoryImpl extends LocationRepository {
  final ServiceLocationDatasource _locationDatasource;

  LocationRepositoryImpl(
      {required ServiceLocationDatasource locationDatasource})
      : _locationDatasource = locationDatasource;

  @override
  Future<Result<LocationEntity>> fetchLocation() async {
    try {
      final result = await _locationDatasource.fetchLocation();

      return Result.success(LocationMapper.toEntity(result));
    } on PermissionException catch (_) {
      return Result.failure(Failure('Permission denied', statusCode: 0));
    } catch (_) {
      return Result.failure(Failure('Permission error', statusCode: -1));
    }
  }
}
