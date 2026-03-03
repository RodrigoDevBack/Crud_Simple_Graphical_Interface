void main() {
  // Exemplo padrão
  // try {
  //   print((1 / 0).toInt());
  // } catch (e) {
  //   print('Falha');
  // }

  // Usando o throw e o strackStrace
  // try {
  //   print((1 / 0).toInt());
  // } catch (e, stackSTrace) {
  //   throw Exception(stackSTrace);
  // }

  // Usando Exception Custom
  // try {
  //   print((1 / 0).toInt());
  // } catch (e) {
  //   throw Nao_divida_por_zero();
  // }

  // Usando a verificação de tipo de ERROR
  try {
    calcs.divisao(2, 1);
  } on Nao_divida_por_zero catch (e) {
    print(e);
  } catch (e) {
    print(e);
  } finally {
    exec_log();
  }
}

class calcs {
  static void divisao(double num1, double num2) {
    if (num2 == 0) throw Nao_divida_por_zero();
    print(num1 / num2);
  }
}

class Nao_divida_por_zero implements Exception {
  @override
  String toString() {
    return "Não divida por zero!!!";
  }
}

void exec_log() {
  print('Execução foi enviada para o histórico.');
}
