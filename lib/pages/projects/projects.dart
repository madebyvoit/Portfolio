import 'package:flutter/material.dart';
import 'package:portfolio/pages/projects/desktop_projects.dart';
import 'package:portfolio/pages/projects/mobile_projects.dart';
import 'package:portfolio/pages/projects/tablet_projects.dart';
import 'package:portfolio/utils/responsive/responsive_layout.dart';

class Projects extends StatelessWidget {
  const Projects({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
      mobileBody: MobileProjects(),
      tabletBody: TabletProjects(),
      dekstopBody: DesktopProjects(),
    );
  }
}
