import 'package:flutter/material.dart';
import 'package:layout/layout.dart';
import 'package:portfolio/route/routes.dart';
import 'package:portfolio/utils/custom_scroll_behaviour.dart';
import 'package:portfolio/utils/extensions/theme_ex.dart';

void main() async {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: MaterialApp(
        title: 'Pascal Dohle Portfolio',
        scrollBehavior: AppScrollBehavior(),
        debugShowCheckedModeBanner: false,
        theme: context.theme(),
        initialRoute: initialRoute,
        onGenerateRoute: RouteGen.generateRoute,
      ),
    );
  }

  String get initialRoute => Routes.home;
}
