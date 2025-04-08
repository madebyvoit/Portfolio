import 'package:flutter/material.dart';

class DesktopHomepageHero extends StatelessWidget {
  const DesktopHomepageHero({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height,
      width: MediaQuery.sizeOf(context).width,
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.sizeOf(context).height / 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Container(
                    height: MediaQuery.sizeOf(context).height / 2,
                    width: MediaQuery.sizeOf(context).width / 3.2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(400),
                      boxShadow: [
                        BoxShadow(
                          color: Theme.of(context).colorScheme.shadow,
                          blurRadius: 0,
                          spreadRadius: 0,
                        ),
                        BoxShadow(
                            color: Theme.of(context).colorScheme.onSecondary,
                            blurRadius: 20,
                            spreadRadius: -5),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.sizeOf(context).height / 8,
          ),
          Text(
            'Hello, I am',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ],
      ),
    );
  }
}
