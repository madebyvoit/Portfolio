import 'package:flutter/material.dart';
import 'package:portfolio/constants/responsivelayer.dart';
import 'package:portfolio/portfolio/pages/aboutme/dekstop_aboutme.dart';
import 'package:portfolio/portfolio/pages/aboutme/mobile_aboutme.dart';

class AboutMe extends StatefulWidget {
  const AboutMe({Key? key}) : super(key: key);

  @override
  State<AboutMe> createState() => _AboutMe();
}

class _AboutMe extends State<AboutMe> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ResponsiveLayout(
        mobileBody: MobileAboutMe(), 
        desktopBody: DesktopAboutMe())
    );
  }
}