import 'package:flutter/material.dart';
import 'package:portfolio/modules/homepage/homepage_projects/models/projects_left_panel.dart';
import 'package:portfolio/modules/homepage/homepage_projects/models/projects_right_panel.dart';

class DesktopHomepageProjects extends StatelessWidget {
  const DesktopHomepageProjects({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 2850,
      width: MediaQuery.sizeOf(context).width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 250),
          ProjectsLeftPanel(),
          ProjectsRightPanel(),
          ProjectsLeftPanel(),
          ProjectsRightPanel(),
        ],
      ),
    );
  }
}
