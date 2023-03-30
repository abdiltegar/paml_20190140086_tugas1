import 'package:flutter/material.dart';
import 'package:tugas1/views/auth/login.dart';
import 'package:tugas1/views/home/home.dart';
import 'package:tugas1/widgets/input_email.dart';
import 'package:tugas1/widgets/input_password.dart';
import 'package:tugas1/widgets/input_repassword.dart';
import 'package:tugas1/widgets/input_text.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final nameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();
  final rePasswordCtrl = TextEditingController();

  final _formRegKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
      ),
      body: SizedBox(
        width: double.infinity,
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(50),
                      child: Container(
                        width: 125,
                        height: 125,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover, image: NetworkImage('https://www.actualidadiphone.com/wp-content/uploads/2016/07/pokemon-pikachu-go.jpg')),
                          borderRadius: BorderRadius.all(Radius.circular(100)),
                        ),
                      ),
                    ),
                    const Text(
                      "Register",
                      style: TextStyle(
                        color: Colors.amber,
                        fontSize: 25,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0, top: 50.0, right: 10.0, bottom: 10.0),
                        child: Form(
                          key: _formRegKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("Name", style: TextStyle(color: Colors.amber)),
                              InputText(validatorMessage: "Please enter your name", prefixIcon: const Icon(Icons.person), labelText: "Enter your name", controller: nameCtrl),
                              const SizedBox(height: 10,),
                              const Text("Name", style: TextStyle(color: Colors.amber)),
                              InputEmail(prefixIcon: const Icon(Icons.email), labelText: "Enter your email", controller: emailCtrl),
                              const SizedBox(height: 10,),
                              const Text("Password", style: TextStyle(color: Colors.amber)),
                              InputPassword(prefixIcon: const Icon(Icons.lock), labelText: "Enter your password", controller: passwordCtrl),
                              const SizedBox(height: 10,),
                              const Text("Re-Password", style: TextStyle(color: Colors.amber)),
                              InputRePassword(prefixIcon: const Icon(Icons.lock), labelText: "Enter your password", controller: rePasswordCtrl, passwordController: passwordCtrl),
                              const SizedBox(height: 10,),
                            ],
                          )
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 40,
                            child: ElevatedButton(
                              onPressed: (){
                                if(_formRegKey.currentState!.validate()){
                                  debugPrint("Validate");
                                  _formRegKey.currentState!.save();
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => HomePage(name: nameCtrl.text)) 
                                  );
                                }else{
                                  debugPrint("Not Validate");
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                              ),
                              child: const Text("Register", style: TextStyle(color: Colors.white),),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Already have an account?",
                          style: TextStyle(color: Colors.grey),
                        ),
                        TextButton(
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage()));
                          }, 
                          child: const Text("Sign In", style: TextStyle(color: Colors.amber))
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    )
                  ],
                )
              )
            ),
          ],
        ),
      ),
    );
  }
}