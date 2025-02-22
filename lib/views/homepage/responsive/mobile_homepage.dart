import 'package:flutter/material.dart';
import 'package:portfolio/modules/homepage/homepage_timeline/mobile_timeline.dart';
import 'package:portfolio/modules/navigation_bar/mobile_navbar/mobile_navbar.dart';

class MobileHomepage extends StatefulWidget {
  final int pageIndex;
  const MobileHomepage({super.key, required this.pageIndex});

  @override
  State<MobileHomepage> createState() => _MobileHomepageState();
}

class _MobileHomepageState extends State<MobileHomepage> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MobileTimeline(),
      bottomNavigationBar: MobileNavbar(pageIndex: widget.pageIndex,),
    );
  }
}
