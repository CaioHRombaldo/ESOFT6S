import 'package:revisao/domain/pessoa.dart';
import 'package:revisao/domain/produto.dart';

class Pedido {
  Pessoa cliente;
  List<Produto> produtos;
  StatusPedido status;

  Pedido(this.cliente, this.produtos, this.status);

  double getValorTotal() {
    return 999.9;
  }

  int getQuantidade() {
    return 999;
  }
}

enum StatusPedido {
  valor_default,
  aguardando_pagamento,
  processando_pagamento,
  pago
}
