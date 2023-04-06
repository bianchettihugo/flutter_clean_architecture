import 'package:flutter_clean_architecture/core/services/permissions/permission_handler.dart';
import 'package:flutter_clean_architecture/core/services/permissions/permission_service.dart';
import 'package:flutter_clean_architecture/core/services/permissions/permission_service_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../utils/mocks.dart';

void main() {
  late PermissionHandler mockPermissionHandler;
  late PermissionService permissionService;

  setUpAll(() {
    mockPermissionHandler = MockPermissionHandler();
    permissionService = PermissionServiceImpl(
      permissionHandler: mockPermissionHandler,
    );
  });

  test('should create a default PermissionService', () {
    PermissionServiceImpl();
  });

  test('should return true when location permission is granted', () async {
    when(() => mockPermissionHandler.request(Permission.location)).thenAnswer(
      (invocation) async => PermissionStatus.granted,
    );

    expect(await permissionService.checkLocationPermission(), true);
  });

  test('should return true when location permission is limited', () async {
    when(() => mockPermissionHandler.request(Permission.location)).thenAnswer(
      (invocation) async => PermissionStatus.limited,
    );

    expect(await permissionService.checkLocationPermission(), true);
  });

  test('should return false when location permission is denied', () async {
    when(() => mockPermissionHandler.request(Permission.location)).thenAnswer(
      (invocation) async => PermissionStatus.denied,
    );

    expect(await permissionService.checkLocationPermission(), false);
  });

  test('should return false when location permission is permanently denied',
      () async {
    when(() => mockPermissionHandler.openAppSettings()).thenAnswer(
      (invocation) async => true,
    );

    when(() => mockPermissionHandler.request(Permission.location)).thenAnswer(
      (invocation) async => PermissionStatus.permanentlyDenied,
    );

    expect(await permissionService.checkLocationPermission(), false);
    verify(() => mockPermissionHandler.openAppSettings()).called(1);
  });
}
