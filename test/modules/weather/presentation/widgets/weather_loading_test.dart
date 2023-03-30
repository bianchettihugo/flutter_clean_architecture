import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/core/constants/files.dart';
import 'package:flutter_clean_architecture/modules/weather/presentation/widgets/weather_loading.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../utils/test_utils.dart';

void main() {
  testWidgets('should render a WeatherLoading', (tester) async {
    await tester.pumpWidgetWithApp(const WeatherLoading());

    final image = tester.firstWidget<Image>(find.byType(Image));

    expect((image.image as AssetImage).assetName, Files.weatherCloud);

    expect(find.byType(WeatherLoading), findsOneWidget);
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });
}
