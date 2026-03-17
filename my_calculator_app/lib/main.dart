import 'package:flutter/material.dart';
import 'package:my_calculator/pages/calculator.page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.lightBlueAccent),
        useMaterial3: true,
      ),
      home: CalculatorPage(),
    );
  }
}
