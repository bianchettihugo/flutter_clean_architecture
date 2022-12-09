import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/core/widgets/application/application.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../utils/test_utils.dart';

void main() {
  testWidgets('should buil an Application widget', (tester) async {
    await tester.pumpWidgetWithApp(const Center());

    expect(find.byType(Application), findsOneWidget);
    expect(Application.sizeConfig != null, true);
  });
}
