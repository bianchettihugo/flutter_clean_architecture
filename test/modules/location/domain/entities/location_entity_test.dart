import 'package:flutter_clean_architecture/modules/location/domain/entities/location_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('should check location entity equality', () async {
    final location1 = LocationEntity(latitude: 10, longitude: 10);
    final location2 = LocationEntity(latitude: 10, longitude: 10);

    expect(location1, location2);
    expect(location1.hashCode, location2.hashCode);
  });
}
