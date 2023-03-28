import 'package:flutter_clean_architecture/core/services/location/location_service.dart';
import 'package:flutter_clean_architecture/core/services/permissions/permission_service.dart';
import 'package:flutter_clean_architecture/core/utils/exception.dart';
import 'package:flutter_clean_architecture/modules/location/data/datasources/service_location_datasource.dart';
import 'package:flutter_clean_architecture/modules/location/data/models/location_model.dart';

class ServiceLocationDatasourceImpl extends ServiceLocationDatasource {
  final LocationService _locationService;
  final PermissionService _permissionService;

  ServiceLocationDatasourceImpl(
      {required LocationService locationService,
      required PermissionService permissionService})
      : _locationService = locationService,
        _permissionService = permissionService;

  @override
  Future<LocationModel> fetchLocation() async {
    final checkPermission = await _permissionService.checkLocationPermission();
    if (!checkPermission) {
      throw PermissionException();
    }

    final result = await _locationService.fetchLocation();

    return LocationModel(
      latitude: result.latitude,
      longitude: result.longitude,
    );
  }
}
