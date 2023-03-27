import 'package:flutter_clean_architecture/core/services/location/geolocator_handler.dart';
import 'package:flutter_clean_architecture/core/services/location/location.dart';
import 'package:flutter_clean_architecture/core/services/location/location_service.dart';
import 'package:flutter_clean_architecture/core/services/location/location_service_impl.dart';
import 'package:flutter_clean_architecture/core/utils/exception.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mocktail/mocktail.dart';

import '../../../utils/mocks.dart';

void main() {
  late GeolocatorHandler geolocatorHandler;
  late LocationService locationService;

  setUpAll(() {
    geolocatorHandler = MockGeolocatorHandler();
    locationService = LocationServiceImpl(geolocator: geolocatorHandler);
  });

  test(
      'should throw an PermissionException when location service is not enabled',
      () async {
    when(() => geolocatorHandler.isLocationServiceEnabled()).thenAnswer(
      (invocation) async => false,
    );

    expect(
      locationService.fetchLocation,
      throwsA(isA<PermissionException>()),
    );
  });

  test('should throw an PermissionException when location permission is denied',
      () async {
    when(() => geolocatorHandler.isLocationServiceEnabled()).thenAnswer(
      (invocation) async => true,
    );
    when(() => geolocatorHandler.checkPermission()).thenAnswer(
      (invocation) async => LocationPermission.denied,
    );

    expect(
      locationService.fetchLocation,
      throwsA(isA<PermissionException>()),
    );
  });

  test(
      'should throw an PermissionException when location permission is denied forever',
      () async {
    when(() => geolocatorHandler.isLocationServiceEnabled()).thenAnswer(
      (invocation) async => true,
    );
    when(() => geolocatorHandler.checkPermission()).thenAnswer(
      (invocation) async => LocationPermission.deniedForever,
    );

    expect(
      locationService.fetchLocation,
      throwsA(isA<PermissionException>()),
    );
  });

  test('should return the current position', () async {
    when(() => geolocatorHandler.isLocationServiceEnabled()).thenAnswer(
      (invocation) async => true,
    );
    when(() => geolocatorHandler.checkPermission()).thenAnswer(
      (invocation) async => LocationPermission.always,
    );
    when(() => geolocatorHandler.getCurrentPosition()).thenAnswer(
      (invocation) async => Position(
        longitude: 100,
        latitude: 100,
        timestamp: DateTime.now(),
        accuracy: 1,
        altitude: 1,
        heading: 1,
        speed: 1,
        speedAccuracy: 1,
      ),
    );

    final result = await locationService.fetchLocation();

    expect(result, Location(100, 100));
  });
}
