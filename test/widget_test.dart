import 'package:demo_kino/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('shows the Demo Kino splash screen', (tester) async {
    await tester.pumpWidget(const DemoKinoApp());

    expect(find.text('Demo Kino'), findsOneWidget);
    expect(
      find.text('Cinema, curated for late-night discovery.'),
      findsOneWidget,
    );

    await tester.pump(const Duration(seconds: 2));
    await tester.pumpAndSettle();
    expect(find.text('Welcome back'), findsOneWidget);
  });
}
