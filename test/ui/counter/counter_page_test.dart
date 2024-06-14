import 'package:capgemini/ui/counter/counter_page.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../pump_app.dart';

void main() {
  group(
    'CounterPage',
    () {
      testWidgets(
        'initial counter is 3',
        (widgetTester) async {
          await widgetTester.pumpApp(const CounterPage());
          expect(
            find.text('3'),
            findsOneWidget,
          );
        },
      );
    },
  );
}
