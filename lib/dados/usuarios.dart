class Usuario {
  int id;
  String nome;
  String email;
  String telefone;
  String permissao;

  Usuario(this.id, this.nome, this.email, this.telefone, this.permissao);

  Usuario.fromJson(Map json)
      : id = json['idCliente'],
        nome = json['Nome'],
        email = json['Email'],
        telefone = json['Telefone'],
        permissao = json['Permissao'];

  Map toJson() {
    return {
      'id': id,
      'nome': nome,
      'email': email,
      'telefone': telefone,
      'permisssao': permissao,
    };
  }
}
