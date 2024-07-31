import 'package:flutter/material.dart';
import 'package:portfolio/constants/colors.dart';

class DesktopHomePage extends StatelessWidget {
  const DesktopHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          colorFilter: ColorFilter.mode(Pallete.paper, BlendMode.multiply),
          repeat: ImageRepeat.repeat,
          image: AssetImage('assets/images/shared/t_paper.png'),
          scale: 4,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment(0.0, 0.4),
                  end: Alignment(0.0, 2),
                  colors: [Colors.black12, Colors.black87])),
          alignment: Alignment.center,
          padding: const EdgeInsets.all(32),
          child: const TextField(
            decoration: InputDecoration(hintText: 'Email'),
          ),
        ),
      ),
    );
  }
}
