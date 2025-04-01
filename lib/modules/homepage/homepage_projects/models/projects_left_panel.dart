import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:portfolio/modules/projects/models/project_polaroid.dart';

class ProjectsLeftPanel extends StatelessWidget {
  const ProjectsLeftPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      child: Row(
        children: [
          Stack(
            children: [
              SizedBox(
                width: 2 / 4 * MediaQuery.sizeOf(context).width,
                height: 600,
              ),
              Container(
                height: 350,
                width: 2 / 5 * MediaQuery.sizeOf(context).width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(8),
                      bottomRight: Radius.circular(8)),
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              Positioned(
                top: 200,
                right: 0,
                child: Transform.rotate(
                  angle: 10 * math.pi / 180,
                  child: ProjectPolaroid(),
                ),
              ),
              Positioned(
                top: 200,
                right: 190,
                child: Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.red, //!TODO Change Color to responsive color #TODO
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
