import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// Pantalla de detalle que muestra una imagen de la raza
class DogDetailScreen extends StatelessWidget {
  final String breed;

  const DogDetailScreen({super.key, required this.breed});

  Future<String> fetchImageUrl() async {
    final url = Uri.parse('https://dog.ceo/api/breed/$breed/images/random');
    final response = await http.get(url);
    final data = json.decode(response.body);
    return data['message'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Detalle de $breed')),
      body: FutureBuilder<String>(
        future: fetchImageUrl(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error al cargar imagen'));
          } else {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(snapshot.data!, height: 250),
                  const SizedBox(height: 20),
                  Text(
                    breed.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
