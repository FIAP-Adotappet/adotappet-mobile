import 'dart:convert';

import 'package:adotappet/modules/home/models/pet_model.dart';
import 'package:http/http.dart' as http;

abstract class PetRepository {
  Future<List<Pet>> fetchPets();
}

class ApiPetRepository implements PetRepository {
  @override
  Future<List<Pet>> fetchPets() async {
    var url = Uri.parse('http://192.168.0.101:8080/api/pets');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      return json.map<Pet>((data) => Pet.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load pets');
    }
  }

}