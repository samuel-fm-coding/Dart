import 'package:flutter/material.dart';
import 'dart:math' as math;

void main() {
  runApp(MaterialApp(
    home: CalculatorApp(),
  ));
}

class CalculatorApp extends StatefulWidget {
  @override
  _CalculatorAppState createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  TextEditingController num1Controller = TextEditingController();
  TextEditingController num2Controller = TextEditingController();
  String result = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: num1Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Número 1',
              ),
            ),
            SizedBox(height: 20.0),
            TextField(
              controller: num2Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Número 2',
              ),
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                buildOperationButton('+'),
                buildOperationButton('-'),
                buildOperationButton('*'),
                buildOperationButton('/'),
              ],
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                buildOperationButton('√'),
                buildOperationButton('x²'),
                buildOperationButton('log'),
                buildOperationButton('sin'),
              ],
            ),
            SizedBox(height: 20.0),
            Text(
              'Resultado: $result',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildOperationButton(String label) {
    return ElevatedButton(
      onPressed: () {
        calculate(label);
      },
      child: Text(label),
    );
  }

  void calculate(String operation) {
    double num1 = double.tryParse(num1Controller.text) ?? 0.0;
    double num2 = double.tryParse(num2Controller.text) ?? 0.0;
    double calculatedResult = 0.0;

    setState(() {
      switch (operation) {
        case '+':
          calculatedResult = num1 + num2;
          break;
        case '-':
          calculatedResult = num1 - num2;
          break;
        case '*':
          calculatedResult = num1 * num2;
          break;
        case '/':
          calculatedResult = num1 / num2;
          break;
        case '√':
          calculatedResult = math.sqrt(num1);
          break;
        case 'x²':
          calculatedResult = math.pow(num1, 2);
          break;
        case 'log':
          calculatedResult = math.log(num1);
          break;
        case 'sin':
          calculatedResult = math.sin(num1);
          break;
        // Adicionar mais casos para outras operações como cos, tan, etc.
        default:
          calculatedResult = 0.0;
          break;
      }
      result = calculatedResult.toStringAsFixed(2); // Formatando para duas casas decimais
    });
  }
}
