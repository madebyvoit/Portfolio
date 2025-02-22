import 'package:flutter/material.dart';
import 'package:portfolio/modules/homepage_timeline/mobile_timeline.dart';

class MobileHomepage extends StatefulWidget {
  const MobileHomepage({super.key});

  @override
  State<MobileHomepage> createState() => _MobileHomepageState();
}

class _MobileHomepageState extends State<MobileHomepage> {
  @override
  Widget build(BuildContext context) {
    return MobileTimeline();
  }
}
