import 'package:adotappet/constants/api_path.dart';
import 'package:http/http.dart' as http;

abstract class PetService {
  Future<http.Response> getPets();
}

class ApiPetService implements PetService {
  @override
  Future<http.Response> getPets() async {
    var url = Uri.parse(Api.url_pets);
    final response = await http.get(url).timeout(Duration(minutes: 1));
    if (response.statusCode == 200) {
      return response;
    }
    throw Exception('Failed to load pets');
  }

}