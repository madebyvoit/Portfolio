import 'package:flutter/material.dart';
import 'package:portfolio/modules/homepage_timeline/models/desktop_timeline_end_tile.dart';
import 'package:portfolio/modules/homepage_timeline/models/desktop_timeline_start_tile.dart';

class MobileTimeline extends StatelessWidget {
  const MobileTimeline({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50.0),
        child: ListView(
          children: [
            DesktopTimelineEndTile(
              isFirst: true,
              isLast: false,
              isPast: true,
              eventCard: Text("data"),
            ),
            DesktopTimelineStartTile(
              isFirst: false,
              isLast: false,
              isPast: true,
              eventCard: Text("data"),
            ),
            DesktopTimelineEndTile(
              isFirst: false,
              isLast: false,
              isPast: true,
              eventCard: Text("data"),
            ),
            DesktopTimelineStartTile(
              isFirst: false,
              isLast: true,
              isPast: false,
              eventCard: Text("data"),
            ),
          ],
        ),
      ),
    );
  }
}
