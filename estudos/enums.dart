void main() {
  Pagamento pagamento = Pagamento();
  pagamento.pagar(TipoPagamento.DEBITO);
}

enum TipoPagamento {
  PIX,
  BOLETO,
  CREDITO,
  DEBITO;

  String toValue() {
    Map map = {
      PIX: "PIX",
      BOLETO: "BOLETO",
      CREDITO: "CREDITO",
      DEBITO: "DEBITO",
    };
    return map[this];
  }
}

extension ExtensionTipoPagamento on TipoPagamento {
  String toValue() {
    Map map = {
      TipoPagamento.PIX: "PIX",
      TipoPagamento.BOLETO: "BOLETO",
      TipoPagamento.CREDITO: "CREDITO",
      TipoPagamento.DEBITO: "DEBITO",
    };
    return map[this];
  }
}

class Pagamento {
  void pagar(TipoPagamento tipoPagamento) {
    if (tipoPagamento.toValue() == "PIX") {
      print("Pagando com PIX");
    } else if (tipoPagamento.toValue() == "BOLETO") {
      print("Pagando com BOLETO");
    } else if (tipoPagamento.toValue() == "CREDITO") {
      print("Pagando com CREDITO");
    } else if (tipoPagamento.toValue() == "DEBITO") {
      print("Pagando com DEBITO");
    }
  }
}
