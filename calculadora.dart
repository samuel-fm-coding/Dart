import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora',
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Calculadora',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white
              ),
            ),
            centerTitle: true,
            backgroundColor: Colors.red,
        ),
        body: Calculadora(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Calculadora extends StatefulWidget {
  const Calculadora({super.key});

  @override
  State<Calculadora> createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {
  final TextEditingController _controlador1 = TextEditingController();
  final TextEditingController _controlador2 = TextEditingController();
  String exibir = '';

  void Calcular(String operador){
    if(_controlador1.text.trim() == '' || _controlador2.text.trim() == ''){
      setState(() {
        exibir = 'Preencha todos os campos';        
      });
    }
    else{
      double numero1 = double.parse(_controlador1.text.trim());
      double numero2 = double.parse(_controlador2.text.trim());
      double resultado = 0;

      switch(operador){
        case '+':
          resultado = numero1 + numero2;
          break;
        case '-':
          resultado = numero1 - numero2;
          break;
        case '*':
          resultado = numero1 * numero2;
          break;
        case '/':
          resultado = numero1 / numero2;
          break;
        default:
          resultado = 0.0;
          break;
      }

      setState(() {
        exibir = '${resultado.toStringAsFixed(2)}';        
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(50),
      child: Column(
        children: <Widget>[
          SizedBox(
            width: 300, // Definindo a largura desejada para os TextField
            child: TextField(
              controller: _controlador1,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Digite um número',
              ),
            ),
          ),
          const SizedBox(height: 10,),
          SizedBox(
            width: 300, // Definindo a largura desejada para os TextField
            child: TextField(
              controller: _controlador2,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Digite outro número',
              ),
            ),
          ),
          const SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextButton(
                onPressed: (){
                  Calcular('+');
                },
                child: const Text('+'),
                style: TextButton.styleFrom(
                    backgroundColor: Colors.red,
                    fixedSize: const Size(50, 50),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24)
                    ),
                ),
              ),
              const SizedBox(width: 10),
              TextButton(
                onPressed: () {
                  Calcular('-');
                },
                child: const Text('-'),
                style: TextButton.styleFrom(
                    backgroundColor: Colors.red,
                    fixedSize: const Size(50, 50),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24)
                    ),
                ),
              ),
              const SizedBox(width: 10),
              TextButton(
                onPressed: () {
                  Calcular('*');
                },
                child: const Text('X'),
                style: TextButton.styleFrom(
                    backgroundColor: Colors.red,
                    fixedSize: const Size(50, 50),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24)
                    ),
                ),
              ),
              const SizedBox(width: 10),
              TextButton(
                onPressed: () {
                  Calcular('/');
                },
                child: const Text('/'),
                style: TextButton.styleFrom(
                    backgroundColor: Colors.red,
                    fixedSize: const Size(50, 50),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24)
                    ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20,),
          Text(
            '$exibir',
            style: TextStyle(
              fontSize: 20,
            ),
          )
        ],
      ),
    );
  }
}
