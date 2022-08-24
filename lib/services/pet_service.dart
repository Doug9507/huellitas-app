import 'package:http/http.dart' as http;
import 'package:huellitas_app/models/pet.dart';

abstract class PetService {
  static Future<ReqPetResponse> getPets() async {
    final response = await http.get(
      Uri.parse("https://huellitas-api.azurewebsites.net/api/Pet"),
    );

    if (response.statusCode == 200) {
      return reqPetResponseFromJson(response.body);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load negocio');
    }
  }
}
