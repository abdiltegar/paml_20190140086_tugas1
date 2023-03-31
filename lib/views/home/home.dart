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

  Color getColor(e){
    return e == "Grass" ? Colors.green : e == "Poison" ? Colors.purple : e == "Fire" ? Colors.red : Colors.white;
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
                    image: DecorationImage(fit: BoxFit.cover, image: AssetImage("assets/img/ash.png")),
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
                    color: Colors.white,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                            ),
                            child: Image.asset(_pokemons[index]["image"], width: 100, height: 100,)
                          ),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(text: _pokemons[index]["id"]+" ", style: const TextStyle(color: Colors.grey)),
                                    TextSpan(text: _pokemons[index]["name"], style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                                  ]
                                )
                              ),
                              Wrap(
                                children: _pokemons[index]["types"].map<Widget>((e) =>
                                  Padding(
                                    padding: const EdgeInsets.all(2),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        color: getColor(e),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(2),
                                        child: Text(
                                          e,
                                          style: const TextStyle(
                                            color: Colors.white, 
                                            fontWeight: FontWeight.normal,
                                            fontSize: 12
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ).toList(),
                              ),
                              Text(_pokemons[index]["description"], style: const TextStyle(color: Colors.grey),)
                            ],
                          ),
                        ),
                      ],
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