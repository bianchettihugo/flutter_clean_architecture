import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'mocks.dart';

final mockObserver = MockNavigatorObserver();

extension WidgetTesterConfig on WidgetTester {
  Future<void> pumpWidgetWithApp(Widget widget) async {
    registerFallbackValue(
      MaterialPageRoute(builder: (c) => const Center()),
    );
    await pumpWidget(
      MaterialApp(
        navigatorObservers: [mockObserver],
        locale: const Locale('en', 'US'),
        home: Scaffold(body: widget),
      ),
    );
  }
}
