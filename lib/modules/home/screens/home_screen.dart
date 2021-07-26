import 'package:adotappet/config/routes/routes.dart';
import 'package:adotappet/globals.dart';
import 'package:adotappet/constants/app_constants.dart';
import 'package:adotappet/modules/detail/screens/detail_screen.dart';
import 'package:adotappet/modules/home/models/pet_model.dart';
import 'package:adotappet/modules/home/repositories/pet_repository.dart';
import 'package:adotappet/utils/mixins/mixin.dart';
import 'package:adotappet/widgets/custom_app_bar.dart';
import 'package:adotappet/widgets/side_menu_bar.dart';
import 'package:adotappet/widgets/custom_card.dart';
import 'package:adotappet/widgets/user_transform.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with Login {
  late Future<List<Pet>> _futurePets;
  PetRepository _petRepository = ApiPetRepository();

  @override
  void initState() {
    super.initState();
    _futurePets = _petRepository.fetchPets();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SideMenuBar(),

        // Content page
        UserTransform(
          leftSlide: leftSlide,
          child: Scaffold(
            appBar: CustomAppBar(
              isHome: true,
              onAvatarClick: () => this.showHideUser(),
            ),
            extendBody: true,
            backgroundColor: Colors.transparent,
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 25),
                _TituloPagina(
                  texto: 'Doe seu lar,',
                  bold: true,
                ),
                _TituloPagina(
                  texto: 'adote um pet.',
                  bold: false,
                ),
                SizedBox(height: 30),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: _CartaoFiltro(
                        pathImagem: 'assets/images/filtro_cachorro.png',
                        textoCartao: 'Cachorros',
                      ),
                    ),
                    _CartaoFiltro(
                      pathImagem: 'assets/images/filtro_gato.png',
                      textoCartao: 'Gatos',
                    )
                  ],
                ),
                _TituloLista(),
                FutureBuilder<List<Pet>>(
                  future: _futurePets,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Expanded(
                        child: ListView.builder(
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              Pet pet = snapshot.data![index];
                              return _CartaoPet(pet: pet);
                            }),
                      );
                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    }
                    return CircularProgressIndicator();
                  },
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class _TituloPagina extends StatelessWidget {
  final String texto;
  final bool bold;

  _TituloPagina({required this.texto, required this.bold});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25),
      child: Text(
        texto,
        style: TextStyle(
          color: Colors.grey[800],
          fontWeight: bold ? FontWeight.bold : FontWeight.normal,
          fontSize: 33,
          height: 1,
        ),
      ),
    );
  }
}

class _CartaoFiltro extends StatelessWidget {
  final String pathImagem;
  final String textoCartao;

  _CartaoFiltro({required this.pathImagem, required this.textoCartao});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      shadowColor: Colors.grey,
      color: AppColors.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: Image(
              image: AssetImage(pathImagem),
              width: 30,
              height: 30,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Text(
              textoCartao,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 13,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TituloLista extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25, right: 0, left: 25, bottom: 10),
      child: Row(
        children: [
          Text(
            'Pets para adoção',
            style: TextStyle(color: Colors.grey[600], fontSize: 20),
          )
        ],
      ),
    );
  }
}

class _CartaoPet extends StatelessWidget {
  final Pet pet;

  _CartaoPet({required this.pet});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomCard(
            routeName: Routes.detail,
            arguments: pet,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  alignment: Alignment(0.95, 0),
                  colorFilter: new ColorFilter.mode(
                      Colors.white.withOpacity(0.1), BlendMode.dstATop),
                  image: AssetImage(pet.imagemFundo),
                  fit: BoxFit.fitHeight,
                ),
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(7),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image(
                        fit: BoxFit.fill,
                        image: NetworkImage(pet.imagem),
                        width: 90,
                        height: 90,
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 2),
                            child: Text(
                              pet.nome,
                              style: TextStyle(
                                color: Colors.grey[800],
                                fontSize: 21,
                                fontWeight: FontWeight.w600,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 2),
                            child: Text(
                              pet.idade,
                              style: TextStyle(
                                  color: Colors.grey[800], fontSize: 12),
                            ),
                          ),
                        ),
                        Expanded(
                          child: SizedBox(
                            height: double.infinity,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            'Lorem ipsum dolor sit amet',
                            style: TextStyle(
                                color: Colors.grey[700], fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 55),
                  Container(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Image.asset(
                        "assets/images/icon_" +
                            (pet.sexo == "FEMININO" ? "f" : "m") +
                            ".png",
                        width: 15,
                      ),
                    ),
                  ),
                ],
              ),
            )),
      ],
    );
  }
}
