// ignore_for_file: unused_field

import 'dart:math';

import 'package:flutter_clean_architecture/core/services/location/location_service.dart';
import 'package:flutter_clean_architecture/core/services/permissions/permission_service.dart';
import 'package:flutter_clean_architecture/modules/location/data/datasources/service_location_datasource.dart';
import 'package:flutter_clean_architecture/modules/location/data/models/location_model.dart';

class MockServiceLocationDatasourceImpl extends ServiceLocationDatasource {
  final LocationService _locationService;
  final PermissionService _permissionService;

  MockServiceLocationDatasourceImpl(
      {required LocationService locationService,
      required PermissionService permissionService})
      : _locationService = locationService,
        _permissionService = permissionService;

  @override
  Future<LocationModel> fetchLocation() async {
    final random = Random();
    final randomLat = -90 + random.nextDouble() * 90 * 2;
    final randomLng = -180 + random.nextDouble() * 180 * 2;
    return LocationModel(
      latitude: randomLat,
      longitude: randomLng,
    );
  }
}
