import 'package:flutter_clean_architecture/core/utils/result.dart';
import 'package:flutter_clean_architecture/modules/location/domain/repositories/location_repository.dart';
import 'package:flutter_clean_architecture/modules/location/domain/usecases/fetch_location_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../utils/data.dart';
import '../../../../utils/mocks.dart';

void main() {
  late LocationRepository locationRepository;
  late FetchLocationUsecase fetchLocation;

  setUpAll(() {
    locationRepository = MockLocationRepository();
    fetchLocation = FetchLocationUsecaseImpl(repository: locationRepository);
  });

  test('should return a LocationEntity', () async {
    when(() => locationRepository.fetchLocation()).thenAnswer(
      (invocation) async => Result.success(locationEnity),
    );

    final result = await fetchLocation();
    expect(result, Result.success(locationEnity));
  });
}
