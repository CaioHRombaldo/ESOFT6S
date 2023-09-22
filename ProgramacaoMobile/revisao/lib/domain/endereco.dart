class Endereco {
  String cep;
  String numero;
  String logradouro;
  String complemento;
  String bairro;
  String cidade;
  String uf;

  Endereco(this.cep, this.numero, this.logradouro, this.complemento,
      this.bairro, this.cidade, this.uf);

  bool validarCep(cep) {
    return true;
  }
}
