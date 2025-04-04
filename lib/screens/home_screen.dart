import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenStateWithTabs();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    print('HomeScreen - initState() llamado');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('HomeScreen - didChangeDependencies() llamado');
  }

  @override
  void dispose() {
    print('HomeScreen - dispose() llamado');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('HomeScreen - build() llamado');
    return Scaffold(
      appBar: AppBar(title: const Text('Pantalla Principal')),
      body: Center(
        child: ElevatedButton(
          child: const Text('Ir a Detalles'),
          onPressed: () {
            // Navegación se implementará después
          },
        ),
      ),
    );
  }
}

// ignore: non_constant_identifier_names, unused_element
class _HomeScreenStateWithTabs extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<String> items = List.generate(20, (index) => 'Item ${index + 1}');

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    print('HomeScreen - initState() llamado');
  }

  // ... (otros métodos iguales)

  @override
  Widget build(BuildContext context) {
    print('HomeScreen - build() llamado');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pantalla Principal'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(icon: Icon(Icons.home), text: 'Inicio'),
            Tab(icon: Icon(Icons.list), text: 'Lista'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Center(
            child: ElevatedButton(
              child: const Text('Ir a Detalles'),
              onPressed: () {
                context.go(
                  '/detail',
                  extra: 'Hola desde la pantalla principal',
                );
              },
            ),
          ),
          GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.0,
            ),
            itemCount: items.length,
            itemBuilder: (context, index) {
              return Card(child: Center(child: Text(items[index])));
            },
          ),
        ],
      ),
      // Tercer widget: FloatingActionButton
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            print('HomeScreen - setState() llamado');
            items.add('Item ${items.length + 1}');
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

extension on BuildContext {
  void go(String s, {required String extra}) {}
}
