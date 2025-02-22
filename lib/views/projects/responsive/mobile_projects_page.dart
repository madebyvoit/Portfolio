import 'package:flutter/material.dart';
import 'package:portfolio/modules/navigation_bar/mobile_navbar/mobile_navbar.dart';

class MobileProjectsPage extends StatefulWidget {
  final int pageIndex;
  const MobileProjectsPage({super.key, required this.pageIndex});

  @override
  State<MobileProjectsPage> createState() => _MobileProjectsPageState();
}

class _MobileProjectsPageState extends State<MobileProjectsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Theme.of(context).colorScheme.surface,
          child: Text('Projects here')),
      bottomNavigationBar: MobileNavbar(pageIndex: widget.pageIndex),
    );
  }
}
