import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';

const baseUrl = "localhost";

class API {
  static Future getClientes() async {
    var url = Uri(
      scheme: 'http',
      host: baseUrl,
      path: '/flutter/consultar.php',
    );

    return http.get(url);
  }

  static Future removeCliente(int idCliente) {
    var url = Uri(scheme: 'http', host: baseUrl, path: 'flutter/remover.php');

    return http.post(url, body: {'idCliente': idCliente.toString()});
  }

  static Future addCliente(String nome, String email, String telefone) {
    var url = Uri(scheme: 'http', host: baseUrl, path: 'flutter/adicionar.php');

    return http
        .post(url, body: {'Nome': nome, 'Email': email, 'Telefone': telefone});
  }

  static Future updateCliente(int idCliente, String nome, String email,
      String telefone, String permissao) {
    var url = Uri(scheme: 'http', host: baseUrl, path: 'flutter/editar.php');
    print("enviado");
    print(idCliente);
    print("Permissão no update: $permissao");
    return http.post(url, body: {
      'idCliente': idCliente.toString(),
      'Nome': nome,
      'Email': email,
      'Telefone': telefone,
      'Permissao': permissao,
    });
  }

//
//
//
//
//
//

  static Future login(BuildContext context, String email, String senha) async {
    // Cria a URL da API para o script PHP de login
    var url = Uri(scheme: 'http', host: baseUrl, path: 'flutter/login.php');

    // Faz uma solicitação POST para a URL da API, enviando o email e a senha e recebendo 'success' ou 'error'
    var response = await http.post(
      url,
      body: {
        'Email': email,
        'Senha': senha,
      },
    );

    // Decodifica a resposta JSON do servidor
    var data = json.decode(response.body);

    // Verifica se a resposta do servidor indica um login bem-sucedido
    if (data['status'] == "success") {
      // Se as credenciais estiverem corretas, exibe uma mensagem de sucesso.
      Fluttertoast.showToast(
        msg: "Logado com sucesso!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0,
      );

      // Redireciona o usuário para a página '/home' após o login bem-sucedido
      Navigator.popAndPushNamed(context, '/home');
    } else if (data['status'] == "error") {
      // Se as credenciais estiverem incorretas ou ocorrer um erro no servidor, exibe uma mensagem de erro
      Fluttertoast.showToast(
        msg: "Credenciais Inválidas",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }
}
