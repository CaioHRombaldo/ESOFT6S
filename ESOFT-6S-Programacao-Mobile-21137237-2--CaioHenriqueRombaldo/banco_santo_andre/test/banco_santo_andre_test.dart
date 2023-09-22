import 'package:banco_santo_andre/banco_santo_andre.dart';
import 'package:banco_santo_andre/enums.dart';
import 'package:banco_santo_andre/client.dart';
import 'package:banco_santo_andre/conta.dart';
import 'package:test/test.dart';

void main() {
  test('Teste de Depósito', () {
    Cliente cliente = Cliente('Mario', TipoCliente.PESSOA_FISICA);
    Conta conta = ContaCorrente(cliente);

    conta.depositar(100.0);
    expect(conta.saldo, equals(100.0));
  });

  test('Teste de Saque', () {
    Cliente cliente = Cliente('Luigi', TipoCliente.PESSOA_FISICA);
    Conta conta = ContaCorrente(cliente, saldoInicial: 200.0);

    conta.sacar(50.0);
    expect(conta.saldo, equals(150.0));

    conta.sacar(200.0); // Deve falhar (saldo insuficiente)
    expect(conta.saldo, equals(150.0));
  });

  test('Teste de Transferência', () {
    Cliente cliente1 = Cliente('Ana Maria', TipoCliente.PESSOA_FISICA);
    Cliente cliente2 = Cliente('Cleonisse', TipoCliente.PESSOA_FISICA);

    Conta conta1 = ContaCorrente(cliente1, saldoInicial: 300.0);
    Conta conta2 = ContaCorrente(cliente2, saldoInicial: 100.0);

    conta1.transferir(50.0, conta2);
    expect(conta1.saldo, equals(250.0));
    expect(conta2.saldo, equals(150.0));

    conta1.transferir(300.0, conta2); // saldo insuficiente
    expect(conta1.saldo, equals(250.0));
    expect(conta2.saldo, equals(150.0));
  });

  test('Teste de Aplicação e Saque na Poupança', () {
    Cliente cliente = Cliente('Marcelinho', TipoCliente.PESSOA_FISICA);
    Conta conta = ContaPoupanca(cliente);

    conta.aplicar(100.0);
    expect(conta.saldo, equals(100.0));

    conta.sacar(30.0);
    expect(conta.saldo, equals(70.0));

    conta.sacar(70.0); // saldo mínimo não mantido
    expect(conta.saldo, equals(70.0));
  });
}