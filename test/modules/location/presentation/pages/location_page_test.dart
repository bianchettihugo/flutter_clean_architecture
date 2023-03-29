import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/core/constants/files.dart';
import 'package:flutter_clean_architecture/core/utils/application.dart';
import 'package:flutter_clean_architecture/core/widgets/button/button.dart';
import 'package:flutter_clean_architecture/modules/location/presentation/pages/location_page.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../utils/test_utils.dart';

void main() {
  testWidgets('should draw a LocationPage', (tester) async {
    await tester.pumpWidgetWithApp(LocationPage(onButtonPressed: () {}));

    final image = tester.firstWidget<Image>(find.byType(Image));

    expect((image.image as AssetImage).assetName, Files.weatherLocation);
    expect(find.byType(Image), findsOneWidget);
    expect(find.byType(Button), findsOneWidget);
    expect(find.text(Application.strings.enableGeolocation), findsOneWidget);
    expect(find.text(Application.strings.enableGeolocationMsg), findsOneWidget);
    expect(find.text(Application.strings.enableGeolocationBtn), findsOneWidget);
  });

  testWidgets('should call method on button pressed', (tester) async {
    int result = 0;
    await tester.pumpWidgetWithApp(LocationPage(onButtonPressed: () {
      result++;
    }));

    await tester.tap(find.byType(Button));
    await tester.pump();

    expect(result, 1);
  });
}
