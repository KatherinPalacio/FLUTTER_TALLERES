import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  final String parametro;

  const DetailScreen({super.key, required this.parametro});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  void initState() {
    super.initState();
    print('DetailScreen - initState() llamado');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('DetailScreen - didChangeDependencies() llamado');
  }

  @override
  void dispose() {
    print('DetailScreen - dispose() llamado');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('DetailScreen - build() llamado');
    return Scaffold(
      appBar: AppBar(title: const Text('Pantalla de Detalles')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Parámetro recibido: ${widget.parametro}'),
            ElevatedButton(
              child: const Text('Regresar'),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    );
  }
}
