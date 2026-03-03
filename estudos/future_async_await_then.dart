void main() async {
  // future
  late bool result;
  Email email = Email();

  Future<bool> resultFuture = email.sendEmail("email@email.com", "email@proton.me", "blablablablabla.");

  // Existe a forma usando o then, mas só traz resultado ao fim do programa
  // email.sendEmail("efewf", "to", "content").then((result) => print(result));

  result = await resultFuture;

  print(result);
}

class Email {
  Future<bool> sendEmail(String by, String to, String content) {
    return Future.value(true);
  }
}
