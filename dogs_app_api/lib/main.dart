import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class DogService {
  final String baseUrl = 'https://api.thedogapi.com/v1';

  Future<List<dynamic>> fetchDogBreeds() async {
    final response = await http.get(Uri.parse('$baseUrl/breeds'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to fetch dog breeds');
    }
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dog Breeds',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final DogService dogService = DogService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Raças de Cachorros'),
        backgroundColor: Colors.orange,
      ),
      body: FutureBuilder(
        future: dogService.fetchDogBreeds(),
        builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final List<dynamic> breeds = snapshot.data!;
            return ListView.builder(
              itemCount: breeds.length,
              itemBuilder: (context, index) {
                final breed = breeds[index];
                return ListTile(
                  title: Text(breed['name']),
                  textColor: Colors.red,
                );
              },
            );
          }
        },
      ),
    );
  }
}
