import 'package:flutter/material.dart';
import '../../dados/api.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class Cadastrar extends StatefulWidget {
  const Cadastrar({super.key});

  @override
  State<Cadastrar> createState() => _CadastrarState();
}

class _CadastrarState extends State<Cadastrar> {
  void _cadastrarCliente(String nome, String email, String telefone) {
    if ((nome == "") || (email == "") || (telefone == "")) {
      if (nome == "") {
        //campo nome nulo
        print("nome nulo");
      }
      if (email == "") {
        //campo email nulo
        print("email nulo");
      }
      if (telefone == "") {
        //campo telefone nulo
        print("telefone nulo");
      }
    } else {
      API.addCliente(nome, email, telefone);
      _valorNomeController.clear();
      _valorEmailController.clear();
      _valorTelefoneController.clear();
      foco.requestFocus();
    }
  }

  var telefoneMaskFormatter = MaskTextInputFormatter(
      mask: '(##) #####-####',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  late FocusNode foco;
  final _valorNomeController = TextEditingController();
  final _valorEmailController = TextEditingController();
  final _valorTelefoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
    foco = FocusNode();
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
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 40),
          Container(
            width: maxWidth - 35,
            height: 420,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Cadastro de clientes",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 35),
                Container(
                  width: maxWidth - 85,
                  child: TextFormField(
                    //focusNode: foco,
                    controller: _valorNomeController,
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Nome completo',
                      icon: Icon(Icons.person_add),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  width: maxWidth - 85,
                  child: TextFormField(
                    controller: _valorEmailController,
                    style: TextStyle(),
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Email',
                      hintText: 'EX: email@email.com',
                      icon: Icon(Icons.mail_rounded),
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  width: maxWidth - 85,
                  child: TextFormField(
                    controller: _valorTelefoneController,
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Telefone',
                      hintText: 'EX: (00) 0000-0000',
                      icon: Icon(Icons.call),
                    ),
                    keyboardType: TextInputType.phone,
                    inputFormatters: [telefoneMaskFormatter],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 40),
          InkWell(
            onTap: () {
              _cadastrarCliente(
                  _valorNomeController.text,
                  _valorEmailController.text,
                  telefoneMaskFormatter.getUnmaskedText());
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
                    Icons.person_add_alt_rounded,
                  ),
                  SizedBox(width: 25),
                  Text(
                    "Cadastrar",
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
