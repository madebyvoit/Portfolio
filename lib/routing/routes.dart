import 'package:go_router/go_router.dart';
import 'package:portfolio/pages/homepage/homepage.dart';

final GoRouter _router = GoRouter(
  routes: [
    GoRoute(
      path: "/",
      builder: (context, state) => const HomePage(),
    )
  ],
);
