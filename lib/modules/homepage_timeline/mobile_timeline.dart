import 'package:flutter/material.dart';
import 'package:portfolio/modules/homepage_timeline/models/mobile_timeline_tile.dart';
import 'package:portfolio/shared/data/constants.dart';

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
              isFirst: true,
              isLast: false,
              isPast: true,
              eventCard: Text("OrderPlaced"),
            ),
            MobileTimelineTile(
              isFirst: false,
              isLast: false,
              isPast: true,
              eventCard: Text(
                "OrderPlaced",
                style: CustomStyle.mavenpro(
                    color: Theme.of(context).colorScheme.onPrimary),
              ),
            ),
            MobileTimelineTile(
              isFirst: false,
              isLast: false,
              isPast: true,
              eventCard: Text("OrderPlaced"),
            ),
            MobileTimelineTile(
              isFirst: false,
              isLast: true,
              isPast: false,
              eventCard: Text("OrderPlaced"),
            ),
          ],
        ),
      ),
    );
  }
}
