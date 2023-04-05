import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/core/constants/files.dart';
import 'package:flutter_clean_architecture/modules/weather/presentation/widgets/weather_card.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../utils/test_utils.dart';

void main() {
  testWidgets('should render a WeatherCard widget', (tester) async {
    await tester.pumpWidgetWithApp(WeatherCard(
      iconPath: Files.drops,
      content: '10',
      title: 'Humidade',
    ));

    expect(find.byType(Image), findsOneWidget);
    expect(find.text('10'), findsOneWidget);
    expect(find.text('Humidade'), findsOneWidget);
  });
}
