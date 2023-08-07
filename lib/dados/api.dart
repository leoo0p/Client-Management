import 'dart:async';
import 'package:http/http.dart' as http;

const baseUrl = "10.16.133.9";

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
}
