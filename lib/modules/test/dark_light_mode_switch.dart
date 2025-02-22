import 'package:flutter/material.dart';
import 'package:portfolio/shared/utilities/functions/theme/theme_provider.dart';
import 'package:provider/provider.dart';

class DarkLightModeSwitch extends StatelessWidget {
  const DarkLightModeSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(8),
        ),
        width: 200,
        height: 200,
        padding: const EdgeInsets.all(50),
        child: GestureDetector(
          onTap: () {
            Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
          },
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.all(25),
            child: Center(
              child: Text(
                "Switch Mode",
                style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimaryContainer),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
