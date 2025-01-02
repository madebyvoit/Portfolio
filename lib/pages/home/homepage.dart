import 'package:flutter/material.dart';
import 'package:portfolio/pages/home/views/desktop_homepage.dart';
import 'package:portfolio/pages/home/views/mobile_homepage.dart';
import 'package:portfolio/pages/home/views/tablet_homepage.dart';
import 'package:portfolio/utils/responsive_layout.dart';

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
