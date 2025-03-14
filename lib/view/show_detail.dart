import 'package:flutter/material.dart';
import 'package:pokemon_app/service/api_service.dart';

class ShowDetail extends StatefulWidget {
  final int clientID;

  const ShowDetail(this.clientID);

  @override
  State<ShowDetail> createState() => _ShowDetailState();
}

class _ShowDetailState extends State<ShowDetail> {
  final ApiService apiService = ApiService();

  late Future futurePokemonDetail;

  @override
  void initState() {
    super.initState();
    futurePokemonDetail = apiService.fetchPokemonDetail(widget.clientID);
    print("this future");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Pokemon"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Go back to the previous page
          },
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.green,
        child: FutureBuilder(
          future: futurePokemonDetail,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {}
            print(snapshot.data.name);
            print(
              "this = " + snapshot.data.sprites.other.showdown.frontDefault,
            );
            return Column(
              children: [
                Image.network(
                  snapshot.data.sprites.other.officialArtwork.frontDefault,
                  height: 200,
                ),
                columnDetail("Pokemon Name", snapshot.data.name),
                columnDetail(
                  "Base Experience",
                  snapshot.data.baseExperience.toString(),
                ),
                columnDetail("Height", snapshot.data.height.toString()),
                columnDetail("Weight", snapshot.data.weight.toString()),
              ],
            );
          },
        ),
      ),
    );
  }

  Row columnDetail(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                height: 50,
                width: 180,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: Center(
                  child: Text(
                    label,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                height: 50,
                width: 180,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: Center(
                  child: Text(
                    value,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
