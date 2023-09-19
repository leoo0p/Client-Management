import 'package:flutter/material.dart';
import '../dados/usuarios.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import '../dados/api.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

final _emailController = TextEditingController();
final _senhaController = TextEditingController();

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    double maxWidth = MediaQuery.of(context).size.width;
    double maxHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color.fromRGBO(49, 49, 49, 1),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: maxWidth * 0.1),
            child: Ink(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Login",
                        style: TextStyle(fontSize: 33),
                      ),
                      SizedBox(height: 30),
                      Container(
                        constraints: BoxConstraints(
                          maxWidth: 500,
                        ),
                        child: Ink(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(50),
                            ),
                            color: Color.fromRGBO(112, 112, 112, 1),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 5.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: TextField(
                                    controller: _emailController,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                    decoration: const InputDecoration(
                                      labelText: "Email",
                                      border: InputBorder.none,
                                      icon: Icon(Icons.mail),
                                    ),
                                    keyboardType: TextInputType.visiblePassword,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        constraints: BoxConstraints(
                          maxWidth: 500,
                        ),
                        child: Ink(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(50),
                            ),
                            color: Color.fromRGBO(112, 112, 112, 1),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 5.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: TextField(
                                    controller: _senhaController,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                    decoration: const InputDecoration(
                                      labelText: "Senha",
                                      border: InputBorder.none,
                                      icon: Icon(Icons.lock),
                                    ),
                                    keyboardType: TextInputType.number,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      InkWell(
                        borderRadius: BorderRadius.circular(15),
                        onTap: () {
                          if (_emailController.text.trim() != "" &&
                              _senhaController.text.trim() != "") {
                            API.login(context, _emailController.text,
                                _senhaController.text);
                          }
                        },
                        child: Ink(
                          decoration: BoxDecoration(
                              color: const Color.fromRGBO(112, 112, 112, 1),
                              borderRadius: BorderRadius.circular(15)),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 50.0, vertical: 15),
                            child: Text(
                              "Entrar",
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )),
          ),
        ),
      ),
    );
  }
}
