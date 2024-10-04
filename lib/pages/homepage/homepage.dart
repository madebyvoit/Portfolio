import 'package:flutter/material.dart';
import 'package:portfolio/pages/homepage/desktop_homepage.dart';
import 'package:portfolio/pages/homepage/mobile_homepage.dart';
import 'package:portfolio/pages/homepage/tablet_homepage.dart';
import 'package:portfolio/utils/responsive/responsive_layout.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
      mobileBody: MobileHomepage(),
      tabletBody: TabletHomepage(),
      dekstopBody: DesktopHomepage(),
    );
  }
}
