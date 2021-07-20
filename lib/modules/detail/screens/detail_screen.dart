import 'package:adotappet/globals.dart';
import 'package:adotappet/modules/cadastro_user/screens/cadastro_user.dart';
import 'package:adotappet/modules/home/models/pet_model.dart';
import 'package:adotappet/widgets/custom_app_bar.dart';
import 'package:adotappet/widgets/side_menu_bar.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  final Pet pet;
  DetailPage(this.pet);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final leftSlide =
        MediaQuery.of(context).size.width * (Global.showSideBar ? 0.6 : 0);
    var icon = Image.asset(
      "assets/images/icon_" +
          (widget.pet.sexo == "FEMININO" ? "f" : "m") +
          ".png",
      width: 25,
    );

    return Stack(
      children: [
        SideMenuBar(),

        // Content page
        Transform(
          transform: Matrix4.identity()..translate(-leftSlide),
          alignment: Alignment.center,
          child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [Colors.grey.shade200, Colors.white]),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 0),
                  ),
                ],
              ),
              child: Scaffold(
                appBar: CustomAppBar(isHome: true),
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
                    height: size.height * 0.41,
                    margin: EdgeInsets.only(top: 20.0, left: 25.0, right: 25.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(25.0),
                      child: Image.network(
                        widget.pet.imagem,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  _DetailsPet(pet: widget.pet, size: size),
                  Positioned(
                    bottom: 30,
                    right: 30,
                    left: 30,
                    height: 40,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CadastroUser()),
                        );
                      },
                    ),
                  ),
                  Positioned(
                    right: 30,
                    bottom: size.height * 0.37,
                    child: icon,
                  )
                ]),
              )),
        )
      ],
    );
  }
}

class _DetailsPet extends StatelessWidget {
  final Pet pet;
  final Size size;

  _DetailsPet({required this.pet, required this.size});

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
          height: size.height * 0.44,
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
            margin: EdgeInsets.only(top: 20, left: 40, right: 40),
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
                  height: 20,
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
