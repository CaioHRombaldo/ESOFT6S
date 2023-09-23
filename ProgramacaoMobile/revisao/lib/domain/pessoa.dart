import 'package:revisao/domain/endereco.dart';

class Pessoa {
  String nome;
  String documento;
  String telefone;
  String email;
  Endereco endereco;

  Pessoa(this.nome, this.documento, this.telefone, this.email, this.endereco);

  bool validarDocumento(documento) {
    return true;
  }

  void mostrarDados() {
    print('''Nome: $nome, 
      Documento: $documento, 
      Telefone: $telefone, 
      E-Mail: $email, 
      Endereço: $endereco''');
  }
}
