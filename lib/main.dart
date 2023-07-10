import 'package:calculator/Calculation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Basic Calculator',
      home: Scaffold(
        body: SafeArea(
        child: Calculation(),
        ),
      ),
    );
  }
}




