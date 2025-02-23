import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:portfolio/modules/projects/models/project_polaroid.dart';

class ProjectsRightPanel extends StatelessWidget {
  const ProjectsRightPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Stack(
            alignment: Alignment.centerRight,
            children: [
              SizedBox(
                width: 3 / 5 * MediaQuery.sizeOf(context).width,
                height: 700,
              ),
              Container(
                height: 350,
                width: 2 / 5 * MediaQuery.sizeOf(context).width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      bottomLeft: Radius.circular(8)),
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              Positioned(
                top: 300,
                left: 200,
                child: Transform.rotate(
                  angle: -10 * math.pi / 180,
                  child: ProjectPolaroid(),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
