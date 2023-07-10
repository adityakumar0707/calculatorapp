import 'package:calculator/CalculatorButton.dart';
import 'package:calculator/ResultDisplay.dart';
import 'package:flutter/material.dart';


class Calculation extends StatefulWidget {
  const Calculation({Key? key}) : super(key: key);

  @override
  State<Calculation> createState() => _CalculationState();
}

class _CalculationState extends State<Calculation> {
  double? width;
  int? firstOperand;
  String? operator;
  int? secondOperand;
  int? result;
  @override
  void didChangeDependencies() {
    width = MediaQuery.of(context).size.width;
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(

      child: Column(
          children: [
            ResultDisplay(text: DisplayText()),
            Row(
              children: [
                Expanded(child: _getButton(text: '7', onTap: () => numberPressed(7))),
                Expanded(child: _getButton(text: '8', onTap: () => numberPressed(8))),
                Expanded(child: _getButton(text: '9', onTap: () => numberPressed(9))),
                Expanded(child: _getButton(text: 'x', onTap: () => operatorPressed('*'), backgroundColor: Color.fromRGBO(220, 220, 220, 1))),
              ],
            ),
            Row(
              children: [
                Expanded(child: _getButton(text: '4', onTap: () => numberPressed(4))),
                Expanded(child: _getButton(text: '5', onTap: () => numberPressed(5))),
                Expanded(child: _getButton(text: '6', onTap: () => numberPressed(6))),
                Expanded(child: _getButton(text: '/', onTap: () => operatorPressed('/'), backgroundColor: Color.fromRGBO(220, 220, 220, 1))),
              ],
            ),
            Row(
              children: [
                Expanded(child: _getButton(text: '1', onTap: () => numberPressed(1))),
                Expanded(child: _getButton(text: '2', onTap: () => numberPressed(2))),
                Expanded(child: _getButton(text: '3', onTap: () => numberPressed(3))),
                Expanded(child: _getButton(text: '+', onTap: () => operatorPressed('+'), backgroundColor: Color.fromRGBO(220, 220, 220, 1)))
              ],
            ),
            Row(
              children: [
                Expanded(child: _getButton(text: '=', onTap: calculateResult, backgroundColor: Colors.orange, textColor: Colors.white)),
                Expanded(child: _getButton(text: '0', onTap: () => numberPressed(0))),
                Expanded(child: _getButton(text: 'C', onTap: clear, backgroundColor: Color.fromRGBO(220, 220, 220, 1))),
                Expanded(child: _getButton(text: '-', onTap: () => operatorPressed('-'),backgroundColor: Color.fromRGBO(220, 220, 220, 1))),
              ],
            ),
          ],
        ),
    );
  }
  numberPressed(int number) {
    setState(() {
      if (result != null) {
        result = null;
        firstOperand = number;
        return;
      }
      if (firstOperand == null) {
        firstOperand = number;
        return;
      }
      if (operator == null) {
        firstOperand = int.parse('$firstOperand$number');
        return;
      }
      if (secondOperand == null) {
        secondOperand = number;
        return;
      }
      secondOperand = int.parse('$secondOperand$number');
    });
  }

  operatorPressed(String operator) {
    setState(() {
      if (firstOperand == null) {
        firstOperand = 0;
      }
      this.operator = operator;
    });
  }
  calculateResult() {
    if (operator == null || secondOperand == null) {
      return;
    }
    setState(() {
      switch (operator) {
        case '+':
          result = firstOperand !+ secondOperand!;
          break;
        case '-':
          result = firstOperand !- secondOperand!;
          break;
        case '*':
          result = firstOperand !* secondOperand!;
          break;
        case '/':
          if (secondOperand == 0) {
            return;
          }
          result = firstOperand !~/ secondOperand!;
          break;
      }

      firstOperand = result;
      operator = null;
      secondOperand = null;
      result = null;
    });
  }

  clear()
  {
    setState((){
      result = null;
      operator = null;
      secondOperand = null;
      firstOperand = null;
    });
  }

  DisplayText(){
    if (result != null) {
      return '$result';
    }

    if (secondOperand != null) {
      return '$firstOperand$operator$secondOperand';
    }

    if (operator != null) {
      return '$firstOperand$operator';
    }

    if (firstOperand != null) {
      return '$firstOperand';
    }

    return '0';

  }
  Widget _getButton({String? text, void Function()? onTap,double width=90, Color backgroundColor = Colors.white, Color textColor = Colors.black}) {
  return CalculatorButton(
  label: text,
  onTap: onTap,
  size: width,
  backgroundColor: backgroundColor,
  labelColor: textColor,
  );
  }
}

/*Widget _getButton({String? text,void Function()? onTap, Color backgroundColor = Colors.white, Color textColor = Colors.black}) {
  return CalculatorButton(
    label: text,
    onTap: onTap,
    size: 90,
    backgroundColor: backgroundColor,
    labelColor: textColor,
  );
}*/




