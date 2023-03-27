import 'package:flutter_clean_architecture/core/utils/result.dart';
import 'package:flutter_clean_architecture/modules/location/domain/entities/location_entity.dart';
import 'package:flutter_clean_architecture/modules/location/domain/repositories/location_repository.dart';

abstract class FetchLocationUsecase {
  Future<Result<LocationEntity>> call();
}

class FetchLocationUsecaseImpl extends FetchLocationUsecase {
  final LocationRepository _repository;

  FetchLocationUsecaseImpl({required LocationRepository repository})
      : _repository = repository;

  @override
  Future<Result<LocationEntity>> call() async {
    return await _repository.fetchLocation();
  }
}
