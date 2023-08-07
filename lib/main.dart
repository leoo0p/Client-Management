import 'package:flutter/material.dart';
import 'telas/home.dart';
import 'telas/subTelas/editarCli.dart';

void main() {
  runApp(const Principal());
}

class Principal extends StatelessWidget {
  const Principal({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gerenciamento de Clientes',
      debugShowCheckedModeBanner: false,
      initialRoute: "/home",
      routes: {
        "/home": (context) => const Home(),
        "/update": (context) => const Update(),
      },
    );
  }
}
