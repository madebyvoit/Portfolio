import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/modules/homepage/homepage_timeline/models/desktop_timeline_end_tile.dart';
import 'package:portfolio/modules/homepage/homepage_timeline/models/desktop_timeline_start_tile.dart';
import 'package:portfolio/shared/data/constants.dart';

class DesktopTimeline extends StatelessWidget {
  const DesktopTimeline({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50.0),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 150),
              Stack(
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: 80,
                    child: DottedLine(
                      lineThickness: 4,
                      dashColor: Theme.of(context).colorScheme.primary,
                      dashLength: 10,
                      dashGapLength: 10,
                      direction: Axis.vertical,
                      dashRadius: 10,
                    ),
                  ),
                  DesktopTimelineStartTile(
                    isFirst: true,
                    isLast: false,
                    isPast: true,
                    isEducation: true,
                    eventCardHeader: Text(
                      HomepageStrings.firstTimelineTitle,
                      style: CustomStyle.mavenpro(),
                    ),
                    eventCardAttribute: Text(
                      HomepageStrings.firstTimelineAttribute,
                      style: CustomStyle.mono(),
                    ),
                    eventCardSubTitle: Text(
                      HomepageStrings.firstTimelineSubtitle,
                      style: CustomStyle.inter(),
                    ),
                  )
                ],
              ),
              DesktopTimelineEndTile(
                isFirst: false,
                isLast: false,
                isPast: true,
                isEducation: true,
                eventCardHeader: Text(
                  HomepageStrings.secondTimelineTitle,
                  style: CustomStyle.mavenpro(),
                ),
                eventCardAttribute: Text(
                  HomepageStrings.secondTimelineAttribute,
                  style: CustomStyle.mono(),
                ),
                eventCardSubTitle: Text(
                  HomepageStrings.secondTimelineSubtitle,
                  style: CustomStyle.inter(),
                ),
              ),
              DesktopTimelineStartTile(
                isFirst: false,
                isLast: false,
                isPast: true,
                isEducation: true,
                eventCardHeader: Text(
                  HomepageStrings.thirdTimelineTitle,
                  style: CustomStyle.mavenpro(),
                ),
                eventCardAttribute: Text(
                  HomepageStrings.thirdTimelineAttribute,
                  style: CustomStyle.mono(),
                ),
                eventCardSubTitle: Text(
                  HomepageStrings.thirdTimelineSubtitle,
                  style: CustomStyle.inter(),
                ),
              ),
              DesktopTimelineEndTile(
                isFirst: false,
                isLast: false,
                isPast: true,
                isEducation: true,
                eventCardHeader: Text(
                  HomepageStrings.fourthTimelineTitle,
                  style: CustomStyle.mavenpro(),
                ),
                eventCardAttribute: Text(
                  HomepageStrings.fourthTimelineAttribute,
                  style: CustomStyle.mono(),
                ),
                eventCardSubTitle: Text(
                  HomepageStrings.fourthTimelineSubtitle,
                  style: CustomStyle.inter(),
                ),
              ),
              DesktopTimelineStartTile(
                isFirst: false,
                isLast: false,
                isPast: true,
                isEducation: true,
                eventCardHeader: Text(
                  HomepageStrings.fifthTimelineTitle,
                  style: CustomStyle.mavenpro(),
                ),
                eventCardAttribute: Text(
                  HomepageStrings.fifthTimelineAttribute,
                  style: CustomStyle.mono(),
                ),
                eventCardSubTitle: Text(
                  HomepageStrings.fifthTimelineSubtitle,
                  style: CustomStyle.inter(),
                ),
              ),
              DesktopTimelineEndTile(
                isFirst: false,
                isLast: true,
                isPast: false,
                isEducation: true,
                eventCardHeader: Text(
                  HomepageStrings.sixthTimelineTitle,
                  style: CustomStyle.mavenpro(),
                ),
                eventCardAttribute: Text(
                  HomepageStrings.sixthTimelineAttribute,
                  style: CustomStyle.mono(),
                ),
                eventCardSubTitle: Text(
                  HomepageStrings.sixthTimelineSubtitle,
                  style: CustomStyle.inter(),
                ),
              ),
              SizedBox(height: 150)
            ],
          ),
        ),
      ),
    );
  }
}
