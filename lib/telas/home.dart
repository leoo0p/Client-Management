import 'package:flutter/material.dart';
import 'subTelas/exibirCli.dart';
import 'subTelas/cadastrarCli.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final ScrollController _scrollController = ScrollController();

  backToTop() {
    _scrollController.jumpTo(_scrollController.position.minScrollExtent);
  }

  nomemaiusculo(String texto) {
    if (texto.isEmpty) {
      return texto;
    }
    return texto[0].toUpperCase() + texto.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 27, 30, 33),
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(46, 53, 58, 1),
          title: const Text(
            "Gerenciamento de Usuários",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          bottom: const TabBar(
              unselectedLabelColor: Color.fromRGBO(138, 150, 158, 1),
              labelColor: Colors.blue,
              indicatorColor: Colors.blue,
              indicatorWeight: 5,
              isScrollable: false,
              tabs: [
                Tab(
                  child: Text("???"),
                ),
                Tab(
                  child: Text("Cadastrar"),
                ),
                Tab(
                  child: Text("Usuários"),
                ),
              ]),
        ),
        body: const TabBarView(
          children: <Widget>[
            Center(
                child: Text(
              "em desenvolvimento..",
              style: TextStyle(color: Colors.white),
            )),
            Cadastrar(),
            Exibir(),
          ],
        ),
      ),
    );
  }
}
