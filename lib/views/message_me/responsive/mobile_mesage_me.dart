import 'package:flutter/material.dart';
import 'package:portfolio/modules/navigation_bar/mobile_navbar/mobile_navbar.dart';

class MobileMesageMe extends StatefulWidget {
  final int pageIndex;
  const MobileMesageMe({super.key, required this.pageIndex});

  @override
  State<MobileMesageMe> createState() => _MobileMesageMeState();
}

class _MobileMesageMeState extends State<MobileMesageMe> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Theme.of(context).colorScheme.surface,
        child: Text('Message Me'),
      ),
      bottomNavigationBar: MobileNavbar(
        pageIndex: widget.pageIndex,
      ),
    );
  }
}
