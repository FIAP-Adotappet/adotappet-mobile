import 'package:adotappet/models/usuario.dart';
import 'package:adotappet/repositories/usuario_repository.dart';
import 'package:adotappet/utils/services/usuario_service.dart';

class UsuarioController {
  static final UsuarioController _usuarioController = UsuarioController._internal(ApiUsuarioRepository(ApiUsuarioService()));

  factory UsuarioController() {
    return _usuarioController;
  }

  UsuarioController._internal(this._usuarioRepository);

  final UsuarioRepository _usuarioRepository;

  Usuario? _usuario;

  Usuario? get usuario => _usuario;

  set usuario (value) => this._usuario = value;

  Future<void> login(String email, String senha) async {
    _usuario = await this._usuarioRepository.login(email, senha);
  }

  bool isLogado() {
    return _usuario != null;
  }

  Future<void> update(Usuario usuarioRequest) async {
    usuarioRequest.id = _usuario!.id;
    _usuario = await this._usuarioRepository.update(usuarioRequest);
  }
}