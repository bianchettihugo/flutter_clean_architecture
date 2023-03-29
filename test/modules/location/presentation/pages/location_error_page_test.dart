import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/core/constants/files.dart';
import 'package:flutter_clean_architecture/core/utils/application.dart';
import 'package:flutter_clean_architecture/core/widgets/button/button.dart';
import 'package:flutter_clean_architecture/modules/location/presentation/pages/location_error_page.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../utils/test_utils.dart';

void main() {
  testWidgets('should draw a LocationPage', (tester) async {
    await tester.pumpWidgetWithApp(LocationErrorPage(onButtonPressed: () {}));

    final image = tester.firstWidget<Image>(find.byType(Image));

    expect((image.image as AssetImage).assetName, Files.weatherError);
    expect(find.byType(Image), findsOneWidget);
    expect(find.byType(Button), findsOneWidget);
    expect(find.text(Application.strings.geolocationError), findsOneWidget);
    expect(find.text(Application.strings.geolocationErrorMsg), findsOneWidget);
    expect(find.text(Application.strings.geolocationErrorBtn), findsOneWidget);
  });

  testWidgets('should call method on button pressed', (tester) async {
    int result = 0;
    await tester.pumpWidgetWithApp(LocationErrorPage(onButtonPressed: () {
      result++;
    }));

    await tester.tap(find.byType(Button));
    await tester.pump();

    expect(result, 1);
  });
}
