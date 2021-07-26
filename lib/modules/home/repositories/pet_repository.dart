import 'dart:convert';

import 'package:adotappet/modules/home/models/pet_model.dart';
import 'package:adotappet/utils/services/rest_api_service.dart';

abstract class PetRepository {
  Future<List<Pet>> fetchPets();
}

class ApiPetRepository implements PetRepository {
  final PetService petService;


  ApiPetRepository(this.petService);

  @override
  Future<List<Pet>> fetchPets() async {
    final response = await petService.getPets();
    var json = jsonDecode(response.body);
    return json.map<Pet>((data) => Pet.fromJson(data)).toList();
  }

}