import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:adotappet/widgets/adotappet_icon.dart';

void main() {
  testWidgets('AdotappetIcon', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: AdotappetIcon())));

    // Container() widget
    final Finder containerFinder = find.byType(Container);
    expect(containerFinder, findsOneWidget);

    // Container props
    final Container c = tester.widget(containerFinder);

    final BoxDecoration containerBoxDecoration = BoxDecoration(
      image: DecorationImage(
        alignment: Alignment(-0.85, 0),
        image: AssetImage("assets/images/logo.png"),
        fit: BoxFit.fitHeight,
      ),
    );

    expect(c.margin, const EdgeInsets.only(top: 10, right: 20, left: 0));
    expect(c.decoration, containerBoxDecoration);
    expect(c.child, null);
  });
}
