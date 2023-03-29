import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/core/constants/files.dart';
import 'package:flutter_clean_architecture/core/utils/application.dart';
import 'package:flutter_clean_architecture/core/widgets/button/button.dart';
import 'package:flutter_clean_architecture/modules/weather/presentation/pages/weather_connection_error_page.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../utils/test_utils.dart';

void main() {
  testWidgets('should draw a WeatherErrorPage', (tester) async {
    await tester
        .pumpWidgetWithApp(WeatherConnectionErrorPage(onButtonPressed: () {}));

    final image = tester.firstWidget<Image>(find.byType(Image));

    expect((image.image as AssetImage).assetName, Files.weatherConnection);
    expect(find.byType(Image), findsOneWidget);
    expect(find.byType(Button), findsOneWidget);
    expect(find.text(Application.strings.networkError), findsOneWidget);
    expect(find.text(Application.strings.networkErrorMsg), findsOneWidget);
    expect(find.text(Application.strings.networkErrorBtn), findsOneWidget);
  });

  testWidgets('should call method on button pressed', (tester) async {
    int result = 0;
    await tester
        .pumpWidgetWithApp(WeatherConnectionErrorPage(onButtonPressed: () {
      result++;
    }));

    await tester.tap(find.byType(Button));
    await tester.pump();

    expect(result, 1);
  });
}
