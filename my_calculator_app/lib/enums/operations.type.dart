enum OperationTypeEnum {
  subtraction(symbol: "-"),
  addiction(symbol: "+"),
  multiplication(symbol: "*"),
  division(symbol: "/");

  final String symbol;

  const OperationTypeEnum({required this.symbol});
}
