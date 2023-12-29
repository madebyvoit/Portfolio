import 'package:flutter/material.dart';
import 'package:portfolio/sharedwidgets/centeredview.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //put background image here
      height: MediaQuery.of(context).size.height,
      child: CenteredView(
        child: Container(
          margin: new EdgeInsets.symmetric(horizontal: 200),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.blue,
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