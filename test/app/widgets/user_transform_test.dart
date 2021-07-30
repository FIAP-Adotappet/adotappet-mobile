import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:adotappet/widgets/user_transform.dart';

void main() {
  testWidgets('UserTransform', (WidgetTester tester) async {
    const leftSlide = 0.0;
    const childWidget = Padding(padding: EdgeInsets.zero);

    await tester.pumpWidget(UserTransform(leftSlide: 0.0, child: childWidget));

    // Check child widget
    expect(find.byWidget(childWidget), findsOneWidget);

    // Transform() widget
    final Finder transformFinder = find.byType(Transform);
    expect(transformFinder, findsOneWidget);

    // Transform props
    final Transform t = tester.widget(transformFinder);

    expect(t.transform,
        Matrix4.identity()..translate(-leftSlide)); // Check leftSlide value
    expect(t.alignment, Alignment.center); // Check Transform() align

    // Container() widget
    final Finder containerFinder = find.byType(Container);
    expect(containerFinder, findsOneWidget);

    // Container props
    final Container c = tester.widget(containerFinder);

    final BoxDecoration containerBoxDecoration = BoxDecoration(
      gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [Colors.grey.shade200, Colors.white]),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.2),
          spreadRadius: 5,
          blurRadius: 7,
          offset: Offset(0, 0),
        ),
      ],
    );

    expect(c.decoration, containerBoxDecoration);
  });
}
