import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/core/widgets/button/outlined_button.dart';

import 'package:flutter_test/flutter_test.dart';

import '../../../utils/test_utils.dart';

void main() {
  testWidgets('should render a normal button', (tester) async {
    await tester
        .pumpWidgetWithApp(SecondaryButton(text: 'Click', onTap: () {}));

    expect(find.byType(SecondaryButton), findsOneWidget);
    expect(find.text('Click'), findsOneWidget);
  });

  testWidgets('should render a button with an icon', (tester) async {
    await tester.pumpWidgetWithApp(SecondaryButton(
        text: 'Click', icon: Icons.ac_unit_outlined, onTap: () {}));

    expect(find.byType(SecondaryButton), findsOneWidget);
    expect(find.text('Click'), findsOneWidget);
    expect(
      tester.widget(find.byType(Icon)),
      isA<Icon>().having((t) => t.icon, 'icon', Icons.ac_unit_outlined),
    );
  });

  testWidgets('should perform action on tap', (tester) async {
    int test = 0;
    await tester.pumpWidgetWithApp(SecondaryButton(
        text: 'Click',
        icon: Icons.ac_unit_outlined,
        onTap: () {
          test += 1;
        }));

    await tester.tap(find.text('Click'));

    expect(test, 1);
  });
}
