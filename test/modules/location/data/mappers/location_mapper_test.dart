import 'package:flutter_clean_architecture/modules/location/data/mappers/location_mapper.dart';
import 'package:flutter_clean_architecture/modules/location/data/models/location_model.dart';
import 'package:flutter_clean_architecture/modules/location/domain/entities/location_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('should convert a model to entity', () async {
    const location1 = LocationModel(
      latitude: 10,
      longitude: 10,
    );

    expect(
        LocationMapper.toEntity(location1),
        LocationEntity(
          latitude: 10,
          longitude: 10,
        ));
  });

  test('should convert a entity to model', () async {
    final location1 = LocationEntity(
      latitude: 10,
      longitude: 10,
    );

    expect(
        LocationMapper.toModel(location1),
        const LocationModel(
          latitude: 10,
          longitude: 10,
        ));
  });
}
