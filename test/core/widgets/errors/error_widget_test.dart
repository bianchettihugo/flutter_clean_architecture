import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/core/constants/files.dart';
import 'package:flutter_clean_architecture/core/widgets/button/button.dart';
import 'package:flutter_clean_architecture/core/widgets/errors/error_widget.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../utils/test_utils.dart';

void main() {
  testWidgets('should draw a ErroWidget with type error', (tester) async {
    await tester.pumpWidgetWithApp(WeatherErroWidget(
      buttonText: 'button',
      text: 'text',
      title: 'title',
      type: ErrorWidgetType.error,
      onButtonPressed: () {},
    ));

    final image = tester.firstWidget<Image>(find.byType(Image));

    expect((image.image as AssetImage).assetName, Files.weatherError);
    expect(find.byType(Image), findsOneWidget);
    expect(find.byType(Button), findsOneWidget);
    expect(find.text('title'), findsOneWidget);
    expect(find.text('text'), findsOneWidget);
    expect(find.text('button'), findsOneWidget);
  });

  testWidgets('should draw a ErroWidget with type network', (tester) async {
    await tester.pumpWidgetWithApp(WeatherErroWidget(
      buttonText: 'button',
      text: 'text',
      title: 'title',
      type: ErrorWidgetType.network,
      onButtonPressed: () {},
    ));

    final image = tester.firstWidget<Image>(find.byType(Image));

    expect((image.image as AssetImage).assetName, Files.weatherConnection);
    expect(find.byType(Image), findsOneWidget);
    expect(find.byType(Button), findsOneWidget);
    expect(find.text('title'), findsOneWidget);
    expect(find.text('text'), findsOneWidget);
    expect(find.text('button'), findsOneWidget);
  });

  testWidgets('should draw a ErroWidget with type location', (tester) async {
    await tester.pumpWidgetWithApp(WeatherErroWidget(
      buttonText: 'button',
      text: 'text',
      title: 'title',
      type: ErrorWidgetType.location,
      onButtonPressed: () {},
    ));

    final image = tester.firstWidget<Image>(find.byType(Image));

    expect((image.image as AssetImage).assetName, Files.weatherLocation);
    expect(find.byType(Image), findsOneWidget);
    expect(find.byType(Button), findsOneWidget);
    expect(find.text('title'), findsOneWidget);
    expect(find.text('text'), findsOneWidget);
    expect(find.text('button'), findsOneWidget);
  });

  testWidgets('should call method on button pressed', (tester) async {
    int result = 0;
    await tester.pumpWidgetWithApp(WeatherErroWidget(
      buttonText: 'button',
      text: 'text',
      title: 'title',
      type: ErrorWidgetType.error,
      onButtonPressed: () {
        result++;
      },
    ));

    await tester.tap(find.byType(Button));
    await tester.pump();

    expect(result, 1);
  });
}
