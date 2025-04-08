import 'package:flutter/material.dart';
import 'package:portfolio/modules/homepage/homepage_timeline/models/mobile_timeline_tile.dart';
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
              isEducation: false,
              isFirst: true,
              isLast: false,
              isPast: true,
              eventCardHeader: Text('This is Data'),
              eventCardAttribute: Text(
                'High School Graduation\nTheodor Heuss Gymnasium',
                style: CustomStyle.mono(),
              ),
              eventCardSubTitle: Text(
                'High School Graduation\nTheodor Heuss Gymnasium',
                style: CustomStyle.inter(),
              ),
            ),
            MobileTimelineTile(
              isEducation: false,
              isFirst: true,
              isLast: false,
              isPast: true,
              eventCardHeader: Text('This is Data'),
              eventCardAttribute: Text(
                'High School Graduation\nTheodor Heuss Gymnasium',
                style: CustomStyle.mono(),
              ),
              eventCardSubTitle: Text(
                'High School Graduation\nTheodor Heuss Gymnasium',
                style: CustomStyle.inter(),
              ),
            ),
            MobileTimelineTile(
              isEducation: false,
              isFirst: true,
              isLast: false,
              isPast: true,
              eventCardHeader: Text('This is Data'),
              eventCardAttribute: Text(
                'High School Graduation\nTheodor Heuss Gymnasium',
                style: CustomStyle.mono(),
              ),
              eventCardSubTitle: Text(
                'High School Graduation\nTheodor Heuss Gymnasium',
                style: CustomStyle.inter(),
              ),
            ),
            MobileTimelineTile(
              isEducation: false,
              isFirst: true,
              isLast: false,
              isPast: true,
              eventCardHeader: Text('This is Data'),
              eventCardAttribute: Text(
                'High School Graduation\nTheodor Heuss Gymnasium',
                style: CustomStyle.mono(),
              ),
              eventCardSubTitle: Text(
                'High School Graduation\nTheodor Heuss Gymnasium',
                style: CustomStyle.inter(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
