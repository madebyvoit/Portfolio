import 'package:go_router/go_router.dart';
import 'package:portfolio/views/aboutme/about_me.dart';
import 'package:portfolio/views/errorpage/errorpage.dart';
import 'package:portfolio/views/homepage/homepage.dart';
import 'package:portfolio/views/projects/projects_page.dart';
import 'package:portfolio/views/projects/subviews/project1/Project1.dart';

// GoRouter configuration
final router = GoRouter(
  initialLocation: '/',
  errorBuilder: (context, state) => ErrorPage(),
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => Homepage(),
    ),
    GoRoute(
      path: '/aboutme',
      builder: (context, state) => AboutMe(),
    ),
    GoRoute(
      path: '/projects',
      builder: (context, state) {
        return ProjectsPage();
      },
      //child routes to projects page
      routes: <RouteBase>[
        GoRoute(
            path: 'project1',
            builder: (context, state) {
              return Project1();
            }),
      ],
    ),
  ],
);
