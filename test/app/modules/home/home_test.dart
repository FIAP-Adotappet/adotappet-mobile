import 'package:adotappet/modules/home/screens/home_screen.dart';
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

      // find.byType => valida se um tipo de elemento/widget foi construido como filho no widget do teste
      final sideMenuBar = find.byType(SideMenuBar);
      expect(sideMenuBar, findsOneWidget);
      expect(find.byType(UserTransform), findsOneWidget);

      final frase1Text = find.text("Doe seu lar,");
      expect(frase1Text, findsOneWidget);

      final dogText = find.text("Cachorros");
      expect(dogText, findsOneWidget);

      final catText = find.text("Gatos");
      expect(catText, findsOneWidget);

      final frase2Text = find.text("adote um pet.");
      expect(frase2Text, findsOneWidget);

      final frase3Text = find.text("Pets para adoção");
      expect(frase3Text, findsOneWidget);

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
  //constroi pagina com o widget CadastraUser
  await tester.pumpWidget(
    MaterialApp(
      home: HomePage(),
    ),
  );

  //pump(): Reconstrói o widget depois de um determinado período de tempo.
  await tester.pump();
}
