import 'package:flutter/material.dart';
import 'package:portfolio/modules/footer/footer.dart';
import 'package:portfolio/modules/homepage/homepage_hero/desktop_homepage_hero.dart';
import 'package:portfolio/modules/homepage/homepage_thankyou/thank_you.dart';
import 'package:portfolio/modules/homepage/homepage_timeline/desktop_timeline.dart';
import 'package:portfolio/modules/navigation_bar/desktop_navbar/desktop_navbar.dart';

class DesktopHomepage extends StatefulWidget {
  const DesktopHomepage({super.key});

  @override
  State<DesktopHomepage> createState() => _DesktopHomepageState();
}

class _DesktopHomepageState extends State<DesktopHomepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: DesktopNavbar(
          webBody: SingleChildScrollView(
        child: Column(
          children: [
            DesktopHomepageHero(),
            DesktopTimeline(),
            ThankYou(),
            Footer(),
          ],
        ),
      )),
    );
  }
}
