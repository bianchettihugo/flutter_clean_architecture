import 'package:permission_handler/permission_handler.dart';
import 'package:permission_handler/permission_handler.dart'
    as permission_handler show openAppSettings;

class PermissionHandler {
  Future<PermissionStatus> status(Permission permission) {
    return permission.status;
  }

  Future<bool> openAppSettings() {
    return permission_handler.openAppSettings();
  }

  Future<PermissionStatus> request(Permission permission) {
    return permission.request();
  }
}
