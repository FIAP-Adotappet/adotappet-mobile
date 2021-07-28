import 'dart:convert';

import 'package:adotappet/models/pet.dart';
import 'package:adotappet/utils/services/pet_service.dart';

abstract class PetRepository {
  Future<List<Pet>> fetchPets();
}

class ApiPetRepository implements PetRepository {
  final PetService _petService;

  ApiPetRepository(this._petService);

  @override
  Future<List<Pet>> fetchPets() async {
    final response = await _petService.getPets();
    var json = jsonDecode(response.body);
    return json.map<Pet>((data) => Pet.fromJson(data)).toList();
  }

}