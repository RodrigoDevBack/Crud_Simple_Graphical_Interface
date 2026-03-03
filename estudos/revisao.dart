void main() {
  // // Variáveis
  // String helloWorld = "Hello, world!";
  // print(helloWorld);

  // int algumInt = 12;
  // print(algumInt);

  // bool algumBool = true;
  // print(algumBool);

  // // null-safety
  // String? helloDart = "Hello, dart!";
  // print(helloDart);

  // helloDart = null;
  // print(helloDart);

  // late String helloMine = "Hello, mine!";
  // print(helloMine);
  // // helloMine = null;

  // // if e Switch
  // int seguirEmFrente = 0;

  // if (seguirEmFrente == 0) {
  //   print("Andar");
  // } else if (seguirEmFrente == 1) {
  //   print("Atenção");
  // } else {
  //   print("Parar");
  // }

  // switch (seguirEmFrente) {
  //   case 0:
  //     print('Andar');
  //     break;
  //   case 1:
  //     print('Atenção');
  //     break;
  //   case 2:
  //     print('Parar');
  //     break;
  //   default:
  //     print('Nũmero inválido.');
  //     break;
  // }

  // // loops 
  // for (int i = 0; i != 11; i++) {
  //   // print(i);
  // }

  // int count = 11;
  // while (count != 1) {
  //   count--;
  //   // print(count);
  // }

  // do {
  //   // print(count);
  //   count++;
  // } while (count != 11);

  // Classes

  ControleDeTv controleA = ControleDeTv("Samsung", 15.23, 17.77);
  ControleDeTv controleB = ControleDeTv("Vaio", 50.34, 34.66);

  print(controleA.getMarca);
  print(controleB.getMarca);

  print(controleA.getCustoTotal());
  print(controleB.getCustoTotal());

  controleA.setMarca('Motorola');
  print(controleA.getMarca);

}

abstract class interfac {
  String opa();
}

class CustoDeFabricacao implements interfac {
  final double _valor;
  final double _custoMatPrima;
  static double _imposto = 2.35;
  
  @override
  String opa() {
    return "opa";
  }

  CustoDeFabricacao(this._valor, this._custoMatPrima);

  double getCustoTotal() {
    return (this._valor + this._custoMatPrima * _imposto).truncateToDouble();
  }
}

class ControleDeTv extends CustoDeFabricacao {
  String _marca;

  ControleDeTv(this._marca, super.valor, super.custoMatPrima);

  double getCustoTotal() {
    return this._custoMatPrima + this._valor * 2.1;
  }

  String get getMarca => this._marca;

  void setMarca(String newMarca) => this._marca = newMarca; 
}
