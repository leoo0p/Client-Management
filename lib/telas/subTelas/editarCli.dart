import 'package:flutter/material.dart';
import 'package:flutter_comercio/dados/usuarios.dart';
import '../../dados/api.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'dart:convert';

class Update extends StatefulWidget {
  const Update({super.key});

  @override
  State<Update> createState() => _UpdateState();
}

class _UpdateState extends State<Update> {
  var telefoneMaskFormatter = MaskTextInputFormatter(
      mask: '(##)#####-####',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  final _valorNomeController = TextEditingController();
  final _valorEmailController = TextEditingController();
  final _valorTelefoneController = TextEditingController();

  String? permissao;

  String formatarTelefone(String telefone) {
    final formattedNumber = telefone.toString();
    final numeroformatado = '(' +
        formattedNumber.substring(0, 2) +
        ') ' +
        formattedNumber.substring(2, 7) +
        '-' +
        formattedNumber.substring(7);

    return numeroformatado;
  }

  var usuarios = List<Usuario>.empty();

  _getClientes() {
    API.getClientes().then((response) => {
          setState(() {
            Iterable list = json.decode(response.body);
            usuarios = list.map((model) => Usuario.fromJson(model)).toList();
          })
        });
  }

  @override
  void initState() {
    super.initState();
    _getClientes();
  }

  @override
  void dispose() {
    _valorNomeController.dispose();
    _valorEmailController.dispose();
    _valorTelefoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double maxWidth = MediaQuery.of(context).size.width;
    double maxHeight = MediaQuery.of(context).size.height;

    var data = ModalRoute.of(context)!.settings.arguments as Map;
    int idCliente = data['idCliente'];
    int newidCliente = data['Index'];

    print("index: " + newidCliente.toString());
    print("quantidade: " + usuarios.length.toString());
    print(usuarios[newidCliente].nome.toString() +
        "  id: " +
        usuarios[newidCliente].id.toString());
    print(usuarios[newidCliente].permissao);

    return Scaffold(
        appBar: AppBar(
          title: const Text("Editar informações de usuário"),
          toolbarHeight: 70,
        ),
        backgroundColor: Color.fromARGB(255, 27, 30, 33),
        body: SingleChildScrollView(
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: maxHeight / 9),
              Container(
                width: maxWidth - 30,
                height: 520,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Editar dados do usuário",
                      style: TextStyle(
                          fontSize: 30, overflow: TextOverflow.ellipsis),
                    ),
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        usuarios[newidCliente].nome,
                        style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            overflow: TextOverflow.ellipsis),
                      ),
                    ),
                    const SizedBox(height: 35),
                    SizedBox(
                      width: maxWidth - 85,
                      child: TextFormField(
                        controller: _valorNomeController,
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Nome completo',
                          icon: Icon(Icons.person_rounded),
                          hintText: usuarios[newidCliente].nome,
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    SizedBox(
                      width: maxWidth - 85,
                      child: TextFormField(
                        controller: _valorEmailController,
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Email',
                          hintText: usuarios[newidCliente].email,
                          icon: Icon(Icons.mail_rounded),
                        ),
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                    const SizedBox(height: 30),
                    SizedBox(
                      width: maxWidth - 85,
                      child: TextFormField(
                        controller: _valorTelefoneController,
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Telefone',
                          hintText:
                              formatarTelefone(usuarios[newidCliente].telefone),
                          icon: Icon(Icons.call),
                        ),
                        keyboardType: TextInputType.phone,
                        inputFormatters: [telefoneMaskFormatter],
                      ),
                    ),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 8, right: 8),
                          child: Icon(
                            Icons.supervised_user_circle_outlined,
                          ),
                        ),
                        const Text(
                          "Permissão:",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(width: 8),
                        DropdownButton<String>(
                          value: permissao,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                          hint: Text(usuarios[newidCliente].permissao),
                          icon: const Icon(Icons.keyboard_arrow_down_rounded),
                          onChanged: (novo) {
                            setState(() {
                              permissao = novo;
                            });
                          },
                          items: <String>['cliente', 'administrador']
                              .map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        )
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(height: 40),
              InkWell(
                onLongPress: () {
                  print("pressionado");
                  API.updateCliente(
                    idCliente,
                    _valorNomeController.text,
                    _valorEmailController.text,
                    telefoneMaskFormatter.getUnmaskedText(),
                    permissao.toString(),
                  );
                  print("Permissão ao clicar: $permissao");
                  setState(() {
                    Future.delayed(const Duration(milliseconds: 500)).then((_) {
                      _getClientes();
                    });
                  });
                },
                borderRadius: BorderRadius.circular(10),
                child: Ink(
                  width: 200,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blue,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.edit_rounded,
                      ),
                      SizedBox(width: 20),
                      Text(
                        "Editar",
                        style: TextStyle(fontSize: 17),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
        ));
  }
}
