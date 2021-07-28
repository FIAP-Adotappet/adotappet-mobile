import 'package:adotappet/utils/helpers/date_helper.dart';

import 'endereco.dart';

class Usuario {
  int? id;
  final String? nomeCompleto;
  final String? email;
  final String? senha;
  final DateTime? dataNascimento;
  final String? cpf;
  final String? telefone;
  final Endereco? endereco;

  Usuario(
      {this.id, required this.nomeCompleto, required this.email, this.senha, this.dataNascimento, required this.cpf, required this.telefone, required this.endereco});

  static Usuario fromJson(Map json) {
    return Usuario(
        id: json['id'],
        nomeCompleto: json['nomeCompleto'],
        email: json['email'],
        senha: json['senha'],
        dataNascimento: json['dataNascimento'],
        cpf: json['cpf'],
        telefone: json['telefone'],
        endereco: json['endereco'] != null ? Endereco.fromJson(json['endereco']): null);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nomeCompleto': nomeCompleto,
      'email': email,
      'senha': senha,
      'dataNascimento': dataNascimento == null ? null : DateHelper.parseDateTimeToString(dataNascimento!, DateHelper.default_pattern),
      'cpf': cpf,
      'telefone': telefone,
      'endereco': endereco == null ? null : endereco!.toJson()
    };
  }
}