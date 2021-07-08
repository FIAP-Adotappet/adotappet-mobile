import 'package:adotappet/modules/cadastro_user/screens/cadastro_user.dart';
import 'package:adotappet/modules/home/models/pet_model.dart';
import 'package:adotappet/widgets/custom_app_bar.dart';
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
    var icon = Icon(
      widget.pet.sexo == "FEMININO" ? Icons.female : Icons.male,
      color: Colors.orange,
      size: 35,
    );
    return Scaffold(
        appBar: CustomAppBar(),
        body: Stack(children: [
          Container(
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
            bottom: 15,
            right: 30,
            left: 30,
            height: 40,
            child: ElevatedButton(
              style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ))),
              child: Text(
                'TENHO INTERESSE!',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.normal),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CadastroUser()),
                );
              },
            ),
          ),
          Positioned(
            right: 30,
            bottom: size.height * 0.33,
            child: icon,
          )
        ]));
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
          height: size.height * 0.41,
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
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.left,
                ),
                Text(
                  pet.idade,
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "\u2022 Raça: ${pet.raca}\n"
                  "\u2022 Porte: ${pet.porte}\n",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
                ),
                Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
