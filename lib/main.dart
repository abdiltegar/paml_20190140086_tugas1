import 'package:flutter/material.dart';
import 'package:tugas1/views/auth/login.dart';
import 'package:tugas1/views/home/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.all(50),
              child: Text(
                "Pokedex",
                style: TextStyle(
                  color: Colors.amber,
                  fontSize: 30,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            const Text(
              "Welcome to Pokedex \nYou can find your favorite pokemon here",
              style: TextStyle(
                color: Colors.grey
              ),
              textAlign: TextAlign.center,
            ),
            const Expanded(
              child: Image(
                image: AssetImage("assets/img/pokeball.png"),
                width: 200,
                height: 200,
              ),
            ),
            FloatingActionButton(
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()) 
                );
              },
              child: const Icon(Icons.arrow_forward, color: Colors.white),
            ),
            const SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }
}
