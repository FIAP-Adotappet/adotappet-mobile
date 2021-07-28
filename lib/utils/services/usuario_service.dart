import 'dart:convert';

import 'package:adotappet/constants/api_path.dart';
import 'package:http/http.dart' as http;

abstract class UsuarioService {
  Future<http.Response> login(String email, String senha);

  Future<http.Response> update(Map<String, dynamic> usuario);
}

class ApiUsuarioService implements UsuarioService {
  @override
  Future<http.Response> login(String email, String senha) async {
    var url = Uri.parse('${Api.url_users}/login');
    final response = await http
        .post(
          url,
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode(<String, String>{'email': email, 'senha': senha}),
        )
        .timeout(Duration(minutes: 1));
    if (response.statusCode == 200) {
      return response;
    }
    throw Exception('Failed to login');
  }

  @override
  Future<http.Response> update(Map<String, dynamic> usuario) async {
    var url = Uri.parse('${Api.url_users}/${usuario['id'].toString()}');
    final response = await http
        .post(
          url,
          headers: {'Content-Type': 'application/json'},
          body: json.encode(usuario),
        )
        .timeout(Duration(minutes: 1));
    if (response.statusCode == 200) {
      return response;
    }
    throw Exception('Failed to login');
  }
}
