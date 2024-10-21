import 'package:flutter/material.dart';
import 'package:portfolio/constants/values/values.dart';
import 'package:portfolio/route/routes.dart';
import 'package:portfolio/utils/scrollbehaviour/custom_scrollbehaviour.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: Strings.appName,
      debugShowCheckedModeBanner: false,
      scrollBehavior: AppScrollBehavior(),
      routerConfig: Routes.router,
    );
  }
}
