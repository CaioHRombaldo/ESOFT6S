import 'package:revisao/domain/produto.dart';
import 'package:revisao/domain/pedido.dart';
import 'package:revisao/domain/pessoa.dart';
import 'package:revisao/revisao.dart';
import 'package:test/test.dart';

void main() {
  var cliente1 = Pessoa('Caio', '000.000.000-75', '67 99999-9999',
      'chrstream@hotmail.com', 'Maringá-PR');

  var produto1 = Produto(
      'Aspirador de pó',
      '''Possui a função soprar e amplo 
    reservatório com encaixe fácil, que garante maior praticidade na abertura 
    e fechamento.''',
      499.90,
      DateTime(2023, 09, 12, 0, 0, 0),
      DateTime(2026, 09, 12, 0, 0, 0),
      'VONDER-APV1000');

  var produto2 = Produto(
      'Alicate de Pressão',
      '''O Alicate de Pressão é uma 
    ferramenta com formato curvo inferior e reto superior para uso 
    profissional e hobby.''',
      19.90,
      DateTime(2023, 09, 12, 0, 0, 0),
      DateTime(2026, 09, 12, 0, 0, 0),
      'GEDORE-137-10');

  var produto3 = Produto(
      'Esfregão 360 Graus MOP',
      '''O Esfregão 360° MOP 
    LT6003T é um conjunto de limpeza completo e eficiente, projetado para 
    facilitar a tarefa''',
      99.90,
      DateTime(2023, 09, 12, 0, 0, 0),
      DateTime(2026, 09, 12, 0, 0, 0),
      'LITH-LT6003T');

  var produtos1 = [produto1, produto2, produto3];

  var pedido1 = Pedido(cliente1, produtos1, StatusPedido.aguardandoPagamento);
  test('Quantidade de produtos de um pedido', () {
    expect(pedido1.getQuantidade(), 3);
  });

  test('Valor total de produtos de um pedido', () {
    expect(pedido1.getValorTotal().toStringAsFixed(2), '619.70');
  });
}
