import 'package:adotappet/constants/app_constants.dart';
import 'package:adotappet/modules/detail/screens/detail_screen.dart';
import 'package:adotappet/modules/home/models/pet_model.dart';
import 'package:adotappet/modules/home/repositories/pet_repository.dart';
import 'package:adotappet/widgets/custom_app_bar.dart';
import 'package:adotappet/widgets/custom_card.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Pet>> _futurePets;
  PetRepository _petRepository = ApiPetRepository();

  @override
  void initState() {
    super.initState();
    _futurePets = _petRepository.fetchPets();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(isHome: true),
      extendBody: true,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 30),
          _TituloPagina(
            texto: 'Doe seu lar,',
            bold: true,
          ),
          _TituloPagina(
            texto: 'adote um pet.',
            bold: false,
          ),
          SizedBox(height: 15),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
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
          SizedBox(
            height: 15,
          ),
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
      padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 12.0),
      child: Text(
        texto,
        style: TextStyle(
          fontWeight: bold ? FontWeight.bold : FontWeight.normal,
          fontSize: 32,
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
          Image(
            image: AssetImage(pathImagem),
            width: 40,
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5, right: 10),
            child: Text(
              textoCartao,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
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
      padding: const EdgeInsets.only(top: 28, right: 12, left: 12, bottom: 5),
      child: Row(
        children: [
          Text(
            'Pets para adoção',
            style: TextStyle(fontSize: 18),
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
          nextPage: DetailPage(pet),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image(
                  fit: BoxFit.fill,
                  image: NetworkImage(pet.imagem),
                  width: 80,
                  height: 80,
                ),
              ),
              SizedBox(width: 10),
              Container(
                alignment: Alignment.topLeft,
                height: 80,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: Text(
                        pet.nome,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        pet.idade,
                        style: TextStyle(fontSize: 12),
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
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
