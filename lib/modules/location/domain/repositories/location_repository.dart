import 'package:flutter_clean_architecture/core/utils/result.dart';
import 'package:flutter_clean_architecture/modules/location/domain/entities/location_entity.dart';

abstract class LocationRepository {
  Future<Result<LocationEntity>> fetchLocation();
}
