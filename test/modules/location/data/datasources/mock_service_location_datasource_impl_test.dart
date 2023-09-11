import 'package:flutter_clean_architecture/core/services/location/location_service.dart';
import 'package:flutter_clean_architecture/core/services/permissions/permission_service.dart';

import 'package:flutter_clean_architecture/modules/location/data/datasources/mock_service_location_datasource_impl.dart';
import 'package:flutter_clean_architecture/modules/location/data/datasources/service_location_datasource.dart';

import 'package:flutter_test/flutter_test.dart';

import '../../../../utils/mocks.dart';

void main() {
  late LocationService locationService;
  late PermissionService permissionService;
  late ServiceLocationDatasource datasource;

  setUp(() {
    locationService = MockLocationService();
    permissionService = MockPermissionService();
    datasource = MockServiceLocationDatasourceImpl(
      permissionService: permissionService,
      locationService: locationService,
    );
  });

  test('mock service location datasource test', () async {
    await datasource.fetchLocation();
  });
}
