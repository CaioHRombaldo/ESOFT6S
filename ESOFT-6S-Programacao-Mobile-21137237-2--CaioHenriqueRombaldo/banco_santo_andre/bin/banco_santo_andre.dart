import 'package:banco_santo_andre/banco_santo_andre.dart' as banco_santo_andre;
import 'package:banco_santo_andre/conta.dart';
import 'package:banco_santo_andre/client.dart';
import 'package:banco_santo_andre/enums.dart';

void main() {
  Cliente cliente1 = Cliente('Caio', TipoCliente.PESSOA_FISICA);
  Cliente cliente2 = Cliente('Maria Eduarda', TipoCliente.PESSOA_FISICA);
  Cliente cliente3 = Cliente('SpaceX', TipoCliente.PESSOA_JURIDICA);

  Conta conta1 = ContaCorrente(cliente1);
  Conta conta2 = ContaPoupanca(cliente2, saldoInicial: 100.0);
  Conta conta3 = ContaCorrente(cliente3);

  conta1.depositar(200.0);
  conta1.sacar(50.0);
  conta1.transferir(50.0, conta2);

  conta2.aplicar(150.0);
  conta2.sacar(30.0);

  print(conta1.extrato());
  print(conta2.extrato());
  print(conta3.extrato());
}