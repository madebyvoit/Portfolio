import 'package:flutter/material.dart';
import 'package:portfolio/portfolio/pages/homepage/dekstop_hompage.dart';
import 'package:portfolio/portfolio/pages/homepage/mobile_hompage.dart';
import 'package:portfolio/portfolio/pages/homepage/tablet_hompage.dart';
import 'package:portfolio/sharedwidgets/responsive/responsive_layout.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
        mobileBody: MobileHomePage(),
        tabletBody: TabletHomePage(),
        desktopBody: DesktopHomePage());
  }
}
