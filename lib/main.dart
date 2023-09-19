import 'package:flutter/material.dart';
import 'telas/home.dart';
import 'telas/subTelas/editarCli.dart';
import 'telas/login.dart';

void main() {
  runApp(const Principal());
}

class Principal extends StatelessWidget {
  const Principal({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      title: 'Gerenciamento de Clientes',
      debugShowCheckedModeBanner: false,
      initialRoute: "/login",
      routes: {
        "/login": (context) => const Login(),
        "/home": (context) => const Home(),
        "/update": (context) => const Update(),
      },
    );
  }
}
