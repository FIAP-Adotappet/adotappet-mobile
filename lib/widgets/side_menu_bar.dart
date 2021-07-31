import 'package:adotappet/controllers/usuario_controller.dart';
import 'package:flutter/material.dart';

class SideMenuBar extends StatefulWidget {
  @override
  _SideMenuBarState createState() => _SideMenuBarState();
}

class _SideMenuBarState extends State<SideMenuBar> {
  final UsuarioController _usuarioController = UsuarioController();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final leftSlide = MediaQuery.of(context).size.width * 0.6;

    return Container(
      alignment: Alignment.topRight,
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFFB7E2C),
          image: DecorationImage(
            alignment: Alignment(1, 0),
            colorFilter: new ColorFilter.mode(
                Color(0xFFFB7E2C).withOpacity(0.07), BlendMode.dstATop),
            image: AssetImage("assets/images/gato_1.png"),
            fit: BoxFit.fitHeight,
          ),
        ),
        width: leftSlide,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 0),
              child: Column(children: [
                // Logo
                Container(
                  margin: const EdgeInsets.only(top: 35.0),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/logo_2.png"),
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  height: 70,
                ),

                // User area
                Container(
                  margin: const EdgeInsets.only(top: 40.0),
                  child: Column(
                    children: [
                      // Avatar image
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 60,
                        child: CircleAvatar(
                          backgroundColor: const Color(0xFFFFEC5F),
                          radius: 53,
                          child: ClipOval(
                            child: Image.asset(_usuarioController.isLogado()
                                ? 'assets/images/avatar.png'
                                : 'assets/images/avatar_deslogado.png'),
                          ),
                        ),
                      ),
                      SizedBox(height: 5),

                      _usuarioController.isLogado()
                          ? PerfilArea(
                              onLogoff: () {
                                this.setState(() {
                                  _usuarioController.usuario = null;
                                });
                              },
                              emailUsuario: _usuarioController.usuario == null
                                  ? ''
                                  : _usuarioController.usuario!.email
                                      .toString(),
                              nomeUsuario: _usuarioController.usuario == null
                                  ? ''
                                  : _usuarioController.usuario!.nomeCompleto
                                      .toString(),
                            )
                          : LoginArea(
                              onLogin: () {
                                _usuarioController
                                    .login(_emailController.text,
                                        _senhaController.text)
                                    .whenComplete(() => this.setState(() {}));
                              },
                              senhaController: _senhaController,
                              emailController: _emailController,
                            ),
                    ],
                  ),
                )
              ])),
        ),
      ),
    );
  }
}

class LoginArea extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController senhaController;
  final VoidCallback onLogin;

  const LoginArea(
      {Key? key,
      required this.onLogin,
      required this.emailController,
      required this.senhaController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Info text
        Text(
          'Fazer login',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 15),

        Text(
          'Faça login com usuário e senha:',
          style: TextStyle(
            fontSize: 14,
            color: Colors.white,
          ),
        ),

        Column(
          children: [
            TextFormField(
              controller: emailController,
              style: TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                hintStyle: TextStyle(color: Colors.white),
                hintText: 'Usuário',
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                border: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Preenchimento obrigatório';
                }
                return null;
              },
            ),
            TextFormField(
              controller: senhaController,
              obscureText: true,
              enableSuggestions: false,
              autocorrect: false,
              style: TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                hintStyle: TextStyle(color: Colors.white),
                hintText: 'Senha',
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                border: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Preenchimento obrigatório';
                }
                return null;
              },
            ),
            SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 70, vertical: 0),
              ),
              onPressed: () => onLogin(),
              child: const Text(
                'ENTRAR',
                style: TextStyle(
                    color: const Color(0xFFFB7E2C),
                    fontSize: 13,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        )
      ],
    );
  }
}

class PerfilArea extends StatelessWidget {
  final VoidCallback onLogoff;
  final String nomeUsuario;
  final String emailUsuario;

  const PerfilArea(
      {Key? key,
      required this.onLogoff,
      required this.nomeUsuario,
      required this.emailUsuario})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        // Info text
        Text(
          nomeUsuario,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.white,
          ),
        ),

        Text(
          emailUsuario,
          style: TextStyle(
            fontSize: 14,
            color: Colors.white,
          ),
        ),

        SizedBox(height: size.height * 0.38),

        ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 70, vertical: 0),
          ),
          onPressed: () => onLogoff(),
          child: const Text(
            'SAIR',
            style: TextStyle(
                color: const Color(0xFFFB7E2C),
                fontSize: 13,
                fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
