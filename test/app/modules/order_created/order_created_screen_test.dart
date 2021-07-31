import 'package:adotappet/modules/order_created/screens/order_created_screen.dart';
import 'package:adotappet/widgets/custom_app_bar.dart';
import 'package:adotappet/widgets/side_menu_bar.dart';
import 'package:adotappet/widgets/user_transform.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets(
    'Deve apresentar os textos e estruturas conforme layout estipulado',
        (WidgetTester tester) async {
      await _criarWidget(tester);

      // find.byType => valida se um tipo de elemento/widget foi construido
      final sideMenuBar = find.byType(SideMenuBar);
      expect(sideMenuBar, findsOneWidget);
      expect(find.byType(UserTransform), findsOneWidget);

      final frase1Text = find.text("Obrigado!");
      expect(frase1Text, findsOneWidget);

      // tem ao menos uma imagem
      final image = find.byType(Image);
      expect(image, findsWidgets);

      // tem ao menos um CustomAppBar
      final customAppBar = find.byType(CustomAppBar);
      expect(customAppBar, findsWidgets);
    },
  );
}

Future<void> _criarWidget(WidgetTester tester) async {
  //constroi pagina com o widget
  await tester.pumpWidget(
    MaterialApp(
      home: OrderCreatedPage(),
    ),
  );

  //pump(): Reconstroi o widget depois de um determinado período de tempo.
  await tester.pump();
}