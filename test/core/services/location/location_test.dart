import 'package:flutter_clean_architecture/core/services/location/location.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('should be able to check Location equality', () async {
    final location1 = Location(0, 0);
    final location2 = Location(0, 0);

    expect(location1, location2);
    expect(location1.hashCode, location2.hashCode);
  });
}
