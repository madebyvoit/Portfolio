import 'package:flutter/material.dart';
import 'package:portfolio/sharedwidgets/centeredview.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //put background image here
      height: MediaQuery.of(context).size.height,
      child: CenteredView(
        child: Container(
          margin: const EdgeInsets.only(top: 60),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.red,
        ),
      ),
    );
  }
}

                         /*     ElevatedButton(
                                onPressed: () {
                                  Scrollable.ensureVisible(key2.currentContext!,
                                      curve: Curves.decelerate,
                                      duration: Durations.medium1);
                                },
                                child: Text('Scroll Down')), */