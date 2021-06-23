import 'package:adotappet/utils/helpers/date_helper.dart';

class Pet {
  final String nome;
  final String tipo;
  final String raca;
  final String idade;
  final String porte;
  final String sexo;
  final String imagem;

  Pet({
    required this.nome,
    required this.tipo,
    required this.raca,
    required this.idade,
    required this.porte,
    required this.sexo,
    required this.imagem,
  });

  static Pet fromJson(Map json) {
    return Pet(nome: json['nome'], tipo: json['tipo'], raca: json['raca'],
        idade: transformarParaIdade(json['dataNascimento']), porte: json['porte'], sexo: json['sexo'], imagem: json['imagem']);
  }

  static String transformarParaIdade(String dataNascimentoString) {
    DateTime dataNascimento = DateHelper.parseStringToDateTime(dataNascimentoString, "yyyy-MM-dd");
    int ano = DateHelper.getYearsUntilToday(dataNascimento);
    int mes = DateHelper.getMonthsUntilToday(dataNascimento);
    String textoMes = mes > 1 ? 'Meses' : 'Mês';
    if (ano == 0) {
      return '$mes $textoMes';
    }
    String textoAno = ano > 1 ? 'Anos' : 'Ano';
    return '$ano $textoAno e $mes $textoMes';
  }
}
