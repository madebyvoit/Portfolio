import 'package:flutter/material.dart';
import 'package:portfolio/modules/homepage/homepage_timeline/models/mobile_timeline_tile.dart';

class MobileTimeline extends StatelessWidget {
  const MobileTimeline({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50.0),
        child: ListView(
          children: [
            MobileTimelineTile(
              isEducation: false,
              isFirst: true,
              isLast: false,
              isPast: true,
              eventCardHeader: Text('This is Data'),
              eventCardText: Text('this is such wonderful Data'),
            ),
            MobileTimelineTile(
              isEducation: false,
              isFirst: false,
              isLast: false,
              isPast: true,
              eventCardHeader: Text('This is Data'),
              eventCardText: Text('this is such wonderful Data'),
            ),
            MobileTimelineTile(
              isEducation: false,
              isFirst: false,
              isLast: false,
              isPast: true,
              eventCardHeader: Text('This is Data'),
              eventCardText: Text('this is such wonderful Data'),
            ),
            MobileTimelineTile(
              isEducation: false,
              isFirst: false,
              isLast: true,
              isPast: false,
              eventCardHeader: Text('This is Data'),
              eventCardText: Text('this is such wonderful Data'),
            ),
          ],
        ),
      ),
    );
  }
}
