import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Taller #2')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => context.go('/students'),
              child: const Text('Lista de Estudiantes (Future)'),
            ),
            ElevatedButton(
              onPressed: () => context.go('/timer'),
              child: const Text('Contador (Timer)'),
            ),
            ElevatedButton(
              onPressed: () => context.go('/heavy-task'),
              child: const Text('Tarea Pesada (Isolate)'),
            ),
          ],
        ),
      ),
    );
  }
}
