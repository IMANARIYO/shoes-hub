import 'package:go_router/go_router.dart';
import 'package:shoes_hub_mobile_app/features/home/presentation/categories_screen.dart';
import 'package:shoes_hub_mobile_app/features/home/presentation/category_detail_screen.dart';
import 'package:shoes_hub_mobile_app/features/home/presentation/home_screen.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(path: '/', builder: (context, state) => const HomeScreen()),
      GoRoute(
        path: '/categories',
        builder: (context, state) => const CategoriesScreen(),
      ),
      GoRoute(
        path: '/category/:id',
        builder: (context, state) {
          final id = state.pathParameters['id']!;
          return CategoryDetailScreen(categoryId: id);
        },
      ),
    ],
  );
}
