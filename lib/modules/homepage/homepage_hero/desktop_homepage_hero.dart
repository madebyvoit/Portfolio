import 'package:flutter/material.dart';

class DesktopHomepageHero extends StatelessWidget {
  const DesktopHomepageHero({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height,
      width: MediaQuery.sizeOf(context).width,
      child: Center(
        child: Text('Hero Page'),
      ),
    );
  }
}
