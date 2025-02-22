import 'package:flutter/material.dart';
import 'package:portfolio/shared/data/constants.dart';

class ThankYou extends StatelessWidget {
  const ThankYou({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 800,
      width: MediaQuery.sizeOf(context).width,
      child: Center(
        child: Text(
          'Thank You',
          style: CustomStyle.bebasneue(fontSize: 200),
        ),
      ),
    );
  }
}
