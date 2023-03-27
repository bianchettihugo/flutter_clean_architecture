import 'package:flutter_clean_architecture/modules/location/data/models/location_model.dart';
import 'package:flutter_clean_architecture/modules/location/domain/entities/location_entity.dart';

class LocationMapper {
  static LocationEntity toEntity(LocationModel model) {
    return LocationEntity(
      latitude: model.latitude,
      longitude: model.longitude,
    );
  }

  static LocationModel toModel(LocationEntity entity) {
    return LocationModel(
      latitude: entity.latitude,
      longitude: entity.longitude,
    );
  }
}
