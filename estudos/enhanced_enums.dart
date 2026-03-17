// void main() {
//   var pagamento = Pagamento();
//   pagamento.pagar(TipoPagamento.BOLETO);
// }

// enum TipoPagamento {
//   PIX("PIX"),
//   BOLETO("BOLETO"),
//   CREDITO("CREDITO"),
//   DEBITO("DEBITO");

//   final String value;
//   const TipoPagamento(this.value);
// }

// class Pagamento {
//   void pagar(TipoPagamento tipoPagamento) {
//     if (tipoPagamento.value == "PIX") {
//       print("Pagando com PIX");
//     } else if (tipoPagamento.value == "BOLETO") {
//       print("Pagando com BOLETO");
//     } else if (tipoPagamento.value == "CREDITO") {
//       print("Pagando com CREDITO");
//     } else if (tipoPagamento.value == "DEBITO") {
//       print("Pagando com DEBITO");
//     }
//   }
// }

enum typTypesEnum {
  nbu("OPA"),
  nub("UPA"),
  bun("CUP");

  final String symbol;
  const typTypesEnum(this.symbol);
}

void main() {
  String topd = "dsdfds";
  bool isExist = false;
  print(typTypesEnum.values.map((t) => {if (t == topd) isExist = true}));
  print(isExist);
}
