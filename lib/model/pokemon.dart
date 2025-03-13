import 'dart:convert';

class Pokemon {
  final String name;
  final int id;
  final String imageUrl;

  Pokemon({required this.name, required this.id, required this.imageUrl});

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    int id = int.parse(json['url'].split('/')[6]); // Extract ID from URL
    return Pokemon(
      name: json['name'],
      id: id,
      imageUrl:
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$id.png",
    );
  }
}
