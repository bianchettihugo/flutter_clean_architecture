import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_clean_architecture/core/widgets/input/input.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../utils/test_utils.dart';

void main() {
  testWidgets(
    'should display a text field with placeholder',
    (tester) async {
      await tester.pumpWidgetWithApp(const Input(placeholder: 'Field'));

      expect(find.byType(TextFormField), findsOneWidget);
      expect(find.text('Field'), findsOneWidget);
    },
  );

  testWidgets(
    'should display a text field with initial value',
    (tester) async {
      await tester.pumpWidgetWithApp(
        const Input(
          placeholder: 'Field',
          initialValue: 'Value',
        ),
      );

      expect(find.byType(TextFormField), findsOneWidget);
      expect(find.text('Value'), findsOneWidget);
    },
  );

  testWidgets(
    'should be able to enter text on text field',
    (tester) async {
      await tester.pumpWidgetWithApp(const Input(placeholder: 'Field'));

      await tester.enterText(find.byType(TextFormField), 'Text');
      expect(find.text('Text'), findsOneWidget);
    },
  );

  testWidgets(
    'should be able to enter text on text field with formatters',
    (tester) async {
      await tester.pumpWidgetWithApp(
        Input(
          placeholder: 'Field',
          formatters: [
            FilteringTextInputFormatter(
              RegExp(r'[a-zA-Z]'),
              allow: false,
            ),
          ],
        ),
      );

      await tester.enterText(find.byType(TextFormField), '12bba311331');
      expect(find.text('12311331'), findsOneWidget);
      expect(find.text('12bba311331'), findsNothing);
    },
  );

  testWidgets(
    'should execute onSaved on requested',
    (tester) async {
      final formKey = GlobalKey<FormState>();
      int test = 0;
      await tester.pumpWidgetWithApp(
        Form(
          key: formKey,
          child: Input(
            placeholder: 'Field',
            onSaved: (s) {
              test++;
            },
          ),
        ),
      );

      formKey.currentState?.save();
      expect(test, 1);
    },
  );

  testWidgets(
    'should display error text when empty',
    (tester) async {
      final formKey = GlobalKey<FormState>();
      await tester.pumpWidgetWithApp(
        Form(
          key: formKey,
          child: const Input(
            placeholder: 'Field',
            emptyErrorText: 'Error',
          ),
        ),
      );

      expect(find.text('Error'), findsNothing);
      formKey.currentState?.validate();
      await tester.pump();
      expect(find.text('Error'), findsOneWidget);
    },
  );

  testWidgets(
    'should show error when text doesn\'t match with regex',
    (tester) async {
      final formKey = GlobalKey<FormState>();
      final form = Form(
        key: formKey,
        child: Input(
          regExp: RegExp(
            r'^(0?[1-9]|1[012])[\/\-]\d{4}$',
          ),
          placeholder: 'Field',
          regexErrorText: 'Error',
        ),
      );

      await tester.pumpWidgetWithApp(form);

      await tester.enterText(find.byType(TextFormField), '12/29');
      expect(find.text('12/29'), findsOneWidget);
      formKey.currentState?.validate();
      await tester.pump();
      expect(find.text('Error'), findsOneWidget);
    },
  );

  testWidgets(
    'should use custom validator method when provided',
    (tester) async {
      final formKey = GlobalKey<FormState>();
      await tester.pumpWidgetWithApp(
        Form(
          key: formKey,
          child: Input(
            placeholder: 'Field',
            validator: (str) => str == 'test' ? null : 'Custom Error',
          ),
        ),
      );

      expect(find.text('Custom Error'), findsNothing);
      await tester.enterText(find.byType(TextFormField), '123');
      formKey.currentState?.validate();
      await tester.pump();
      expect(find.text('Custom Error'), findsOneWidget);
    },
  );

  testWidgets(
    'should not show errors when text is valid',
    (tester) async {
      final formKey = GlobalKey<FormState>();
      final form = Form(
        key: formKey,
        child: Input(
          regExp: RegExp(
            r'^(0?[1-9]|1[012])[\/\-]\d{4}$',
          ),
          placeholder: 'Field',
          regexErrorText: 'Error',
          emptyErrorText: 'Empty',
        ),
      );

      await tester.pumpWidgetWithApp(form);

      await tester.enterText(find.byType(TextFormField), '12/2029');
      expect(find.text('12/2029'), findsOneWidget);
      formKey.currentState?.validate();
      await tester.pump();
      expect(find.text('Error'), findsNothing);
      expect(find.text('Empty'), findsNothing);
    },
  );

  testWidgets(
    'should display correct visibility icon',
    (tester) async {
      await tester.pumpWidgetWithApp(
        const Input(
          placeholder: 'Field',
          emptyErrorText: 'Empty',
          obscure: true,
        ),
      );

      final visibilityIcon = find.byIcon(Icons.visibility);
      expect(visibilityIcon, findsOneWidget);

      await tester.tap(visibilityIcon);
      await tester.pump();

      expect(find.byIcon(Icons.visibility_off), findsOneWidget);
      expect(find.byIcon(Icons.visibility), findsNothing);
    },
  );
}
