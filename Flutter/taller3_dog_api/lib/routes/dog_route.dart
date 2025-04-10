import 'package:go_router/go_router.dart';
import '../presentation/screens/dog_list_screen.dart';
import '../presentation/screens/dog_detail_screen.dart';

// Definición de rutas para el módulo de perros
final dogRoutes = [
  GoRoute(path: '/dog', builder: (context, state) => const DogListScreen()),
  GoRoute(
    path: '/dog/:breed',
    builder: (context, state) {
      final breed = state.pathParameters['breed']!;
      return DogDetailScreen(breed: breed);
    },
  ),
];
