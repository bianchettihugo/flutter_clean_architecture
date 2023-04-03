import 'package:flutter_clean_architecture/core/services/dependency/dependency_service.dart';
import 'package:flutter_clean_architecture/core/services/http/http_service.dart';
import 'package:flutter_clean_architecture/core/services/http/http_service_impl.dart';
import 'package:flutter_clean_architecture/core/services/location/location_service.dart';
import 'package:flutter_clean_architecture/core/services/location/location_service_impl.dart';
import 'package:flutter_clean_architecture/core/services/permissions/permission_service.dart';
import 'package:flutter_clean_architecture/core/services/permissions/permission_service_impl.dart';
import 'package:flutter_clean_architecture/core/services/storage/storage_service.dart';
import 'package:flutter_clean_architecture/core/services/storage/storage_service_impl.dart';

class BaseModule {
  static void init() {
    Dependency.register<HttpService>(DioHttpService());
    Dependency.register<StorageService>(StorageServiceImpl());
    Dependency.register<LocationService>(LocationServiceImpl());
    Dependency.register<PermissionService>(PermissionServiceImpl());
  }
}
