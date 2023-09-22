import 'enums.dart';
import 'client.dart';

class Conta {
  final Cliente titular;
  final TipoConta tipo;
  double saldo = 0.0;

  Conta(this.titular, this.tipo, {double saldoInicial = 0.0}) {
    if (saldoInicial > 0) {
      saldo = saldoInicial;
    }
  }

  void depositar(double valor) {
    saldo += valor;
  }

  void sacar(double valor) {
    if (saldo >= valor) {
      saldo -= valor;
    } else {
      print("Saldo insuficiente.");
    }
  }

  void transferir(double valor, Conta destino) {
    if (saldo >= valor) {
      saldo -= valor;
      destino.depositar(valor);
    } else {
      print("Saldo insuficiente para transferência.");
    }
  }

  void aplicar(double valor) {
    print('Aplicando R\$ $valor na conta.');
    depositar(valor);
  }

  String extrato() {
    return "Titular: ${titular.nome}\nSaldo: R\$ $saldo";
  }
}

class ContaPoupanca extends Conta {
  ContaPoupanca(Cliente titular, {double saldoInicial = 0.0})
      : super(titular, TipoConta.POUPANCA, saldoInicial: saldoInicial);

  @override
  void sacar(double valor) {
    if (saldo - valor >= 50.0) {
      super.sacar(valor);
    } else {
      print("A conta poupança deve manter um saldo mínimo de R\$ 50.00.");
    }
  }

  void aplicar(double valor) {
    depositar(valor);
  }
}

class ContaCorrente extends Conta {
  ContaCorrente(Cliente titular, {double saldoInicial = 0.0})
      : super(titular, TipoConta.CORRENTE, saldoInicial: saldoInicial);

  @override
  void sacar(double valor) {
    if (saldo >= valor) {
      super.sacar(valor);
    } else {
      print("Saldo insuficiente.");
    }
  }
}