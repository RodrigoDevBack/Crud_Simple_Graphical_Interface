void main() {
  Map afd = {"opa": "sadf", "asdasd": "asdfasd", "asdfwsdef": 234 };
  print(afd["opa"]);

  Map<String, int> mapaNum = {"sabe": 1, "sabe2": 2};

  mapaNum.putIfAbsent("sabe", () => 3);
  print(mapaNum);

  mapaNum["sabeMuito"] = 5;

  mapaNum.remove("sabe");

  mapaNum.forEach((ch, va) => print("$ch + $va"));

  mapaNum.keys.forEach(print);

  mapaNum.values.forEach(print);

  mapaNum.update("sabeMuito", (value) => 10);

  print(mapaNum);

}