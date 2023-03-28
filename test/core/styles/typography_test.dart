import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/core/styles/typography.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../utils/test_utils.dart';

void main() {
  testWidgets('should render a styled text with displayLarge style',
      (tester) async {
    await tester.pumpWidgetWithApp(StyledText.displayLarge('Text'));

    final text = tester.firstWidget<Text>(find.byType(StyledText));

    expect(text.style!.fontSize, 57);
    expect(text.style!.fontWeight, FontWeight.w400);
  });

  testWidgets('should render a styled text with displayMedium style',
      (tester) async {
    await tester.pumpWidgetWithApp(StyledText.displayMedium('Text'));

    final text = tester.firstWidget<Text>(find.byType(StyledText));

    expect(text.style!.fontSize, 45);
    expect(text.style!.fontWeight, FontWeight.w400);
  });

  testWidgets('should render a styled text with displaySmall style',
      (tester) async {
    await tester.pumpWidgetWithApp(StyledText.displaySmall('Text'));

    final text = tester.firstWidget<Text>(find.byType(StyledText));

    expect(text.style!.fontSize, 36);
    expect(text.style!.fontWeight, FontWeight.w400);
  });

  testWidgets('should render a styled text with headlineLarge style',
      (tester) async {
    await tester.pumpWidgetWithApp(StyledText.headlineLarge('Text'));

    final text = tester.firstWidget<Text>(find.byType(StyledText));

    expect(text.style!.fontSize, 32);
    expect(text.style!.fontWeight, FontWeight.w400);
  });

  testWidgets('should render a styled text with headlineMedium style',
      (tester) async {
    await tester.pumpWidgetWithApp(StyledText.headlineMedium('Text'));

    final text = tester.firstWidget<Text>(find.byType(StyledText));

    expect(text.style!.fontSize, 28);
    expect(text.style!.fontWeight, FontWeight.w400);
  });

  testWidgets('should render a styled text with headlineSmall style',
      (tester) async {
    await tester.pumpWidgetWithApp(StyledText.headlineSmall('Text'));

    final text = tester.firstWidget<Text>(find.byType(StyledText));

    expect(text.style!.fontSize, 24);
    expect(text.style!.fontWeight, FontWeight.w400);
  });

  testWidgets('should render a styled text with titleLarge style',
      (tester) async {
    await tester.pumpWidgetWithApp(StyledText.titleLarge('Text'));

    final text = tester.firstWidget<Text>(find.byType(StyledText));

    expect(text.style!.fontSize, 22);
    expect(text.style!.fontWeight, FontWeight.w700);
  });

  testWidgets('should render a styled text with titleMedium style',
      (tester) async {
    await tester.pumpWidgetWithApp(StyledText.titleMedium('Text'));

    final text = tester.firstWidget<Text>(find.byType(StyledText));

    expect(text.style!.fontSize, 16);
    expect(text.style!.fontWeight, FontWeight.w600);
  });

  testWidgets('should render a styled text with titleSmall style',
      (tester) async {
    await tester.pumpWidgetWithApp(StyledText.titleSmall('Text'));

    final text = tester.firstWidget<Text>(find.byType(StyledText));

    expect(text.style!.fontSize, 14);
    expect(text.style!.fontWeight, FontWeight.w600);
  });

  testWidgets('should render a styled text with labelLarge style',
      (tester) async {
    await tester.pumpWidgetWithApp(StyledText.labelLarge('Text'));

    final text = tester.firstWidget<Text>(find.byType(StyledText));

    expect(text.style!.fontSize, 14);
    expect(text.style!.fontWeight, FontWeight.w700);
  });

  testWidgets('should render a styled text with labelMedium style',
      (tester) async {
    await tester.pumpWidgetWithApp(StyledText.labelMedium('Text'));

    final text = tester.firstWidget<Text>(find.byType(StyledText));

    expect(text.style!.fontSize, 12);
    expect(text.style!.fontWeight, FontWeight.w700);
  });

  testWidgets('should render a styled text with labelSmall style',
      (tester) async {
    await tester.pumpWidgetWithApp(StyledText.labelSmall('Text'));

    final text = tester.firstWidget<Text>(find.byType(StyledText));

    expect(text.style!.fontSize, 11);
    expect(text.style!.fontWeight, FontWeight.w700);
  });

  testWidgets('should render a styled text with bodyLarge style',
      (tester) async {
    await tester.pumpWidgetWithApp(StyledText.bodyLarge('Text'));

    final text = tester.firstWidget<Text>(find.byType(StyledText));

    expect(text.style!.fontSize, 16);
    expect(text.style!.fontWeight, FontWeight.w400);
  });

  testWidgets('should render a styled text with bodyMedium style',
      (tester) async {
    await tester.pumpWidgetWithApp(StyledText.bodyMedium('Text'));

    final text = tester.firstWidget<Text>(find.byType(StyledText));

    expect(text.style!.fontSize, 14);
    expect(text.style!.fontWeight, FontWeight.w400);
  });

  testWidgets('should render a styled text with bodySmall style',
      (tester) async {
    await tester.pumpWidgetWithApp(StyledText.bodySmall('Text'));

    final text = tester.firstWidget<Text>(find.byType(StyledText));

    expect(text.style!.fontSize, 12);
    expect(text.style!.fontWeight, FontWeight.w400);
  });
}
