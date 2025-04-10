import 'package:flutter/material.dart';
import '../../services/dog_service.dart';
import '../../models/breed_model.dart';
import 'package:go_router/go_router.dart';

// Pantalla que muestra el listado de razas
class DogListScreen extends StatelessWidget {
  const DogListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Razas de Perros')),
      body: FutureBuilder<List<BreedModel>>(
        future: DogService.getBreeds(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final breeds = snapshot.data!;
            return ListView.builder(
              itemCount: breeds.length,
              itemBuilder: (context, index) {
                final breed = breeds[index];
                return ListTile(
                  title: Text(breed.name),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    context.push('/dog/${breed.name}');
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}
