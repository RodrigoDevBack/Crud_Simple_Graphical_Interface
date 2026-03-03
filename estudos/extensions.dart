void main() {
  String nome = "rodrigo";
  print(nome.toFirstCharToUpperCase());
  print("aoskoasd".toFirstCharToUpperCase());
}

extension ExtensiontoFirstCharToUpperCase on String {
  String toFirstCharToUpperCase() {
    return this[0].toUpperCase() + this.substring(1);
  }
}

class Utils {
  static String toFirstCharToUpperCase(String value) {
    return value[0].toUpperCase() + value.substring(1);
  }
}
