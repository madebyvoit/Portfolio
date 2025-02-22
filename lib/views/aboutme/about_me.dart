import 'package:flutter/material.dart';
import 'package:portfolio/shared/utilities/layout/responsive_layout.dart';
import 'package:portfolio/views/aboutme/responsive/dekstop_about_me.dart';
import 'package:portfolio/views/aboutme/responsive/mobile_about_me.dart';
import 'package:portfolio/views/aboutme/responsive/tablet_about_me.dart';

class AboutMe extends StatelessWidget {
  final int pageIndex = 2;
  const AboutMe({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileScaffold: MobileAboutMe(pageIndex: pageIndex),
      tabletScaffold: TabletAboutMe(),
      desktopScaffold: DekstopAboutMe(),
    );
  }
}
