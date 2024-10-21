import 'package:flutter/material.dart';
import 'package:portfolio/pages/aboutme/desktop_aboutme.dart';
import 'package:portfolio/pages/aboutme/mobile_aboutme.dart';
import 'package:portfolio/pages/aboutme/tablet_aboutme.dart';
import 'package:portfolio/utils/responsive/responsive_layout.dart';

class Aboutme extends StatelessWidget {
  const Aboutme({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
      mobileBody: MobileAboutme(),
      tabletBody: TabletAboutme(),
      dekstopBody: DesktopAboutme(),
    );
  }
}