import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pokemon_app/model/pokemon.dart';

class ApiService {
  static const String apiUrl =
      "https://pokeapi.co/api/v2/pokemon?limit=100&offset=0"; // Limit to 100 for better performance

  Future<List<Pokemon>> fetchPokemonList() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      List<dynamic> results = data['results'];

      return results.map((json) => Pokemon.fromJson(json)).toList();
    } else {
      throw Exception("Failed to load Pokémon list");
    }
  }
}
