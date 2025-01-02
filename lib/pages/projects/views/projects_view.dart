import 'package:flutter/material.dart';
import 'package:portfolio/utils/extensions/extensions.dart';
import 'package:portfolio/pages/wrapper.dart';

import 'subviews/project_list_page.dart';
import 'subviews/project_title_page.dart';

class ProjectsView extends StatefulWidget {
  const ProjectsView({super.key});

  @override
  State<ProjectsView> createState() => _ProjectsViewState();
}

class _ProjectsViewState extends State<ProjectsView> {
  @override
  Widget build(BuildContext context) {
    return Wrapper(
      page: const <Widget>[
        ProjectTitlePage(),
        ProjectListPage(),
      ].addListView(
        physics: const ClampingScrollPhysics(),
        scrollDirection: Axis.vertical,
      ),
    );
  }
}
