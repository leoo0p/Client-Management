import '../../dados/usuarios.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import '../../dados/api.dart';

class Exibir extends StatefulWidget {
  const Exibir({super.key});

  @override
  State<Exibir> createState() => _ExibirState();
}

class _ExibirState extends State<Exibir> {
  var usuarios = List<Usuario>.empty();

  _getClientes() {
    API.getClientes().then((response) => {
          setState(() {
            Iterable list = json.decode(response.body);
            usuarios = list.map((model) => Usuario.fromJson(model)).toList();
          })
        });
  }

  void abrirUpdate(int idCliente, int index) {
    Navigator.pushNamed(context, "/update",
        arguments: {"idCliente": idCliente, "Index": index});
  }

  @override
  void initState() {
    super.initState();
    _getClientes();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void exibirPopup(
      BuildContext context, int idCliente, String nome, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Column(
            children: [
              const Text("Opções do usuário"),
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  nome,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  abrirUpdate(idCliente, index);
                },
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.blue),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(right: 25),
                      child: Icon(Icons.edit_rounded),
                    ),
                    Text('Editar dados'),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  confirmarExclusao(context, idCliente, nome);
                },
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.red),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(right: 25),
                      child: Icon(Icons.person_remove),
                    ),
                    Text('Remover usuário'),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void confirmarExclusao(BuildContext context, int idCliente, String nome) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Column(
            children: [
              const Text("Deseja remover o usuário"),
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      nome,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text("?"),
                  ],
                ),
              ),
            ],
          ),
          content: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  API.removeCliente(idCliente);
                  Navigator.pop(context);

                  Future.delayed(const Duration(milliseconds: 500)).then((_) {
                    _getClientes();
                  });
                },
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.red),
                ),
                child: const Text('Remover'),
              ),
              const SizedBox(width: 50),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.blue),
                ),
                child: const Text('Voltar'),
              ),
            ],
          ),
        );
      },
    );
  }

  String formatarTelefone(int telefone) {
    final formattedNumber = telefone.toString();
    final numeroformatado = '(' +
        formattedNumber.substring(0, 2) +
        ') ' +
        formattedNumber.substring(2, 7) +
        '-' +
        formattedNumber.substring(7);

    return numeroformatado;
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: usuarios.length,
      itemBuilder: (context, index) {
        return FutureBuilder(
            future: API.getClientes(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Padding(
                  padding: EdgeInsets.symmetric(vertical: 28),
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              } else if (snapshot.hasData) {
                return InkWell(
                  onTap: () {
                    Future.delayed(const Duration(milliseconds: 190)).then((_) {
                      exibirPopup(context, usuarios[index].id,
                          usuarios[index].nome, index);
                    });
                  },
                  child: Ink(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: ListTile(
                        title: Text(
                          "• ${usuarios[index].nome}",
                          style: const TextStyle(
                              color: Colors.white, fontSize: 20),
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.only(
                              left: 20, top: 3, bottom: 3),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                usuarios[index].email,
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                formatarTelefone(
                                    int.parse(usuarios[index].telefone)),
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              } else {
                return const SizedBox(
                  child: Center(
                      child: Text(
                    "erro.",
                    style: TextStyle(color: Colors.white),
                  )),
                );
              }
            });
      },
    );
  }
}
