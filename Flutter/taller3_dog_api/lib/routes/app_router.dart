import 'package:go_router/go_router.dart';
//import 'package:taller3_dog_api/routes/dog_routes.dart';
import 'dog_route.dart';

final appRouter = GoRouter(initialLocation: '/dog', routes: [...dogRoutes]);
