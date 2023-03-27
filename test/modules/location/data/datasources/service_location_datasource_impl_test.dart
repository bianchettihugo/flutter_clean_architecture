import 'package:flutter_clean_architecture/core/services/location/location.dart';
import 'package:flutter_clean_architecture/core/services/location/location_service.dart';
import 'package:flutter_clean_architecture/modules/location/data/datasources/service_location_datasource.dart';
import 'package:flutter_clean_architecture/modules/location/data/datasources/service_location_datasource_impl.dart';
import 'package:flutter_clean_architecture/modules/location/data/models/location_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../utils/mocks.dart';

void main() {
  late LocationService locationService;
  late ServiceLocationDatasource datasource;

  setUpAll(() {
    locationService = MockLocationService();
    datasource = ServiceLocationDatasourceImpl(
      locationService: locationService,
    );
  });

  test('should return result from location service', () async {
    when(() => locationService.fetchLocation()).thenAnswer(
      (invocation) async => Location(10, 10),
    );

    final result = await datasource.fetchLocation();
    expect(result, const LocationModel(latitude: 10, longitude: 10));
  });
}
