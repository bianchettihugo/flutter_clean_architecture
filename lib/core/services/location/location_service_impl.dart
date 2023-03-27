import 'package:flutter_clean_architecture/core/services/location/geolocator_handler.dart';
import 'package:flutter_clean_architecture/core/services/location/location.dart';
import 'package:flutter_clean_architecture/core/services/location/location_service.dart';
import 'package:flutter_clean_architecture/core/utils/exception.dart';
import 'package:geolocator/geolocator.dart';

class LocationServiceImpl extends LocationService {
  final GeolocatorHandler _geolocator;

  LocationServiceImpl({GeolocatorHandler? geolocator})
      : _geolocator = geolocator ?? GeolocatorHandler();

  @override
  Future<Location> fetchLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await _geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw PermissionException();
    }

    permission = await _geolocator.checkPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      throw PermissionException();
    }

    final result = await _geolocator.getCurrentPosition();
    return Location(result.latitude, result.longitude);
  }
}
