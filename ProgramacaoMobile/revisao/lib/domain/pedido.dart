import 'package:revisao/domain/pessoa.dart';
import 'package:revisao/domain/produto.dart';

class Pedido {
  Pessoa cliente;
  List<Produto> produtos;
  StatusPedido status;

  Pedido({required this.cliente}, {required this.produtos}, {required this.status});

  double getValorTotal() {
    // var tot = 0.0;
    // for (var produto in produtos) {
    //   tot += produto.valor;
    // }
    // return tot;

    return produtos.fold(
        0.0, (previousValue, element) => previousValue + element.valor);
  }

  int getQuantidade() {
    return produtos.length;
  }
}

enum StatusPedido {
  valorDefault(sigla: "I"),
  aguardandoPagamento(sigla: "AP"),
  processandoPagamento(sigla: "PP"),
  pago(sigla: "P");

  const StatusPedido({required this.sigla});

  final String sigla;
}
