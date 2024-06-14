import 'package:capgemini/main.dart';
import 'package:capgemini/ui/counter/counter_page.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('MyApp', () {
    testWidgets(
      'render CounterPage',
      (widgetTester) async {
        await widgetTester.pumpWidget(const MyApp());
        expect(
          find.byType(CounterPage),
          findsOneWidget,
        );
      },
    );
  });
}
