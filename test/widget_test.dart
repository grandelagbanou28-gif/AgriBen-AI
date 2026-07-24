import 'package:flutter_test/flutter_test.dart';
import 'package:agribenia/app.dart';

void main() {
  testWidgets('App renders', (WidgetTester tester) async {
    await tester.pumpWidget(const AgriBenApp());
    expect(find.byType(AgriBenApp), findsOneWidget);
  });
}
