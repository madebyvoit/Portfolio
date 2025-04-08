import 'package:flutter/material.dart';

class DesktopHomepageEngraved extends StatelessWidget {
  const DesktopHomepageEngraved({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height,
      width: MediaQuery.sizeOf(context).width,
      child: Container(
        color: Theme.of(context).colorScheme.primary,
      ),
    );
  }
}
