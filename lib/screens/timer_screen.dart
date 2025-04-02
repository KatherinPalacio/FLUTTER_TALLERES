import 'package:flutter/material.dart';
import 'dart:async';

class TimerScreen extends StatefulWidget {
  const TimerScreen({super.key});

  @override
  State<TimerScreen> createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  int _counter = 0;
  Timer? _timer;

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      setState(() => _counter++);
    });
  }

  void _pauseTimer() => _timer?.cancel();
  void _resetTimer() => setState(() => _counter = 0);

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Contador')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('$_counter', style: const TextStyle(fontSize: 48)),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _startTimer,
                  child: const Text('Iniciar'),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _pauseTimer,
                  child: const Text('Pausar'),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _resetTimer,
                  child: const Text('Reiniciar'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
