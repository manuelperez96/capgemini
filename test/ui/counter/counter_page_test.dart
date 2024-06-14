import 'package:capgemini/ui/counter/counter_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../pump_app.dart';

void main() {
  group(
    'CounterPage',
    () {
      group(
        'initial state',
        () {
          testWidgets(
            'initial counter is 3',
            (widgetTester) async {
              await widgetTester.pumpApp(const CounterPage());
              expect(
                find.text('click counter 3'),
                findsOneWidget,
              );
            },
          );
        },
      );

      group('set button', () {
        testWidgets(
          'set counter button is not enabled if TextField has not value',
          (widgetTester) async {
            await widgetTester.pumpApp(const CounterPage());
            final finder = find.byKey(const Key("setButton"));
            final button = widgetTester.widget<ElevatedButton>(finder);
            expect(finder, findsOneWidget);
            expect(button.enabled, isFalse);
          },
        );

        testWidgets(
          'set counter button is active if TextField has value',
          (widgetTester) async {
            await widgetTester.pumpApp(const CounterPage());
            await widgetTester.enterText(find.byType(TextField), '9');
            await widgetTester.pump();

            final finder = find.byKey(const Key("setButton"));
            final button = widgetTester.widget<ElevatedButton>(finder);
            expect(finder, findsOneWidget);
            expect(button.enabled, isTrue);
          },
        );

        testWidgets(
          'tap set counter button update counter value',
          (widgetTester) async {
            await widgetTester.pumpApp(const CounterPage());
            final finder = find.byKey(const Key("setButton"));

            await widgetTester.enterText(find.byType(TextField), '9');
            await widgetTester.pump();
            await widgetTester.tap(finder);
            await widgetTester.pump();

            expect(find.text('click counter 9'), findsOneWidget);
          },
        );
      });

      group('Increment counter button', () {
        testWidgets(
          'increment counter value on pressed',
          (widgetTester) async {
            await widgetTester.pumpApp(const CounterPage());
            expect(
              find.text('click counter 3'),
              findsOneWidget,
            );

            final finder = find.byKey(const Key("incrementButton"));
            await widgetTester.tap(finder);
            await widgetTester.pump();

            expect(find.text('click counter 4'), findsOneWidget);
          },
        );
      });

      group('TextField', () {
        testWidgets(
          'is cleared when set counter button is pressed',
          (widgetTester) async {
            await widgetTester.pumpApp(const CounterPage());
            final emptyTextFieldFinder = find.widgetWithText(TextField, '');
            await widgetTester.enterText(emptyTextFieldFinder, '9');
            final nineTextFieldFinder = find.widgetWithText(TextField, '9');
            expect(nineTextFieldFinder, findsOneWidget);
            expect(emptyTextFieldFinder, findsNothing);
            await widgetTester.pump();
            expect(find.text('9'), findsOneWidget);
            await widgetTester.tap(find.byKey(const Key("setButton")));
            await widgetTester.pump();
            expect(emptyTextFieldFinder, findsOneWidget);
          },
        );
      });
    },
  );
}
