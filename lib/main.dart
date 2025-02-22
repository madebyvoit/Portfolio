import 'package:flutter/material.dart';
import 'package:portfolio/routes/router.dart';
import 'package:portfolio/shared/data/constants.dart';
import 'package:portfolio/shared/utilities/functions/theme/theme_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => ThemeProvider(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: GlobalStrings.appName,
      theme: Provider.of<ThemeProvider>(context).themeData,
      routerConfig: router,
    );
  }
}
