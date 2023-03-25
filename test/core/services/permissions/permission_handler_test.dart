import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_clean_architecture/core/services/permissions/permission_handler.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  test('permission handler plugin tests', () async {
    TestWidgetsFlutterBinding.ensureInitialized();
    const MethodChannel('flutter.baseflow.com/permissions/methods')
        .setMockMethodCallHandler((MethodCall methodCall) async {
      if (methodCall.method == "openAppSettings") {
        return true;
      } else if (methodCall.method == "requestPermissions") {
        return <dynamic, dynamic>{
          2: 1,
        };
      } else if (methodCall.method == "checkPermissionStatus") {
        return 0;
      }
    });

    WidgetsFlutterBinding.ensureInitialized();
    final handler = PermissionHandler();
    handler.openAppSettings();
    handler.request(Permission.camera);
    final status = await handler.status(Permission.camera);

    expect(status, PermissionStatus.denied);
  });
}
