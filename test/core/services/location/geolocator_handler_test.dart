import 'package:flutter_clean_architecture/core/services/location/geolocator_handler.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('should be able to use the geolocator handler', () async {
    TestWidgetsFlutterBinding.ensureInitialized();
    final geolocator = GeolocatorHandler();
    geolocator.checkPermission();
    geolocator.isLocationServiceEnabled();
    geolocator.getCurrentPosition();
  });
}
