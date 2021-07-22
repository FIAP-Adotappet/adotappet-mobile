import 'package:flutter/material.dart';

class SideMenuBar extends StatelessWidget {
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
                // Login
                Container(
                  margin: const EdgeInsets.only(top: 60.0),
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
                            child: Image.asset(
                                'assets/images/avatar_deslogado.png'),
                          ),
                        ),
                      ),
                      SizedBox(height: 5),

                      // Info text
                      Text(
                        'Fazer login',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 60),

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
                          SizedBox(height: 15),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 70, vertical: 0),
                            ),
                            onPressed: () {
                              // Validate will return true if the form is valid, or false if
                              // the form is invalid.
                            },
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
                  ),
                )
              ])),
        ),
      ),
    );
  }
}
