import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CombinedPage(),
    );
  }
}

class CombinedPage extends StatefulWidget {
  const CombinedPage({Key? key}) : super(key: key);

  @override
  _CombinedPageState createState() => _CombinedPageState();
}

class _CombinedPageState extends State<CombinedPage> {
  int _count = 0;
  TextEditingController _textEditingController = TextEditingController();

  void _decrement() {
    setState(() {
      if (_count > 0) {
        _count--;
      }
    });
  }

  void _increment() {
    setState(() {
      if (_count < 10) {
        _count++;
      }
    });
  }

  void _showInput(BuildContext context) {
    String inputText = _textEditingController.text;

    if (inputText.isEmpty) {
      _showAlertDialog(context, 'Erro', 'Por favor, digite algo!');
    } else {
      _showAlertDialog(context, 'Sucesso', 'Bem-vindo(a), $inputText!!!');
      // Limpar o campo de texto após a submissão bem-sucedida
      _textEditingController.clear();
    }
  }

  void _showAlertDialog(BuildContext context, String title, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Playground'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Pode Entrar',
              style: TextStyle(
                fontSize: 50,
                color: Colors.black,
                fontWeight: FontWeight.w200,
              ),
            ),
            const SizedBox(height: 40),
            Text(
              '$_count',
              style: const TextStyle(
                fontSize: 50,
                color: Colors.blue,
                fontWeight: FontWeight.w100,
              ),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: _decrement,
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.red,
                    fixedSize: const Size(100, 100),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  child: const Text(
                    'Sair',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                const SizedBox(width: 32),
                TextButton(
                  onPressed: _increment,
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.green,
                    fixedSize: const Size(100, 100),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  child: const Text(
                    'Entrou',
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 60),
            TextField(
              controller: _textEditingController,
              decoration: const InputDecoration(
                hintText: 'Digite seu primeiro nome...',
                labelText: 'Nome',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _showInput(context);
              },
              child: const Text('Enviar'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }
}
