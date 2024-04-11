import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Calculo de Media",
      home: Calculadora(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Calculadora extends StatefulWidget {
  const Calculadora({super.key});

  @override
  State<Calculadora> createState() => _CalculadoraForm();
}

class _CalculadoraForm extends State<Calculadora> {
  TextEditingController _controllerP1 = TextEditingController();
  TextEditingController _controllerP2 = TextEditingController();
  TextEditingController _controllerQuiz = TextEditingController();
  TextEditingController _controllerOutros = TextEditingController();

  String _result = '';

  void _CalculaMedia(){
    if(_controllerP1.text.trim().isEmpty || _controllerP2.text.trim().isEmpty || _controllerQuiz.text.trim().isEmpty || _controllerOutros.text.trim().isEmpty){
      setState(() {
        _result = 'Por favor, preencha todos os campos';        
      });
    }
    else{
      double media = 0;
      final double P1 = double.parse(_controllerP1.text.trim());
      final double P2 = double.parse(_controllerP2.text.trim());
      final double Quiz = double.parse(_controllerQuiz.text.trim());
      final double Outros = double.parse(_controllerOutros.text.trim());

      
      if(P1 > 10 || P1 < 0 || P2 > 10 || P2 < 0 || Quiz > 10 || Quiz < 0 || Outros > 10 || Outros < 0){
        setState(() {
          _result = 'Digite apenas notas entre 0 e 10';        
        });
      }
      else{
        media = (P1 * 0.5) + (P2 * 0.3) + (Quiz * 0.1) + (Outros * 0.1);
        if(media >= 7){
          setState(() {
            _result = 'Aprovado (Média final: ${media.toStringAsFixed(2)})';        
          });
        }
        else if(media < 7 && media >= 5){
          setState(() {
            _result = 'Realizar Exame Final (Média final: ${media.toStringAsFixed(2)})';        
          });
        }
        else{
          setState(() {
            _result = 'Reprovado (Média final: ${media.toStringAsFixed(2)})';            
          });
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title:  const Text(
          'Calculadora de Médias',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white
          ),
          ),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: <Widget>
          [
            TextField(
              controller: _controllerP1,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'P1',
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: _controllerP2,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'P2'
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: _controllerQuiz,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Quiz'
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: _controllerOutros,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Outras avaliações'
              ),
            ),
            const SizedBox(height: 25),
            ElevatedButton(
              onPressed: _CalculaMedia,
              child: const Text('Calcular'),
                    style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll<Color>(Colors.blue),
                        foregroundColor: MaterialStatePropertyAll<Color>(Colors.white)
                    ),
            ),
            const SizedBox(height: 10),
            Text(
              '$_result',
              style: TextStyle(
                fontSize: 20
              ),
              )
          ],
        ),
      ),
    );
  }
}
