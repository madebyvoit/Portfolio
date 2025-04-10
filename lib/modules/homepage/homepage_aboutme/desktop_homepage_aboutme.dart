import 'package:flutter/material.dart';

class DesktopHomepageAboutme extends StatelessWidget {
  const DesktopHomepageAboutme({super.key});

  @override
  Widget build(BuildContext context) {
    const String yourName = "Pascal Dohle aka. Voit"; // Replace with your name
    const String yourHeadline =
        "Passionate Software Developer & Game Designer"; // Replace with your headline
    const String yourBio =
        "Hello! I'm $yourName, a software developer and game designer based in Germany. "
        "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam "
        "erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus"
        "est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt"
        "Explore my portfolio to see some of my work!"; // Replace with your bio

    // IMPORTANT: Replace with the correct path to YOUR image in the assets folder
    // Make sure you have added the assets folder to your pubspec.yaml
    const String profileImagePath = 'assets/images/profile_picture.png';
    // ---------------------------------------------

    // Use MediaQuery to get screen size for potential responsiveness adjustments
    // (Although this basic example doesn't heavily rely on it yet)
    // final screenSize = MediaQuery.of(context).size;

    return Container(

      padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 60.0),
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
                  color:
                      Theme.of(context).colorScheme.primary, // Use theme color
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40), // Spacing

          // Profile Picture
          CircleAvatar(
            radius: 80, // Adjust size as needed
            backgroundColor: Theme.of(context).colorScheme.primary, // Fallback background color
            // Use AssetImage to load the image from your assets folder
            // It's good practice to handle potential loading errors,
            // but for simplicity, we assume the image exists.
            backgroundImage: AssetImage(profileImagePath),
            // If you want to add a fallback in case the image fails to load,
            // you might need a StatefulWidget or FutureBuilder,
            // but this setup keeps it simple as requested.
          ),
          const SizedBox(height: 30), // Spacing

          // Headline / Name
          Text(
            'Hello, I\'m $yourName!',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
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

          // Optional: Add more elements like skills chips, social links etc. here
          // Example using Wrap for skills (requires no external packages):
          // const SizedBox(height: 40),
          // Text('Key Skills', style: Theme.of(context).textTheme.titleLarge),
          // const SizedBox(height: 15),
          // Wrap(
          //   spacing: 12.0, // Horizontal gap between chips
          //   runSpacing: 8.0, // Vertical gap between lines
          //   alignment: WrapAlignment.center,
          //   children: const [
          //     Chip(label: Text('Flutter'), padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4)),
          //     Chip(label: Text('Dart'), padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4)),
          //     Chip(label: Text('UI/UX Design'), padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4)),
          //     Chip(label: Text('Firebase'), padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4)),
          //     Chip(label: Text('Responsive Design'), padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4)),
          //     // Add more skills
          //   ],
          // )
        ],
      ),
    );
  }
}
