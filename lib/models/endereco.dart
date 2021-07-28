class Endereco {
  final String? logradouro;
  final int? numero;
  final String? complemento;
  final String? bairro;
  final String? cidade;
  final String? estado;
  final String? tipoResidencia;
  final int? cep;

  Endereco(
      {required this.logradouro, required this.numero, required this.complemento, required this.bairro, required this.cidade, required this.estado, required this.tipoResidencia, required this.cep});

  static Endereco fromJson(Map json) {
    return Endereco(
        logradouro: json['logradouro'],
        numero: json['numero'],
        complemento: json['complemento'],
        bairro: json['bairro'],
        cidade: json['cidade'],
        estado: json['estado'],
        tipoResidencia: json['tipoResidencia'],
        cep: json['cep']);
  }

  Map<String, dynamic> toJson() => {
    'logradouro': logradouro,
    'numero': numero?.toString(),
    'complemento': complemento,
    'bairro': bairro,
    'cidade': cidade,
    'estado': estado,
    'tipoResidencia': tipoResidencia,
    'cep': cep?.toString()
  };
}