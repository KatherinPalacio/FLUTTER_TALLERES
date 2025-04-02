import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'screens/students_screen.dart';
import 'screens/timer_screen.dart';
import 'screens/heavy_task_screen.dart';

void main() => runApp(const MyApp());

final router = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => const HomeScreen()),
    GoRoute(
      path: '/students',
      builder: (context, state) => const StudentsScreen(),
    ),
    GoRoute(path: '/timer', builder: (context, state) => const TimerScreen()),
    GoRoute(
      path: '/heavy-task',
      builder: (context, state) => const HeavyTaskScreen(),
    ),
    // Eliminé la ruta duplicada de '/'
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      title: 'Taller 2 - Future/Timer/Isolate',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: const AppBarTheme(centerTitle: true, elevation: 4),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Taller 2'),
        backgroundColor: Colors.blue.shade800,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildNavigationButton(
              context,
              '/students',
              'Lista de Estudiantes (Future)',
              Icons.people,
              Colors.green,
            ),
            const SizedBox(height: 20),
            _buildNavigationButton(
              context,
              '/timer',
              'Contador (Timer)',
              Icons.timer,
              Colors.orange,
            ),
            const SizedBox(height: 20),
            _buildNavigationButton(
              context,
              '/heavy-task',
              'Tarea Pesada (Isolate)',
              Icons.work,
              Colors.red,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavigationButton(
    BuildContext context,
    String route,
    String text,
    IconData icon,
    Color color,
  ) {
    return SizedBox(
      width: 280,
      child: ElevatedButton.icon(
        icon: Icon(icon, size: 24),
        label: Text(text, style: const TextStyle(fontSize: 16)),
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: () => context.go(route),
      ),
    );
  }
}
