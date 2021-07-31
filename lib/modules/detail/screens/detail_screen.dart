import 'package:adotappet/config/routes/routes.dart';
import 'package:adotappet/controllers/usuario_controller.dart';
import 'package:adotappet/models/pet.dart';
import 'package:adotappet/utils/mixins/mixin.dart';
import 'package:adotappet/widgets/custom_app_bar.dart';
import 'package:adotappet/widgets/side_menu_bar.dart';
import 'package:adotappet/widgets/user_transform.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  final Pet pet;

  DetailPage(this.pet);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> with Login {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    Image icon = Image.asset(
      "assets/images/icon_" +
          (widget.pet.sexo == "FEMININO" ? "f" : "m") +
          ".png",
      width: 25,
    );

    return SafeArea(
      child: Stack(
        children: [
          SideMenuBar(),

          // Content page
          UserTransform(
            leftSlide: leftSlide,
            child: Scaffold(
              appBar: CustomAppBar(
                onAvatarClick: () => this.showHideUser(),
              ),
              extendBody: true,
              backgroundColor: Colors.transparent,
              body: Stack(children: [
                Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [Colors.grey.shade200, Colors.white])),
                  width: size.width,
                  height: size.height * 0.4,
                  margin: EdgeInsets.only(
                      top: 0, left: size.width * 0.05, right: size.width * 0.05),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25.0),
                    child: Image.network(
                      widget.pet.imagem,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                _PetInfo(pet: widget.pet, size: size),
                _InterestButton(context, size),
                _GenderIcon(size, icon),
              ]),
            ),
          )
        ],
      ),
    );
  }
}

class _PetInfo extends StatelessWidget {
  final Pet pet;
  final Size size;

  _PetInfo({required this.pet, required this.size});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Container(
            alignment: Alignment.center,
          ),
        ),
        Container(
          height: size.height * 0.45,
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
              image: AssetImage(pet.imagemFundo),
              fit: BoxFit.contain,
              alignment: Alignment.bottomRight,
              colorFilter: new ColorFilter.mode(
                  Colors.white.withOpacity(0.1), BlendMode.dstATop),
            ),
            borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(
                top: 10, left: size.width * 0.08, right: size.width * 0.08),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  pet.nome,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.left,
                ),
                Text(
                  pet.idade,
                  style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 14,
                      fontWeight: FontWeight.normal),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "\u2022 Raça: ${pet.raca}\n"
                  "\u2022 Porte: ${pet.porte}\n",
                  style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 15,
                      fontWeight: FontWeight.normal),
                ),
                Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                  style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 15,
                      fontWeight: FontWeight.normal),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

_InterestButton(context, Size size) {
  final UsuarioController usuarioController =
      UsuarioController();
  return Positioned(
    bottom: size.height * 0.03,
    right: size.width * 0.08,
    left: size.width * 0.08,
    height: 40,
    child: ElevatedButton(
      style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ))),
      child: Text(
        'TENHO INTERESSE!',
        style: TextStyle(
          color: Colors.white,
          fontSize: 19,
          fontWeight: FontWeight.normal,
          letterSpacing: 3.0,
        ),
      ),
      onPressed: () {
        if (usuarioController.isLogado()) {
          Navigator.of(context).pushNamed(Routes.cadastro);
        } else {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Faça o login'),
                  content: Text('Por favor realize o login primeiro'),
                );
              });
        }
      },
    ),
  );
}

_GenderIcon(Size size, Image icon) {
  return Positioned(
    right: size.width * 0.08,
    bottom: size.height * 0.38,
    child: icon,
  );
}
