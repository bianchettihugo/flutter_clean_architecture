import 'package:flutter_clean_architecture/modules/location/data/models/location_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('should check location model equality', () async {
    const location1 = LocationModel(
      latitude: 10,
      longitude: 10,
    );

    const location2 = LocationModel(
      latitude: 10,
      longitude: 10,
    );

    expect(location1, location2);
    expect(location1.hashCode == location2.hashCode, true);
  });

  test('should convert location model to JSON', () async {
    const location1 = LocationModel(
      latitude: 10,
      longitude: 10,
    );

    expect(
      location1.toJson(),
      '{"latitude":10.0,"longitude":10.0}',
    );
  });

  test('should convert location model from JSON', () async {
    const location1 = LocationModel(
      latitude: 10,
      longitude: 10,
    );

    expect(
      LocationModel.fromJson('{"latitude":10.0,"longitude":10.0}'),
      location1,
    );
  });

  test('should convert location model from JSON even with missing values',
      () async {
    const location1 = LocationModel(
      latitude: 0,
      longitude: 0,
    );

    expect(
      LocationModel.fromJson('{}'),
      location1,
    );
  });
}
