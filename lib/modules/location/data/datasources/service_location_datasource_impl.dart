import 'package:flutter_clean_architecture/core/services/location/location_service.dart';
import 'package:flutter_clean_architecture/modules/location/data/datasources/service_location_datasource.dart';
import 'package:flutter_clean_architecture/modules/location/data/models/location_model.dart';

class ServiceLocationDatasourceImpl extends ServiceLocationDatasource {
  final LocationService _locationService;

  ServiceLocationDatasourceImpl({required LocationService locationService})
      : _locationService = locationService;

  @override
  Future<LocationModel> fetchLocation() async {
    final result = await _locationService.fetchLocation();

    return LocationModel(
      latitude: result.latitude,
      longitude: result.longitude,
    );
  }
}
