import 'package:flutter/material.dart';
import 'package:portfolio/modules/footer/desktop_footer.dart';
import 'package:portfolio/modules/homepage/homepage_aboutme/desktop_homepage_aboutme.dart';
import 'package:portfolio/modules/homepage/homepage_engraved/desktop_homepage_engraved.dart';
import 'package:portfolio/modules/homepage/homepage_hero/desktop_homepage_hero.dart';
import 'package:portfolio/modules/homepage/homepage_projects/desktop_homepage_projects.dart';
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
            DesktopHomepageAboutme(),
            DesktopTimeline(),
            DesktopHomepageProjects(),
            DesktopHomepageEngraved(),
            ThankYou(),
            DesktopFooter(),
          ],
        ),
      )),
    );
  }
}
