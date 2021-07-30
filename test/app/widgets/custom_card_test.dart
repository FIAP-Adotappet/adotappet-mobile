import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:adotappet/widgets/custom_card.dart';

void main() {
  testWidgets('CustomCard', (WidgetTester tester) async {
    const childWidget = Padding(padding: EdgeInsets.zero);
    const routeName = '/test-example/';

    await tester.pumpWidget(MaterialApp(
        home: Scaffold(
            body: CustomCard(
                child: childWidget, routeName: routeName, arguments: {}))));

    // Check child widget
    expect(find.byWidget(childWidget), findsOneWidget);

    // Card() widget
    final Finder cardFinder = find.byType(Card);
    expect(cardFinder, findsOneWidget);

    // Card props
    final Card c = tester.widget(cardFinder);

    final RoundedRectangleBorder customShape = RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(15),
      ),
    );

    expect(c.shape, customShape);
  });
}
