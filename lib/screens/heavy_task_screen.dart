import 'package:flutter/material.dart';
import 'dart:isolate';
import 'dart:async';

class HeavyTaskScreen extends StatefulWidget {
  const HeavyTaskScreen({super.key});

  @override
  State<HeavyTaskScreen> createState() => _HeavyTaskScreenState();
}

class _HeavyTaskScreenState extends State<HeavyTaskScreen> {
  bool _isRunning = false;
  String _result = '';

  Future<void> _runHeavyTask() async {
    setState(() {
      _isRunning = true;
      _result = 'Calculando...';
    });

    final receivePort = ReceivePort();
    await Isolate.spawn(_calculateSum, receivePort.sendPort);

    receivePort.listen((message) {
      if (!mounted) return; // Evita errores si el widget no está activo
      setState(() {
        _result = 'Suma: $message';
        _isRunning = false;
      });
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Resultado: $message')));
    });
  }

  static void _calculateSum(SendPort sendPort) {
    int sum = 0;
    for (int i = 1; i <= 2000000; i++) {
      sum += i;
    }
    sendPort.send(sum);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tarea Pesada')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_result, style: const TextStyle(fontSize: 24)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _isRunning ? null : _runHeavyTask,
              child: const Text('Ejecutar Tarea'),
            ),
          ],
        ),
      ),
    );
  }
}
