import 'package:flutter_clean_architecture/core/services/location/location.dart';

abstract class LocationService {
  Future<Location> fetchLocation();
}
