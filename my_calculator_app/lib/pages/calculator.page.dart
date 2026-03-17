import 'package:flutter/material.dart';
import 'package:my_calculator/enums/operations.type.dart';
import 'package:my_calculator/pages/history.page.dart';
import 'package:my_calculator/widgets/buton.widget.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  late String displayNumber;
  late List<String> history;
  OperationTypeEnum? operationType;

  @override
  void initState() {
    displayNumber = "0";
    history = [];
    super.initState();
  }

  void setOperationType(OperationTypeEnum newType) {
    setState(() {
      if (displayNumber.isNotEmpty) {
        if (newType.symbol ==
            displayNumber.substring(displayNumber.length - 1)) {
          return;
        } else if (([
          '/',
          '-',
          '+',
          '*',
        ].contains(displayNumber.substring((displayNumber.length - 1))))) {
          return;
        }
      }

      displayNumber += newType.symbol;
      operationType = newType;
    });
  }

  void clearValues() {
    setState(() {
      displayNumber = "0";
      operationType = null;
    });
  }

  void clearOneValue() {
    setState(() {
      if (displayNumber.isNotEmpty) {
        String value = displayNumber.substring(0, (displayNumber.length - 1));
        String removed = displayNumber.substring((displayNumber.length - 1));
        displayNumber = value;
        if (removed == '+' ||
            removed == '-' ||
            removed == '*' ||
            removed == '/') {
          operationType = null;
        }
      }
      return;
    });
  }

  void writeValue(String value) {
    setState(() {
      if (displayNumber == "0" && value != ",") {
        displayNumber = value;
        return;
      } else if (displayNumber.isNotEmpty) {
        if (displayNumber[displayNumber.length - 1] == "," && value == ",") {
          return;
        }
      }
      displayNumber += value;
    });
  }

  List<double> parseNumbers(String expression) {
    RegExp regExp = RegExp(r'[0-9]+\.?[0-9]*');

    var matches = regExp.allMatches(expression);

    List<double> numbers = [];

    for (var match in matches) {
      String numberText = match.group(0)!;
      numbers.add(double.parse(numberText));
    }
    return numbers;
  }

  List<OperationTypeEnum> parseOperators(String expression) {
    final characters = expression.characters.where(
      (x) => OperationTypeEnum.values.any((op) => op.symbol == x),
    );

    return characters
        .map((x) => OperationTypeEnum.values.firstWhere((op) => op.symbol == x))
        .toList();
  }

  void resolvePriorityOperation(
    List<double> numbers,
    List<OperationTypeEnum> operators,
  ) {
    int index = 0;

    while (index < operators.length) {
      if (operators[index] == OperationTypeEnum.multiplication) {
        numbers[index] = numbers[index] * numbers[index + 1];
        numbers.removeAt(index + 1);
        operators.removeAt(index);
      } else if (operators[index] == OperationTypeEnum.division) {
        numbers[index] = numbers[index] / numbers[index + 1];
        numbers.removeAt(index + 1);
        operators.removeAt(index);
      } else {
        index++;
      }
    }
  }

  double resolveAditionAndSubtraction(
    List<double> numbers,
    List<OperationTypeEnum> operators,
  ) {
    while (true) {
      if (operators.isEmpty || numbers.length == 1) {
        break;
      }
      if (operators[0] == OperationTypeEnum.addiction) {
        numbers[0] = numbers[0] + numbers[1];
        numbers.removeAt(1);
        operators.removeAt(0);
      } else {
        numbers[0] = numbers[0] - numbers[1];
        numbers.removeAt(1);
        operators.removeAt(0);
      }
    }

    return numbers[0];
  }

  void calculate() {
    if (operationType == null) {
      return;
    }
    String expression = displayNumber.replaceAll(',', '.');
    List<double> numbers = parseNumbers(expression);
    List<OperationTypeEnum> operators = parseOperators(expression);

    resolvePriorityOperation(numbers, operators);
    final result = resolveAditionAndSubtraction(numbers, operators);

    setState(() {
      displayNumber = result.toString().replaceAll('.', ',');
      operationType = null;
      history.add("$expression = $displayNumber");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculator"),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => HistoricPage(history: history),
                ),
              );
            },
            icon: Icon(Icons.history),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            height: 200,
            width: double.maxFinite,
            color: Colors.black12,
            child: Align(
              alignment: Alignment.bottomRight,
              child: Text(
                displayNumber,
                style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(height: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  ButtonWidget(
                    text: "C",
                    onPressed: () {
                      clearValues();
                    },
                    backgroundColor: Colors.redAccent,
                  ),
                  ButtonWidget(
                    text: "\u232B",
                    onPressed: () {
                      clearOneValue();
                    },
                    backgroundColor: Colors.orangeAccent,
                  ),
                  ButtonWidget(
                    text: "/",
                    onPressed: () {
                      setOperationType(OperationTypeEnum.division);
                    },
                    backgroundColor: Colors.lightBlue,
                    foregroundColor: Colors.white,
                  ),
                ],
              ),
              Row(
                children: [
                  ButtonWidget(
                    text: "7",
                    onPressed: () {
                      writeValue('7');
                    },
                    backgroundColor: Colors.white60,
                  ),
                  ButtonWidget(
                    text: "8",
                    onPressed: () {
                      writeValue('8');
                    },
                    backgroundColor: Colors.white60,
                  ),
                  ButtonWidget(
                    text: "9",
                    onPressed: () {
                      writeValue('9');
                    },
                    backgroundColor: Colors.white60,
                  ),
                  ButtonWidget(
                    text: "*",
                    onPressed: () {
                      setOperationType(OperationTypeEnum.multiplication);
                    },
                    backgroundColor: Colors.lightBlue,
                    foregroundColor: Colors.white,
                  ),
                ],
              ),
              Row(
                children: [
                  ButtonWidget(
                    text: "4",
                    onPressed: () {
                      writeValue('4');
                    },
                    backgroundColor: Colors.white60,
                  ),
                  ButtonWidget(
                    text: "5",
                    onPressed: () {
                      writeValue('5');
                    },
                    backgroundColor: Colors.white60,
                  ),
                  ButtonWidget(
                    text: "6",
                    onPressed: () {
                      writeValue('6');
                    },
                    backgroundColor: Colors.white60,
                  ),
                  ButtonWidget(
                    text: "-",
                    onPressed: () {
                      setOperationType(OperationTypeEnum.subtraction);
                    },
                    backgroundColor: Colors.lightBlue,
                    foregroundColor: Colors.white,
                  ),
                ],
              ),
              Row(
                children: [
                  ButtonWidget(
                    text: "1",
                    onPressed: () {
                      writeValue('1');
                    },
                    backgroundColor: Colors.white60,
                  ),
                  ButtonWidget(
                    text: "2",
                    onPressed: () {
                      writeValue('2');
                    },
                    backgroundColor: Colors.white60,
                  ),
                  ButtonWidget(
                    text: "3",
                    onPressed: () {
                      writeValue('3');
                    },
                    backgroundColor: Colors.white60,
                  ),
                  ButtonWidget(
                    text: "+",
                    onPressed: () {
                      setOperationType(OperationTypeEnum.addiction);
                    },
                    backgroundColor: Colors.lightBlue,
                    foregroundColor: Colors.white,
                  ),
                ],
              ),
              Row(
                children: [
                  ButtonWidget(
                    text: "0",
                    onPressed: () {
                      writeValue('0');
                    },
                    backgroundColor: Colors.white60,
                  ),
                  ButtonWidget(
                    text: ",",
                    onPressed: () {
                      writeValue(',');
                    },
                    backgroundColor: Colors.white60,
                  ),
                  ButtonWidget(
                    text: "=",
                    onPressed: () {
                      calculate();
                    },
                    backgroundColor: Colors.lightGreen,
                    foregroundColor: Colors.white,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
