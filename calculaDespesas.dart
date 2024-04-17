import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cálculo de Despesas',
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Cálculo de Despesas',
              style: TextStyle(
                color: Colors.white
              ),
            ),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: CalculaDespesa(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class CalculaDespesa extends StatefulWidget {
  const CalculaDespesa({super.key});

  @override
  State<CalculaDespesa> createState() => _CalculaDespesaState();
}

class _CalculaDespesaState extends State<CalculaDespesa> {
  final TextEditingController _controladorSalario = TextEditingController();
  final TextEditingController _controladorImposto = TextEditingController();
  final TextEditingController _controladorDespesa = TextEditingController();
  String exibir = '';

  void Verificar(){
    final double salario = double.tryParse(_controladorSalario.text.trim()) ?? -1;
    final double imposto = double.tryParse(_controladorImposto.text.trim()) ?? -1;
    final double despesa = double.tryParse(_controladorDespesa.text.trim()) ?? -1;

    if(_controladorSalario.text.trim() == '' || _controladorImposto.text.trim() == '' || _controladorDespesa.text.trim() == ''){
      setState(() {
          exibir = 'Preencha todos os campos';    
      });
    }
    else if(salario < 0 || imposto < 0 || despesa < 0){
      setState(() {
          exibir = 'Preencha apenas com valores positivos';        
      });
    }
    else{
      CalcularDespesas(salario, imposto, despesa);
    }
  }

  void CalcularDespesas(double salario, double impostos, double despesas){
    double resultado = salario - impostos - despesas;

    setState(() {
      exibir = 'Após pagar os impostos e suas despesas pessoais, você terá R\$ ${resultado.toStringAsFixed(2)}';      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: <Widget>[
          TextField(
            controller: _controladorSalario,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'Insira seu salário'
            ),
          ),
          const SizedBox(height: 15),
          TextField(
            controller: _controladorImposto,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'Quanto você paga de imposto ?'
            ),
          ),
          const SizedBox(height: 15),
          TextField(
            controller: _controladorDespesa,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'Quanto você gasta com despesas pessoais ?'
            ),
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: Verificar,
                child: const Text('Calcular'),
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll<Color>(Colors.blue),
                  foregroundColor: MaterialStatePropertyAll<Color>(Colors.white)
                ),
              ),
            ],
          ),
          const SizedBox(height: 20,),
          Text(exibir)
        ],
      ),
    );
  }
}
