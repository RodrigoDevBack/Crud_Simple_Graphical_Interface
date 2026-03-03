import 'dart:convert';

void main() {
  String json = '''
  {
    "nome": "Rodrigo",
    "idade": 19,
    "Gênero": "M",
    "Crença": "Cristão Protestante"
  }
''';
  print(json);

  Map mapa = jsonDecode(json);
  mapa.forEach((k, c) => print("$k = $c"));

  Map mapaJson = {
    "nome": "Rodrigo",
    "idade": 19,
    "Gênero": "M",
    "Crença": "Cristão Protestante"
  };

  print(mapaJson);

  String mapaEncode = jsonEncode(mapaJson);
  print(mapaEncode);
}
