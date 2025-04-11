import 'package:flutter/material.dart';
import 'package:portfolio/shared/utilities/containers/tabcontainer/tab_container.dart';

class DesktopHomepageAboutme extends StatelessWidget {
  const DesktopHomepageAboutme({super.key});

  @override
  Widget build(BuildContext context) {
    const String yourName = "Pascal Dohle aka. Voit";
    const String yourHeadline =
        "Passionate Software Developer & Game Designer"; 
    const String yourBio =
        "Hello! I'm $yourName, a software developer and game designer based in Germany. "
        "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam "
        "erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus"
        "est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt"
        "Explore my portfolio to see some of my work!";


    return Stack(
      children: [
        CustomShapeWidget(
          cornerRadius: 40,
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height,
          color: Theme.of(context).colorScheme.primary,
          tabSide: TabSide.top,
          shadowColor: Theme.of(context).colorScheme.shadow,
          customTabAlignment: CustomTabAlignment.end,
          tabLengthRatio: 0.4,
          tabDepthRatio: 0.08,
          shadowOffset: const Offset(0, 8), // Downwards shadow
          shadowBlur: 4.0,
        ),
        Column(
          children: [
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.2,
            ),
            Center(
              child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 40.0, vertical: 60.0),
                // Constrain the width for better readability on very wide screens
                constraints: const BoxConstraints(maxWidth: 900),
                alignment: Alignment.center, // Center the content horizontally
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment
                      .center, // Center items horizontally in the column
                  children: [
                    // Section Title
                    Text(
                      'About Me',
                      style: Theme.of(context).textTheme.displaySmall?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 40), // Spacing

                    // Profile Picture
                    CircleAvatar(
                      radius: 80, // Adjust size as needed
                      backgroundColor: Theme.of(context).colorScheme.secondary,
                      // Use AssetImage to load the image from your assets folder
                      // It's good practice to handle potential loading errors,
                      // but for simplicity, we assume the image exists.
                      // If you want to add a fallback in case the image fails to load,
                      // you might need a StatefulWidget or FutureBuilder,
                      // but this setup keeps it simple as requested.
                    ),
                    const SizedBox(height: 30), // Spacing

                    // Headline / Name
                    Text(
                      'Hello, I\'m $yourName!',
                      style:
                          Theme.of(context).textTheme.headlineMedium?.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8), // Spacing
                    Text(
                      yourHeadline,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: Colors.grey[700], // Slightly subdued color
                          ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 25), // Spacing

                    // Bio Paragraph
                    Text(
                      yourBio,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            height:
                                1.6, // Improves readability with increased line spacing
                            color: Colors.white,
                          ),
                      textAlign: TextAlign
                          .center, // Justify might also look good here: TextAlign.justify
                    ),
                  ],
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
