import 'package:flutter/material.dart';

class TabContainer extends StatelessWidget {
  final double width;
  final double height;
  final Color color;
  final Color shadowColor;
  final Offset shadowOffset;
  final double shadowSigma;
  final double cornerRadius;
  final double tabWidth;
  final double tabHeight;

  const TabContainer({
    super.key,
    required this.width,
    required this.height,
    this.color = Colors.black,
    this.shadowColor = Colors.black54,
    this.shadowOffset = const Offset(0.0, -8.0),
    this.shadowSigma = 5.0,
    this.cornerRadius = 20.0,
    this.tabWidth = 0.2,
    this.tabHeight = 0.20,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: CustomPaint(
        painter: _ShapePainter(
          color: color,
          shadowColor: shadowColor,
          shadowOffset: shadowOffset,
          shadowSigma: shadowSigma,
          cornerRadius: cornerRadius,
          tabWidthRatio: tabWidth,
          tabHeightRatio: tabHeight,
        ),
      ),
    );
  }
}

class _ShapePainter extends CustomPainter {
  final Color color;
  final Color shadowColor;
  final Offset shadowOffset;
  final double shadowSigma;
  final double cornerRadius;
  final double tabWidthRatio;
  final double tabHeightRatio;

  _ShapePainter({
    required this.color,
    required this.shadowColor,
    required this.shadowOffset,
    required this.shadowSigma,
    required this.cornerRadius,
    required this.tabWidthRatio,
    required this.tabHeightRatio,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // Paint for the main shape - uses the passed 'color'
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path();
    // --- Define Path Outline using passed parameters ---
    // Use this.cornerRadius, this.innerCornerRadius, etc.
    double tabWidth = size.width * tabWidthRatio;
    double tabHeight = size.height * tabHeightRatio;
    double mainBodyTopY = tabHeight;
    double mainBodyRightX = size.width;
    double mainBodyBottomY = size.height;
    double tabTopY = 0;
    double tabLeftX = size.width - tabWidth;

    path.moveTo(cornerRadius, mainBodyTopY);
    path.lineTo(tabLeftX - cornerRadius, mainBodyTopY);
    path.arcToPoint(Offset(tabLeftX, mainBodyTopY - cornerRadius),
        radius: Radius.circular(cornerRadius), clockwise: false);
    path.lineTo(tabLeftX, tabTopY + cornerRadius);
    path.arcToPoint(Offset(tabLeftX + cornerRadius, tabTopY),
        radius: Radius.circular(cornerRadius), clockwise: true);
    path.lineTo(mainBodyRightX - cornerRadius, tabTopY);
    path.arcToPoint(Offset(mainBodyRightX, tabTopY + cornerRadius),
        radius: Radius.circular(cornerRadius), clockwise: true);
    path.lineTo(mainBodyRightX, mainBodyBottomY - cornerRadius);
    path.arcToPoint(Offset(mainBodyRightX - cornerRadius, mainBodyBottomY),
        radius: Radius.circular(cornerRadius), clockwise: true);
    path.lineTo(cornerRadius, mainBodyBottomY);
    path.arcToPoint(Offset(0, mainBodyBottomY - cornerRadius),
        radius: Radius.circular(cornerRadius), clockwise: true);
    path.lineTo(0, mainBodyTopY + cornerRadius);
    path.arcToPoint(Offset(cornerRadius, mainBodyTopY),
        radius: Radius.circular(cornerRadius), clockwise: true);
    path.close();
    // --- Path Defined ---

    // --- Draw the Manual Shadow using passed parameters ---
    // Use this.shadowColor, this.shadowOffset, this.shadowSigma
    final shadowPaint = Paint()
      ..color = shadowColor
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, shadowSigma);

    final shadowPath = path.shift(shadowOffset);

    // Draw shadow path first
    canvas.drawPath(shadowPath, shadowPaint);
    // --- Manual Shadow Drawn ---

    // --- Draw the Main Shape ---
    canvas.drawPath(path, paint);
    // --- Main Shape Drawn ---
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
