import 'package:adotappet/repositories/pet_repository.dart';
import 'package:adotappet/utils/services/pet_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';

class ClientApiPetsMock extends Mock implements ApiPetService{
}

void main(){
  final clientApiPetsMock = ClientApiPetsMock();
  final repository = ApiPetRepository(clientApiPetsMock);
  final expectedJsonReturn = '[{"nome":"Gelin","tipo":"CACHORRO","raca":"Vira-lata","dataNascimento":"2019-02-03","porte":"MEDIO","sexo":"MASCULINO","imagem":"https://s2.glbimg.com/XI_QifLkJB-6IxQ6eZ-u7XFU3ZY=/607x426/smart/e.glbimg.com/og/ed/f/original/2020/02/27/vira-lata.jpg","externalId":"c3f2ae02-2838-4bfb-a61e-e7748c306723"},{"nome":"Luna","tipo":"GATO","raca":"Siamês","dataNascimento":"2020-11-03","porte":"MEDIO","sexo":"FEMININO","imagem":"https://www.petlove.com.br/images/breeds/192825/profile/original/siames-p.jpg?1532626975","externalId":"9b703824-993d-40de-af73-221f325bb5ac"},{"nome":"Marley","tipo":"CACHORRO","raca":"São Bernardo","dataNascimento":"2021-05-10","porte":"GRANDE","sexo":"MASCULINO","imagem":"https://i.pinimg.com/originals/6a/0c/14/6a0c145d4b8116c59ec665f3fd45af8f.jpg","externalId":"9cdc91e7-03fc-4ee8-9d8f-07ef743f89d5"},{"nome":"Luna","tipo":"GATO","raca":"Siamês","dataNascimento":"2020-05-03","porte":"MEDIO","sexo":"FEMININO","imagem":"https://www.petlove.com.br/images/breeds/192825/profile/original/siames-p.jpg?1532626975","externalId":"eedd68ea-4dbc-4952-860d-78a4d10a866e"}]';

  test("deve acessar api de Pets com sucesso", () async{
    when(() => clientApiPetsMock.getPets()).thenAnswer((_) async => http.Response(expectedJsonReturn, 200));
    final listPets = await repository.fetchPets();
    expect(listPets.isNotEmpty, equals(true));
    expect(listPets.first.nome, equals("Gelin"));
  });
}

