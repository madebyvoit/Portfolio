import 'package:flutter/material.dart';

class ProjectPolaroid extends StatelessWidget {
  const ProjectPolaroid({super.key});

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.contain,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: 360,
            width: 280,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
          Positioned(
            top: 30,
            child: Container(
              height: 260,
              width: 240,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
          )
        ],
      ),
    );
  }
}
