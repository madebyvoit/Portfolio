import 'package:go_router/go_router.dart';
import 'package:portfolio/pages/aboutme/aboutme.dart';
import 'package:portfolio/pages/errorpage/errorpage.dart';
import 'package:portfolio/pages/homepage/homepage.dart';


class Routes {
  // GoRouter Configurations
  static final router = GoRouter(
  initialLocation: '/',
  errorBuilder: (context, state) => ErrorPage(errorstate: state.error,),
  routes: [
    GoRoute(
      name: 'home', // Optional, add name to your routes. Allows you navigate by name instead of path
      path: '/',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      name: 'aboutpage',
      path: '/aboutpage',
      builder: (context, state) => Aboutme(),
    ),
  ],
);
}
