void main() {
  var pagamento = Pagamento();
  pagamento.pagar(TipoPagamento.BOLETO);
}

enum TipoPagamento {
  PIX("PIX"),
  BOLETO("BOLETO"),
  CREDITO("CREDITO"),
  DEBITO("DEBITO");

  final String value;
  const TipoPagamento(this.value);
}

class Pagamento {
  void pagar(TipoPagamento tipoPagamento) {
    if (tipoPagamento.value == "PIX") {
      print("Pagando com PIX");
    } else if (tipoPagamento.value == "BOLETO") {
      print("Pagando com BOLETO");
    } else if (tipoPagamento.value == "CREDITO") {
      print("Pagando com CREDITO");
    } else if (tipoPagamento.value == "DEBITO") {
      print("Pagando com DEBITO");
    }
  }
}
