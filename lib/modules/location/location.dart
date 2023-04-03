import 'package:flutter_clean_architecture/core/services/dependency/dependency_service.dart';
import 'package:flutter_clean_architecture/core/services/location/location_service.dart';
import 'package:flutter_clean_architecture/core/services/permissions/permission_service.dart';
import 'package:flutter_clean_architecture/modules/location/data/datasources/service_location_datasource.dart';
import 'package:flutter_clean_architecture/modules/location/data/datasources/service_location_datasource_impl.dart';
import 'package:flutter_clean_architecture/modules/location/data/repositories/location_repository_impl.dart';
import 'package:flutter_clean_architecture/modules/location/domain/repositories/location_repository.dart';
import 'package:flutter_clean_architecture/modules/location/domain/usecases/fetch_location_usecase.dart';

class LocationModule {
  static void init() {
    Dependency.register<ServiceLocationDatasource>(
      ServiceLocationDatasourceImpl(
        locationService: Dependency.get<LocationService>(),
        permissionService: Dependency.get<PermissionService>(),
      ),
    );

    Dependency.register<LocationRepository>(
      LocationRepositoryImpl(
        locationDatasource: Dependency.get<ServiceLocationDatasource>(),
      ),
    );

    Dependency.register<FetchLocationUsecase>(
      FetchLocationUsecaseImpl(
        repository: Dependency.get<LocationRepository>(),
      ),
    );
  }
}
