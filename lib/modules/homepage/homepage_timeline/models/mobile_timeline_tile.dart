import 'package:flutter/material.dart';
import 'package:portfolio/modules/homepage/homepage_timeline/models/timeline_event_card.dart';
import 'package:timeline_tile/timeline_tile.dart';

class MobileTimelineTile extends StatelessWidget {
  final bool isFirst;
  final bool isLast;
  final bool isPast;
  final bool isEducation;
  final Text eventCardHeader;
  final Text eventCardText;
  const MobileTimelineTile({
    super.key,
    required this.isFirst,
    required this.isLast,
    required this.isPast,
    required this.eventCardHeader,
    required this.eventCardText,
    required this.isEducation,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // SizedBox creates larger gaps between the event points
      height: 150,
      child: TimelineTile(
        isFirst: isFirst,
        isLast: isLast,

        //line decoration
        beforeLineStyle: LineStyle(
          color: isPast
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.primaryContainer,
        ),

        //decorate the icon
        indicatorStyle: IndicatorStyle(
          width: 40,
          color: isPast
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.primaryContainer,
          iconStyle: IconStyle(
            iconData: Icons.done,
            color: isPast
                ? Theme.of(context).colorScheme.onPrimary
                : Theme.of(context).colorScheme.primaryContainer,
          ),
        ),

        //card next to event
        endChild: TimelineEventCard(
          isPast: isPast,
          isEducation: isEducation,
          alignment: Alignment.centerLeft,
          eventcardHeader: eventCardHeader,
          eventcardText: eventCardText,
        ),
      ),
    );
  }
}
