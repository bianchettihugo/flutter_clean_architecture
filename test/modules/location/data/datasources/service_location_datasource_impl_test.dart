import 'package:flutter_clean_architecture/core/services/location/location.dart';
import 'package:flutter_clean_architecture/core/services/location/location_service.dart';
import 'package:flutter_clean_architecture/core/services/permissions/permission_service.dart';
import 'package:flutter_clean_architecture/core/utils/exception.dart';
import 'package:flutter_clean_architecture/modules/location/data/datasources/service_location_datasource.dart';
import 'package:flutter_clean_architecture/modules/location/data/datasources/service_location_datasource_impl.dart';
import 'package:flutter_clean_architecture/modules/location/data/models/location_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../utils/mocks.dart';

void main() {
  late LocationService locationService;
  late PermissionService permissionService;
  late ServiceLocationDatasource datasource;

  setUp(() {
    locationService = MockLocationService();
    permissionService = MockPermissionService();
    datasource = ServiceLocationDatasourceImpl(
      permissionService: permissionService,
      locationService: locationService,
    );
  });

  test('should return result from location service', () async {
    when(() => permissionService.checkLocationPermission()).thenAnswer(
      (invocation) async => true,
    );
    when(() => locationService.fetchLocation()).thenAnswer(
      (invocation) async => Location(10, 10),
    );

    final result = await datasource.fetchLocation();
    expect(result, const LocationModel(latitude: 10, longitude: 10));
  });

  test('should throw a PermissionException', () async {
    when(() => permissionService.checkLocationPermission()).thenAnswer(
      (invocation) async => false,
    );

    expect(datasource.fetchLocation, throwsA(isA<PermissionException>()));
    verifyNever(() => locationService.fetchLocation());
  });
}
