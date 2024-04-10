import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Conversor de Temperatura",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ConversorForm(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ConversorForm extends StatefulWidget {
  const ConversorForm({super.key});

  @override
  State<ConversorForm> createState() => _ConversorFormState();
}

class _ConversorFormState extends State<ConversorForm> {
  final TextEditingController _conversor = TextEditingController();
  String _result = '';

  void _convertToCelsius(){
    if(_conversor.text.trim() == ''){
      setState(() {
        _result = 'Digite uma temperatura válida';
      });
    }

    final double temperature = double.parse(_conversor.text);

    final double temp_celsius = (temperature - 32) * 5/9;

    setState(() {
      _result = 'Temperatura em graus Celsius: ${temp_celsius.toStringAsFixed(0)} ºC';
    });
  }

  void _convertToFahrenheit(){
    if(_conversor.text.trim() == ''){
      setState(() {
        _result = 'Digite uma temperatura válida';
      });
    }

    final double temperature = double.parse(_conversor.text);

    final double temp_fahrenheit = (temperature * 9/5) + 32;

    setState(() {
      _result = 'Temperatura em graus Fahrenheit: ${temp_fahrenheit.toStringAsFixed(0)} ºF';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
            'Conversor de Temperaturas',
          style: TextStyle(
            color: Colors.white
          ),
        ),
        backgroundColor: Colors.black,
      ),
        body: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: <Widget>[
              TextField(
                controller: _conversor,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Sua temperatura',
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: _convertToCelsius,
                      child: const Text('Celsius'),
                    style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll<Color>(Colors.blue),
                        foregroundColor: MaterialStatePropertyAll<Color>(Colors.white)
                    ),
                    ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                      onPressed: _convertToFahrenheit,
                      child: const Text('Fahrenheit'),
                      style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll<Color>(Colors.blue),
                        foregroundColor: MaterialStatePropertyAll<Color>(Colors.white)
                      ),
                  ),
                ]
              ),
              const SizedBox(height: 20,),
              Text(
                  '$_result',
                style: TextStyle(
                  fontSize: 35
                ),

              ),
            ],
          ),
        ),
    );
  }
}
