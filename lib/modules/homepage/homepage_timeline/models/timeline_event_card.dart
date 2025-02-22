import 'package:flutter/material.dart';
import 'dart:math' as math;

class TimelineEventCard extends StatelessWidget {
  final bool isPast;
  final bool isEducation;
  final Text eventcardHeader;
  final Text eventcardText;
  final Alignment alignment;
  const TimelineEventCard({
    super.key,
    required this.isPast,
    required this.alignment,
    required this.eventcardHeader,
    required this.eventcardText,
    required this.isEducation,
  });

  @override
  Widget build(BuildContext context) {
    return FittedBox(
        alignment: alignment,
        fit: BoxFit.contain,
        child: Stack(
          children: [
            Container(
              margin: const EdgeInsets.all(25),
              padding: const EdgeInsets.all(25),
              decoration: BoxDecoration(
                color: isPast
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [eventcardHeader, eventcardText],
              ),
            ),
            Positioned(
              top: 10,
              right: 15,
              child: Transform.rotate(
                angle: 15 * math.pi / 180,
                child: Container(
                  height: 40,
                  width: 40,
                  color: isEducation ? Colors.white : Colors.red,
                ),
              ),
            )
          ],
        ));
  }
}
