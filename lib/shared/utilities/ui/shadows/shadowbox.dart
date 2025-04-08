import 'package:flutter/material.dart';

class Shadowbox extends StatelessWidget {
  const Shadowbox({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height,
      width: MediaQuery.sizeOf(context).width,
      child: Center(
        child: Container(
          height: MediaQuery.sizeOf(context).height * 0.8,
          width: MediaQuery.sizeOf(context).width * 0.8,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).colorScheme.shadow,
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Center(
            child: Text(
              'Welcome to My Portfolio',
              style: TextStyle(
                fontSize: 40,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
          ),
        )
      ),
    );
  }
}
