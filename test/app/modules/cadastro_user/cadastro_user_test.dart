import 'package:adotappet/controllers/usuario_controller.dart';
import 'package:adotappet/models/endereco.dart';
import 'package:adotappet/models/usuario.dart';
import 'package:adotappet/modules/cadastro_user/screens/cadastro_user.dart';
import 'package:adotappet/widgets/side_menu_bar.dart';
import 'package:adotappet/widgets/user_transform.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets(
    'Deve apresentar os textos em tela para auxilio nas entradas de informacoes do usuario',
        (WidgetTester tester) async {
      await _criarWidget(tester);

      // find.byType => valida se um tipo de elemento/widget foi construido como filho no widget do teste
      final sideMenuBar = find.byType(SideMenuBar);
      expect(sideMenuBar, findsOneWidget);
      expect(find.byType(UserTransform), findsOneWidget);

      final nomeClieText = find.text("Nome completo");
      expect(nomeClieText, findsOneWidget);

      final emailText = find.text("E-mail");
      expect(emailText, findsOneWidget);

      final telefoneText = find.text("Telefone");
      expect(telefoneText, findsOneWidget);

      final cpfText = find.text("CPF");
      expect(cpfText, findsOneWidget);

      final cepText = find.text("CEP");
      expect(cepText, findsOneWidget);

      final logradouroText = find.text("Logradouro");
      expect(logradouroText, findsOneWidget);

      final numeroText = find.text("Numero");
      expect(numeroText, findsOneWidget);

      final complementoText = find.text("Complemento");
      expect(complementoText, findsOneWidget);

      final bairroText = find.text("Bairro");
      expect(bairroText, findsOneWidget);

      final cidadeText = find.text("Cidade");
      expect(cidadeText, findsOneWidget);

      final tipoResidenciaText = find.text("Tipo residencia");
      expect(tipoResidenciaText, findsOneWidget);

      final descricaoTextArea =
      find.text("Fale um pouco sobre você e porque quer adotar um pet");
      expect(descricaoTextArea, findsOneWidget);
    },
  );

  testWidgets('Deve possuir um formulario para entradas das informacoes',
          (WidgetTester tester) async {
        await _criarWidget(tester);

        // find.byType => valida se um tipo de elemento/widget foi construido como filho no widget do teste
        final form = find.byType(Form);
        expect(form, findsOneWidget);
      });
}

Future<void> _criarWidget(WidgetTester tester) async {
  //constroi pagina com o widget CadastraUser

  UsuarioController usuarioController = UsuarioController();
  Endereco endereco = Endereco(logradouro: "hehe", numero: 111, complemento: "hehe", bairro: "haha", cidade: "Osasco", estado: "SP", tipoResidencia: "gjasgaa", cep: 1234) ;
  usuarioController.usuario = Usuario(nomeCompleto: "caique", email: "haha@", cpf: "4197778861", telefone: "863269032", endereco: endereco);

  await tester.pumpWidget(
    MaterialApp(
      home: CadastroUser(),
    ),
  );

  //pump(): Reconstrói o widget depois de um determinado período de tempo.
  await tester.pump();
}