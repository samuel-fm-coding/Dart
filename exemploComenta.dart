import 'package:flutter/material.dart';

void main() => runApp(const SurveyApp());

class SurveyApp extends StatefulWidget {
  const SurveyApp({Key? key}) : super(key: key);

  @override
  SurveyAppState createState() => SurveyAppState();
}

class SurveyAppState extends State<SurveyApp> {
  String? _favoriteTransport = 'Carro'; // Valor inicial do combo-box
  String? _travelPreference = 'Sozinho'; // Valor inicial do radio-button

  //? pois pode receber valor vazio ou null

  final Map<String, bool> _workingDays = {
    'Segunda': false,
    'Terça': false,
    'Quarta': false,
    'Quinta': false,
    'Sexta': false,
  }; // Opções do check-box, todas inicialmente desmarcadas

  String _summary = '';

  void _generateSummary() {
    final workingDaysSelected = _workingDays.entries //entradas
        .where((entry) => entry.value) //se tiver marcado
        .map((entry) => entry.key)
        .join(', '); //separar por virgula e espaço

    //pegar dias trabalhados selecionados

    setState(() {
      _summary = 'Transporte favorito: $_favoriteTransport\n'
          'Prefere viajar: $_travelPreference\n'
          'Dias de trabalho: $workingDaysSelected';
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Pesquisa de Transporte'),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const Text(
                'Qual seu transporte favorito para ir ao trabalho?',
                style: TextStyle(fontSize: 18),
              ),
              //construção do dropdown
              DropdownButton<String>(
                value: _favoriteTransport,
                onChanged: (String? newValue) {
                  setState(() {
                    _favoriteTransport = newValue;
                  });
                },
                //opçoes para selecionar no dropdown
                items: <String>[
                  'Carro',
                  'Bicicleta',
                  'Ônibus',
                  'A pé',
                  'Trem'
                ].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(), //mapeamento dos textos para definir valor para cada e exibir as opções
              ),
              const Divider(), //separação/divisão dos itens em linha
              const Text(
                'Você prefere viajar sozinho ou em grupo?',
                style: TextStyle(fontSize: 18),
              ),
              //2 radiobutton = 2 ListTile
              ListTile(
                title: const Text('Sozinho'),
                leading: Radio<String>(
                  value: 'Sozinho',
                  groupValue: _travelPreference,
                  onChanged: (String? value) {
                    setState(() {
                      _travelPreference = value;
                    });
                  },
                ),
              ),
              ListTile(
                title: const Text('Em Grupo'),
                leading: Radio<String>(
                  value: 'Em Grupo',
                  groupValue: _travelPreference,
                  onChanged: (String? value) {
                    setState(() {
                      _travelPreference = value;
                    });
                  },
                ),
              ),
              const Divider(),
              const Text(
                'Quais dias você normalmente trabalha?',
                style: TextStyle(fontSize: 18),
              ),
              ..._workingDays.keys.map((String key) {
                return CheckboxListTile(
                  title: Text(key),
                  value: _workingDays[key], //definindo os valores de cada opção do check-box
                  onChanged: (bool? value) {
                    setState(() {
                      _workingDays[key] = value!;
                    });
                  },
                );
              }).toList(),
              const Divider(),
              ElevatedButton(
                onPressed: _generateSummary,
                child: const Text('Submeter'),
              ),
              const Divider(),
              if (_summary.isNotEmpty)
                Text(
                  _summary,
                  style: const TextStyle(fontSize: 16),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
