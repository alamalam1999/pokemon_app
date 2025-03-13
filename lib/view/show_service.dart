import 'package:flutter/material.dart';
import 'package:pokemon_app/model/pokemon.dart';
import 'package:pokemon_app/service/api_service.dart';
import 'package:pokemon_app/view/show_detail.dart';

class PokemonListScreen extends StatefulWidget {
  @override
  _PokemonListScreenState createState() => _PokemonListScreenState();
}

class _PokemonListScreenState extends State<PokemonListScreen> {
  final ApiService apiService = ApiService();
  late Future<List<Pokemon>> futurePokemonList;

  @override
  void initState() {
    super.initState();
    futurePokemonList = apiService.fetchPokemonList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Pokemon List")),
      body: FutureBuilder<List<Pokemon>>(
        future: futurePokemonList,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text("No Pokemon found"));
          }

          List<Pokemon> pokemonList = snapshot.data!;

          return GridView.builder(
            padding: EdgeInsets.all(10),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: pokemonList.length,
            itemBuilder: (context, index) {
              Pokemon pokemon = pokemonList[index];

              return GestureDetector(
                onTap: () {
                  print("Tapped! detail");
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ShowDetail(pokemonList[index].id),
                    ),
                  );
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  elevation: 5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network(pokemon.imageUrl, height: 80),
                      SizedBox(height: 5),
                      Text(
                        pokemon.name.toUpperCase(),
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
