import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tugas1/widgets/input_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.name});

  final String name;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final srchCtrl = TextEditingController();

  List _pokemons = [];

  void readJson() async {
    final String response = await rootBundle.loadString('assets/data/pokedex.json');
    final data = await json.decode(response);

    setState(() {
      _pokemons = data["pokemons"];
    });
  }
  
  @override
  void initState() {
    super.initState();
    // Call the readJson method when the app starts
    readJson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50, bottom: 20, left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: RichText(
                    text: TextSpan(
                      children: [
                        const TextSpan(text: "Hallo, ", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20)),
                        TextSpan(text: widget.name, style: const TextStyle(color: Colors.blue, fontSize: 20)),
                      ]
                    )
                  ),
                ),
                Container(
                  width: 75,
                  height: 75,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover, image: NetworkImage('https://www.actualidadiphone.com/wp-content/uploads/2016/07/pokemon-pikachu-go.jpg')),
                    borderRadius: BorderRadius.all(Radius.circular(100)),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  "Pokedex",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.amber,
                    fontSize: 30,
                    fontWeight: FontWeight.bold
                  ),
                ),
                InputText(validatorMessage: "", prefixIcon: const Icon(Icons.search), labelText: "Seach Pokemon", controller: srchCtrl)
              ],
            ),
          ),
          _pokemons.isNotEmpty ? 
            Expanded(
              child: ListView.builder(
                itemCount: _pokemons.length,
                itemBuilder: (context, index) {
                  return Card(
                    key: ValueKey(_pokemons[index]["id"]),
                    margin: const EdgeInsets.all(10),
                    color: Colors.amber.shade100,
                    child: ListTile(
                      leading: Text(_pokemons[index]["id"]),
                      title: Text(_pokemons[index]["name"]),
                      subtitle: Text(_pokemons[index]["description"]),
                    ),
                  );
                },
              ),
            )
            : Container(),
          const SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }
}