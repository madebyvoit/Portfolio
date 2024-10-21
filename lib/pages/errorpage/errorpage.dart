import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/pages/errorpage/desktop_errorpage.dart';
import 'package:portfolio/pages/errorpage/mobile_errorpage.dart';
import 'package:portfolio/pages/errorpage/tablet_errorpage.dart';
import 'package:portfolio/utils/responsive/responsive_layout.dart';

class ErrorPage extends StatelessWidget {
  final GoException? errorstate;
  const ErrorPage({super.key, required this.errorstate});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
      mobileBody: MobileErrorpage(),
      tabletBody: TabletErrorpage(),
      dekstopBody: DesktopErrorpage(),
    );
  }
}
