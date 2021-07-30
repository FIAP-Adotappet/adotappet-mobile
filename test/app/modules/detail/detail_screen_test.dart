import 'package:adotappet/models/pet.dart';
import 'package:adotappet/modules/detail/screens/detail_screen.dart';
import 'package:adotappet/widgets/side_menu_bar.dart';
import 'package:adotappet/widgets/user_transform.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';

void main() {
   testWidgets(
    'Deve apresentar os textos e estruturas conforme layout estipulado',
        (WidgetTester tester) async {

      await _criarWidget(tester);

      // find.byType => valida se um tipo de elemento/widget foi construido como filho no widget do teste
      final sideMenuBar = find.byType(SideMenuBar);
      expect(sideMenuBar, findsOneWidget);
      expect(find.byType(UserTransform), findsOneWidget);

      final frase1Text = find.text("TENHO INTERESSE!");
      expect(frase1Text, findsOneWidget);

      // // tem ao menos uma imagem
      final image = find.byType(Image);
      expect(image, findsWidgets);

      // Verifica se tem dois elevatedButton
      final button = find.byType(ElevatedButton);
      expect(button, findsNWidgets(2));
    },
  );

}

Future<void> _criarWidget(WidgetTester tester) async {
  final petMock = Pet(nome: "Gelin", tipo: "CACHORRO", raca: "Vira-lata", idade: "3 anos", porte: "MEDIO", sexo: "MASCULINO", imagem: "https://i.pinimg.com/originals/6a/0c/14/6a0c145d4b8116c59ec665f3fd45af8f.jpg", imagemFundo: "assets/images/bg_cachorro.png");

  await mockNetworkImagesFor(() => tester.pumpWidget(
    MaterialApp(
      home: DetailPage(petMock),
    ),
  ));

}
