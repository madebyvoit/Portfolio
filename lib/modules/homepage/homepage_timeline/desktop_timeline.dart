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
                    height: 50,
                    child: DottedLine(
                      lineThickness: 4,
                      dashColor: Theme.of(context).colorScheme.primary,
                      dashLength: 10,
                      dashGapLength: 10,
                      direction: Axis.vertical,
                      dashRadius: 10,
                    ),
                  ),
                  DesktopTimelineEndTile(
                    isFirst: true,
                    isLast: false,
                    isPast: true,
                    isEducation: true,
                    eventCardHeader: Text(
                      'once opon a time - Jun 2021',
                      style: CustomStyle.mavenpro(),
                    ),
                    eventCardText: Text(
                      'High School Graduation\nTheodor Heuss Gymnasium',
                      style: CustomStyle.mono(),
                    ),
                  ),
                ],
              ),
              DesktopTimelineStartTile(
                isFirst: false,
                isLast: false,
                isPast: true,
                isEducation: false,
                eventCardHeader: Text(
                  'Mar 2022 - Mar 2024',
                  style: CustomStyle.mavenpro(),
                ),
                eventCardText: Text(
                  'Working Student\nIngenierbüro Dörr',
                  style: CustomStyle.lora(),
                ),
              ),
              DesktopTimelineEndTile(
                isFirst: false,
                isLast: false,
                isPast: true,
                isEducation: true,
                eventCardHeader: Text(
                  'Mar 2024 - Okt 2024',
                  style: CustomStyle.mavenpro(),
                ),
                eventCardText: Text(
                  'Internship\nTechnical Artist and Game Developer',
                  style: CustomStyle.lora(),
                ),
              ),
              DesktopTimelineStartTile(
                isFirst: false,
                isLast: false,
                isPast: true,
                isEducation: false,
                eventCardHeader: Text(
                  'Okt 2021 - Mar 2025',
                  style: CustomStyle.mavenpro(),
                ),
                eventCardText: Text(
                  'Bachelor of Arts\nGame Desing and Development',
                  style: CustomStyle.mono(),
                ),
              ),
              DesktopTimelineEndTile(
                isFirst: false,
                isLast: false,
                isPast: true,
                isEducation: true,
                eventCardHeader: Text(
                  'Mar 2025 - NOW',
                  style: CustomStyle.mavenpro(),
                ),
                eventCardText: Text(
                  'Freelancer\nEngraved Studios',
                  style: CustomStyle.mono(),
                ),
              ),
              DesktopTimelineStartTile(
                isFirst: false,
                isLast: true,
                isPast: false,
                isEducation: false,
                eventCardHeader: Text(
                  'coming Jun 2025',
                  style: CustomStyle.mavenpro(),
                ),
                eventCardText: Text(
                  'System Administrator\nZoll',
                  style: CustomStyle.mono(),
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
