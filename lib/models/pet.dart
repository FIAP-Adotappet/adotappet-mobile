import 'package:adotappet/utils/helpers/date_helper.dart';

class Pet {
  final String nome;
  final String tipo;
  final String raca;
  final String idade;
  final String porte;
  final String sexo;
  final String imagem;
  final String imagemFundo;

  Pet({
    required this.nome,
    required this.tipo,
    required this.raca,
    required this.idade,
    required this.porte,
    required this.sexo,
    required this.imagem,
    required this.imagemFundo,
  });

  static Pet fromJson(Map json) {
    return Pet(
        nome: json['nome'],
        tipo: json['tipo'],
        raca: json['raca'],
        idade: transformarParaIdade(json['dataNascimento']),
        porte: json['porte'],
        sexo: json['sexo'],
        imagem: json['imagem'],
        imagemFundo: definirImagemDeFundo(json['tipo']));
  }

  static String transformarParaIdade(String dataNascimentoString) {
    DateTime dataNascimento =
        DateHelper.parseStringToDateTime(dataNascimentoString, DateHelper.default_pattern);
    int ano = DateHelper.getYearsUntilToday(dataNascimento);
    int mes = DateHelper.getMonthsUntilToday(dataNascimento);
    String textoMes = mes > 1 ? 'Meses' : 'Mês';
    if (ano == 0) {
      return '$mes $textoMes';
    }
    String textoAno = ano > 1 ? 'Anos' : 'Ano';
    return '$ano $textoAno e $mes $textoMes';
  }

  static String definirImagemDeFundo(String tipo) {
    return tipo == "CACHORRO"
        ? "assets/images/bg_cachorro.png"
        : "assets/images/bg_gato.png";
  }
}
