import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/breed_model.dart';

// Servicio que maneja la comunicación con la API de Dog CEO
class DogService {
  static Future<List<BreedModel>> getBreeds() async {
    final url = Uri.parse('https://dog.ceo/api/breeds/list/all');

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body)['message'];
        return data.keys.map((name) => BreedModel.fromMap(name)).toList();
      } else {
        throw Exception('Error al obtener razas');
      }
    } catch (e) {
      throw Exception('Error de conexión');
    }
  }

  static String getImageUrlForBreed(String breed) {
    return 'https://dog.ceo/api/breed/$breed/images/random';
  }
}
