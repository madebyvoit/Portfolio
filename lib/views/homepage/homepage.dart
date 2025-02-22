import 'package:flutter/material.dart';
import 'package:portfolio/shared/utilities/layout/responsive_layout.dart';
import 'package:portfolio/views/homepage/responsive/desktop_homepage.dart';
import 'package:portfolio/views/homepage/responsive/mobile_homepage.dart';
import 'package:portfolio/views/homepage/responsive/tablet_homepage.dart';

class Homepage extends StatelessWidget {
  final int pageIndex = 0;
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileScaffold: MobileHomepage(pageIndex: pageIndex),
      tabletScaffold: TabletHomepage(),
      desktopScaffold: DesktopHomepage(),
    );
  }
}
