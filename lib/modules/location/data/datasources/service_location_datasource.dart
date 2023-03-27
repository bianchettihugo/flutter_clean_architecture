import 'package:flutter_clean_architecture/modules/location/data/models/location_model.dart';

abstract class ServiceLocationDatasource {
  Future<LocationModel> fetchLocation();
}
