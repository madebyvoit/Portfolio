import 'package:flutter/material.dart';
import 'package:portfolio/modules/navigation_bar/mobile_navbar/mobile_navbar.dart';

class MobileAboutMe extends StatefulWidget {
  final int pageIndex;
  const MobileAboutMe({super.key, required this.pageIndex});

  @override
  State<MobileAboutMe> createState() => _MobileAboutMeState();
}

class _MobileAboutMeState extends State<MobileAboutMe> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Theme.of(context).colorScheme.surface,
        child: Text('About Me'),
      ),
      bottomNavigationBar: MobileNavbar(
        pageIndex: widget.pageIndex,
      ),
    );
  }
}
