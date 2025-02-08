import 'package:flutter/material.dart';
import 'package:portfolio/utils/theme_provider.dart';
import 'package:provider/provider.dart'; 
import 'package:layout/layout.dart';
import 'package:portfolio/route/routes.dart';
import 'package:portfolio/utils/custom_scroll_behaviour.dart';

void main() async {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MainApp(),
    ),
  );
    
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: MaterialApp(
        title: '☁️Pascal Dohle - Portfolio☁️',
        scrollBehavior: AppScrollBehavior(),
        debugShowCheckedModeBanner: false,
        theme: Provider.of<ThemeProvider>(context).themeData,
        initialRoute: initialRoute,
        onGenerateRoute: RouteGen.generateRoute,
      ),
    );
  }

  String get initialRoute => Routes.home;
}
