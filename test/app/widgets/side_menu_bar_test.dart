import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:adotappet/widgets/side_menu_bar.dart';

void main() {
  testWidgets('SideMenuBar', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: SideMenuBar())));

    // Container() widget
    final Finder containerFinder = find.byType(Container);
    expect(containerFinder, findsWidgets);
  });

  testWidgets('Login', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: LoginArea(emailController: TextEditingController(), onLogin: () {}, senhaController: TextEditingController(),))));

    // Column() widget
    final Finder columnFinder = find.byType(Column);
    expect(columnFinder, findsWidgets);

    // ElevatedButton() widget
    final Finder buttonFinder = find.byType(ElevatedButton);
    expect(buttonFinder, findsOneWidget);

    // Texts
    expect(find.text('Fazer login'), findsOneWidget);
    expect(find.text('Faça login com usuário e senha:'), findsOneWidget);
  });

  testWidgets('Perfil', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: PerfilArea(onLogoff: () {}, emailUsuario: '', nomeUsuario: 'Nome do usuário',))));

    // Column() widget
    final Finder columnFinder = find.byType(Column);
    expect(columnFinder, findsWidgets);

    // ElevatedButton() widget
    final Finder buttonFinder = find.byType(ElevatedButton);
    expect(buttonFinder, findsOneWidget);

    // Texts
    expect(find.text('Nome do usuário'), findsOneWidget);
  });
}
