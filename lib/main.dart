import 'package:flutter/material.dart';
import 'package:portfolio/portfolio/pages/homepage/homepage.dart';

void main() {
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'VoitNotes ☁️',
      home: HomePage(),
    );
  }
}
