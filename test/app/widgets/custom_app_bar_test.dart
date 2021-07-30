import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:adotappet/widgets/custom_app_bar.dart';
import 'package:adotappet/widgets/adotappet_icon.dart';

void main() {
  testWidgets('Structure', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
        home: Scaffold(
            body: CustomAppBar(
      isHome: true,
      onAvatarClick: () => {},
    ))));

    // AppBar() widget
    final Finder barFinder = find.byType(AppBar);
    expect(barFinder, findsOneWidget);

    // AppBar props
    final AppBar b = tester.widget(barFinder);

    expect(b.elevation, 0);
    expect(b.backgroundColor, Colors.transparent);
    expect(b.automaticallyImplyLeading, false);

    // AdotappetIcon() widget
    final Finder iconFinder = find.byType(AdotappetIcon);
    expect(iconFinder, findsOneWidget);

    // Avatar widgets
    final Finder circleFinder = find.byType(CircleAvatar);
    expect(circleFinder, findsOneWidget);

    final Finder clipFinder = find.byType(ClipOval);
    expect(clipFinder, findsOneWidget);
  });

  testWidgets('Close button', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
        home: Scaffold(
            body: CustomAppBar(
      onAvatarClick: () => {},
    ))));

    // Close button
    final Finder backFinder = find.byType(BackButton);
    expect(backFinder, findsOneWidget);
  });
}
