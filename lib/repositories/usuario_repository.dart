import 'dart:convert';

import 'package:adotappet/models/usuario.dart';
import 'package:adotappet/utils/services/usuario_service.dart';

abstract class UsuarioRepository {
  Future<Usuario?> login(String email, String senha);

  Future<Usuario?> update(Usuario usuario);
}

class ApiUsuarioRepository implements UsuarioRepository {
  final UsuarioService _usuarioService;

  ApiUsuarioRepository(this._usuarioService);

  @override
  Future<Usuario?> login(String email, String senha) async {
    final response = await this._usuarioService.login(email, senha);
    var json = jsonDecode(response.body);
    return Usuario.fromJson(json);
  }

  @override
  Future<Usuario?> update(Usuario usuario) async {
    final response = await this._usuarioService.update(usuario.toJson());
    var json = jsonDecode(response.body);
    return Usuario.fromJson(json);
  }
}
