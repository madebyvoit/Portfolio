import 'package:flutter/material.dart';
import 'dart:math';

class TimelineEventCard extends StatelessWidget {
  final bool isPast;
  final bool isEducation;
  final Text eventcardHeader;
  final Text eventcardAttribute;
  final Text eventcardSubTitle;
  final Alignment alignment;
  const TimelineEventCard({
    super.key,
    required this.isPast,
    required this.alignment,
    required this.eventcardHeader,
    required this.isEducation,
    required this.eventcardAttribute,
    required this.eventcardSubTitle,
  });

  @override
  Widget build(BuildContext context) {
    Random random = Random();

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
                children: [
                  eventcardHeader,
                  const SizedBox(
                    height: 10,
                  ),
                  eventcardAttribute,
                  eventcardSubTitle
                ],
              ),
            ),
            Positioned(
              top: 10,
              right: 15,
              child: Transform.rotate(
                angle: (random.nextInt(30) + 10) * pi / 180,
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
