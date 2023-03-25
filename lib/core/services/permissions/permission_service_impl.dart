import 'package:flutter_clean_architecture/core/services/permissions/permission_handler.dart';
import 'package:flutter_clean_architecture/core/services/permissions/permission_service.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionServiceImpl extends PermissionService {
  final PermissionHandler _permissionHandler;

  PermissionServiceImpl({PermissionHandler? permissionHandler})
      : _permissionHandler = permissionHandler ?? PermissionHandler();

  @override
  Future<bool> checkLocationPermission() async {
    final status = await _permissionHandler.request(Permission.location);
    switch (status) {
      case PermissionStatus.denied:
        return false;
      case PermissionStatus.granted:
        return true;
      case PermissionStatus.limited:
        return true;
      default:
        _permissionHandler.openAppSettings();
        return false;
    }
  }
}
