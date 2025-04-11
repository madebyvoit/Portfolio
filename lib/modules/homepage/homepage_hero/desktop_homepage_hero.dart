import 'package:flutter/material.dart';

class DesktopHomepageHero extends StatelessWidget {
  const DesktopHomepageHero({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.84,
      width: MediaQuery.sizeOf(context).width,
      child: Expanded(
        child: Column(
          children: [
            Stack(
              children: [
                Positioned.fill(
                  child: CustomPaint(
                    painter: BackgroundShapesPainter(
                      brown: Theme.of(context).colorScheme.primary,
                      shadowColor: Theme.of(context).colorScheme.shadow,
                      shadowOffset: Offset(-1, 0.8),
                      shadowSigma: 20,
                    ),
                  ),
                ),
                Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height / 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Stack(
                          children: [
                            Container(
                              height: MediaQuery.sizeOf(context).height / 2,
                              width: MediaQuery.sizeOf(context).width / 3.2,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(400),
                                color: Theme.of(context).colorScheme.primary,
                                boxShadow: [
                                  BoxShadow(
                                    color: Theme.of(context).colorScheme.shadow,
                                    blurRadius: 20,
                                    spreadRadius: 5,
                                    offset: const Offset(0, 10),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),            
          ],
        ),
      ),
    );
  }
}

class BackgroundShapesPainter extends CustomPainter {
  final Color brown;
  final Color shadowColor;
  final Offset shadowOffset;
  final double shadowSigma;

  BackgroundShapesPainter({
    required this.shadowColor,
    required this.shadowOffset,
    required this.shadowSigma,
    required this.brown,
  });
  @override
  void paint(Canvas canvas, Size size) {
    final paintGreenLight = Paint()
      ..color = brown // Lighter primary green
      ..style = PaintingStyle.fill;

    var path = Path();
    path.moveTo(0, size.height * 0.1); // Start top left-ish
    path.quadraticBezierTo(
        size.width * 0.05,
        size.height * 0.14, // Control point
        size.width * 0.1,
        size.height * 0.15); // End mid top-left
    path.quadraticBezierTo(
      size.width * 0.3,
      size.height * 0.17, // Control point 2
      size.width * 0.2,
      0,
    ); // End top center-left
    path.lineTo(0, 0); // Line to top left corner
    path.close();

    final shadowPaint = Paint()
      ..color = shadowColor
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, shadowSigma);

    final shadowPath = path.shift(shadowOffset);

    // Draw shadow path first
    canvas.drawPath(shadowPath, shadowPaint);

    canvas.drawPath(path, paintGreenLight);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false; // Shapes don't change
  }
}
