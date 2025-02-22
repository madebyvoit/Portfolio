import 'package:flutter/material.dart';
import 'package:portfolio/shared/utilities/layout/responsive_layout.dart';
import 'package:portfolio/views/projects/responsive/desktop_projects_page.dart';
import 'package:portfolio/views/projects/responsive/mobile_projects_page.dart';
import 'package:portfolio/views/projects/responsive/tablet_projects_page.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileScaffold: MobileProjectsPage(),
      tabletScaffold: TabletProjectsPage(),
      desktopScaffold: DesktopProjectsPage(),
    );
  }
}
