import 'package:flutter/material.dart';
import 'dart:math' as math;

// Enums remain the same
enum TabSide { none, top, bottom, left, right }

enum CustomTabAlignment { start, center, end }

// CustomShapeWidget remains the same
class CustomShapeWidget extends StatelessWidget {
  final double width;
  final double height;
  final Color color;
  final Color shadowColor;
  final Offset shadowOffset;
  final double shadowBlur;
  final double cornerRadius;

  // Tab Properties
  final TabSide tabSide;
  final CustomTabAlignment customTabAlignment;
  final double
      tabLengthRatio; // Ratio of the side length the tab occupies (e.g., 0.3 means 30% of the width if tab is top/bottom)
  final double
      tabDepthRatio; // Ratio of the *other* dimension for tab protrusion depth (e.g., 0.1 means 10% of height if tab is top/bottom)

  const CustomShapeWidget({
    super.key,
    required this.width,
    required this.height,
    this.color = Colors.black,
    this.shadowColor = Colors.black54,
    this.shadowOffset = const Offset(0.0, -8.0), // Default upwards shadow
    this.shadowBlur = 5.0,
    this.cornerRadius = 15.0,
    // Tab Defaults: No tab by default
    this.tabSide = TabSide.none,
    this.customTabAlignment =
        CustomTabAlignment.center, // Default alignment if tab exists
    this.tabLengthRatio = 0.35, // Default length ratio if tab exists
    this.tabDepthRatio = 0.15,
  });

  @override
  Widget build(BuildContext context) {
    // Ensure ratios are within reasonable bounds
    final validTabLengthRatio = tabLengthRatio.clamp(0.0, 0.98);
    final validTabDepthRatio = tabDepthRatio.clamp(0.0, 0.8);

    // Calculate actual tab dimensions early to constrain radii
    double tabLength = 0;
    double tabDepth = 0;
    bool isHorizontalTab =
        (tabSide == TabSide.top || tabSide == TabSide.bottom);

    if (tabSide != TabSide.none) {
      tabLength = isHorizontalTab
          ? (width * validTabLengthRatio)
          : (height * validTabLengthRatio);
      tabDepth = isHorizontalTab
          ? (height * validTabDepthRatio)
          : (width * validTabDepthRatio);
    }

    // Adjust radii if they are too large for the main dimensions OR the tab dimensions
    final double maxMainRadius = math.min(width / 2, height / 2);
    double effectiveCornerRadius = math.min(cornerRadius, maxMainRadius);

    // Further constrain radii based on tab dimensions if a tab exists
    if (tabSide != TabSide.none && tabLength > 0 && tabDepth > 0) {
      final double maxTabRadius = math.min(tabLength / 2, tabDepth / 2);
      // Outer corners of the tab use effectiveCornerRadius, inner corners use effectiveInnerRadius
      // Both must respect the maxTabRadius constraint.
      effectiveCornerRadius = math.min(effectiveCornerRadius, maxTabRadius);
    }
    // Ensure radii are not negative
    effectiveCornerRadius = math.max(0.0, effectiveCornerRadius);

    return SizedBox(
      width: width,
      height: height,
      child: CustomPaint(
        painter: _ShapePainter(
          color: color,
          shadowColor: shadowColor,
          shadowOffset: shadowOffset,
          shadowBlur: shadowBlur,
          cornerRadius:
              effectiveCornerRadius, // Pass potentially constrained radius// Pass potentially constrained radius
          tabSide: tabSide,
          customTabAlignment: customTabAlignment,
          tabLengthRatio: validTabLengthRatio,
          tabDepthRatio: validTabDepthRatio,
          // Pass pre-calculated tab dimensions
          initialTabLength: tabLength,
          initialTabDepth: tabDepth,
        ),
      ),
    );
  }
}

// The painter class - FIXED VERSION
class _ShapePainter extends CustomPainter {
  final Color color;
  final Color shadowColor;
  final Offset shadowOffset;
  final double shadowBlur;
  final double cornerRadius; // Already constrained effective corner radius
  final TabSide tabSide;
  final CustomTabAlignment customTabAlignment;
  final double tabLengthRatio;
  final double tabDepthRatio;
  // Receive pre-calculated dimensions
  final double initialTabLength;
  final double initialTabDepth;

  _ShapePainter({
    required this.color,
    required this.shadowColor,
    required this.shadowOffset,
    required this.shadowBlur,
    required this.cornerRadius,
    required this.tabSide,
    required this.customTabAlignment,
    required this.tabLengthRatio,
    required this.tabDepthRatio,
    required this.initialTabLength,
    required this.initialTabDepth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path();

    // Use pre-calculated tab dimensions
    final double tabLength = initialTabLength;
    final double tabDepth = initialTabDepth;
    final bool isHorizontalTab =
        (tabSide == TabSide.top || tabSide == TabSide.bottom);

    // Define main rectangle bounds (adjusting for tab depth)
    double mainX = 0;
    double mainY = 0;
    double mainW = size.width;
    double mainH = size.height;

    // Adjust bounds based on tab position *without* depth factored in yet
    // The mainRect will represent the area *excluding* the tab protrusion
    if (tabSide == TabSide.top) mainY = tabDepth;
    if (tabSide == TabSide.left) mainX = tabDepth;
    if (tabSide == TabSide.bottom) mainH = size.height - tabDepth;
    if (tabSide == TabSide.right) mainW = size.width - tabDepth;

    // Ensure main dimensions are not negative
    mainW = math.max(0, mainW);
    mainH = math.max(0, mainH);

    // Create the main rectangle *excluding* the tab protrusion depth
    final Rect mainRect = Rect.fromLTWH(mainX, mainY, mainW, mainH);

    // Calculate Tab start position along the relevant edge
    double tabStart = 0;
    // Use the full size dimension for calculating alignment position
    final double edgeLength = isHorizontalTab ? size.width : size.height;

    switch (customTabAlignment) {
      case CustomTabAlignment.start:
        // Adjust start if radius pushes it inwards
        if (isHorizontalTab) {
          tabStart = mainRect.left + cornerRadius;
        } else {
          tabStart = mainRect.top + cornerRadius;
        }

        break;
      case CustomTabAlignment.center:
        // Center the tab length along the *total* edge
        tabStart = (edgeLength - tabLength + cornerRadius) / 2;

        break;
      case CustomTabAlignment.end:
        // Calculate end point relative to total size, then adjust for mainRect
        if (isHorizontalTab) {
          tabStart = size.width - tabLength - mainRect.left;
        } else {
          tabStart = size.height - tabLength - mainRect.top;
        }
        break;
    }

    final double tabEnd = tabStart + tabLength - cornerRadius;

    path.moveTo(
        mainRect.left + cornerRadius, mainRect.top); // Standard top-left start

    // -- Top Edge & Potential Top Tab --
    if (tabSide == TabSide.top) {
      // Line to start of tab's left inner corner arc
      path.lineTo(tabStart, mainRect.top);
      // Inner bottom-left corner (concave)
      path.arcToPoint(
          Offset(tabStart + cornerRadius, mainRect.top - cornerRadius),
          radius: Radius.circular(cornerRadius),
          clockwise: false);
      // Line up tab's left side
      path.lineTo(tabStart + cornerRadius,
          0 + cornerRadius); // Go up to the start of the outer arc
      // Outer top-left corner (convex)
      path.arcToPoint(Offset(tabStart + cornerRadius + cornerRadius, 0),
          radius: Radius.circular(cornerRadius), clockwise: true);
      // Line along tab's top edge
      path.lineTo(tabEnd - cornerRadius - cornerRadius,
          0); // Line to start of outer top-right arc
      // Outer top-right corner (convex)
      path.arcToPoint(Offset(tabEnd - cornerRadius, 0 + cornerRadius),
          radius: Radius.circular(cornerRadius), clockwise: true);
      // Line down tab's right side
      path.lineTo(
          tabEnd - cornerRadius,
          mainRect.top -
              cornerRadius); // Line to start of inner bottom-right arc
      // Inner bottom-right corner (concave)
      path.arcToPoint(Offset(tabEnd, mainRect.top),
          radius: Radius.circular(cornerRadius), clockwise: false);

      // Line to end of top edge / start of top-right corner
      path.lineTo(mainRect.right - cornerRadius, mainRect.top);
    } else {
      // Normal top edge
      path.lineTo(mainRect.right - cornerRadius, mainRect.top);
    }

    path.arcToPoint(Offset(mainRect.right, mainRect.top + cornerRadius),
        radius: Radius.circular(cornerRadius), clockwise: true);

    // -- Right Edge & Potential Right Tab --
    if (tabSide == TabSide.right) {
      path.lineTo(mainRect.right, tabStart); // Line to tab start
      // Inner top-left corner (concave)
      path.arcToPoint(
          Offset(mainRect.right + cornerRadius, tabStart + cornerRadius),
          radius: Radius.circular(cornerRadius),
          clockwise: false);
      // Line right tab's top side
      path.lineTo(size.width - cornerRadius,
          tabStart + cornerRadius); // Line to outer top-right arc start
      // Outer top-right corner (convex)
      path.arcToPoint(
          Offset(size.width, tabStart + cornerRadius + cornerRadius),
          radius: Radius.circular(cornerRadius),
          clockwise: true);
      // Line down tab's right edge
      path.lineTo(
          size.width,
          tabEnd -
              cornerRadius -
              cornerRadius); // Line to outer bottom-right arc start
      // Outer bottom-right corner (convex)
      path.arcToPoint(Offset(size.width - cornerRadius, tabEnd - cornerRadius),
          radius: Radius.circular(cornerRadius), clockwise: true);
      // Line left tab's bottom side
      path.lineTo(
          mainRect.right + cornerRadius, // mainRect.right + r
          tabEnd - cornerRadius); // Line to inner bottom-left arc start
      // Inner bottom-left corner (concave)
      path.arcToPoint(Offset(mainRect.right, tabEnd),
          radius: Radius.circular(cornerRadius), clockwise: false);
      // Line to bottom-right corner start
      path.lineTo(mainRect.right, mainRect.bottom - cornerRadius);
    } else {
      // Normal right edge
      path.lineTo(mainRect.right, mainRect.bottom - cornerRadius);
    }

    path.arcToPoint(Offset(mainRect.right - cornerRadius, mainRect.bottom),
        radius: Radius.circular(cornerRadius), clockwise: true);

    // -- Bottom Edge & Potential Bottom Tab --
    if (tabSide == TabSide.bottom) {
      path.lineTo(tabEnd, mainRect.bottom); // Line to tab end
      // Inner top-right corner (concave)
      path.arcToPoint(
          Offset(tabEnd - cornerRadius, mainRect.bottom + cornerRadius),
          radius: Radius.circular(cornerRadius),
          clockwise: false);
      // Line down tab's right side
      path.lineTo(tabEnd - cornerRadius,
          size.height - cornerRadius); // Line to outer bottom-right arc start
      // Outer bottom-right corner (convex)
      path.arcToPoint(Offset(tabEnd - cornerRadius - cornerRadius, size.height),
          radius: Radius.circular(cornerRadius), clockwise: true);
      // Line along tab's bottom edge
      path.lineTo(tabStart + cornerRadius + cornerRadius,
          size.height); // Line to outer bottom-left arc start
      // Outer bottom-left corner (convex)
      path.arcToPoint(
          Offset(tabStart + cornerRadius, size.height - cornerRadius),
          radius: Radius.circular(cornerRadius),
          clockwise: true);
      // Line up tab's left side
      path.lineTo(tabStart + cornerRadius,
          mainRect.bottom + cornerRadius); // Line to inner top-left arc start
      // Inner top-left corner (concave)
      path.arcToPoint(Offset(tabStart, mainRect.bottom),
          radius: Radius.circular(cornerRadius), clockwise: false);
      // Line to bottom-left corner start
      path.lineTo(mainRect.left + cornerRadius, mainRect.bottom);
    } else {
      // Normal bottom edge
      path.lineTo(mainRect.left + cornerRadius, mainRect.bottom);
    }
    // Bottom-Left Corner (if not handled by tab logic end)

    path.arcToPoint(Offset(mainRect.left, mainRect.bottom - cornerRadius),
        radius: Radius.circular(cornerRadius), clockwise: true);

    // -- Left Edge & Potential Left Tab --
    if (tabSide == TabSide.left) {
      path.lineTo(mainRect.left, tabEnd); // Line to tab end
      // Inner bottom-right corner (concave)
      path.arcToPoint(
          Offset(mainRect.left - cornerRadius, tabEnd - cornerRadius),
          radius: Radius.circular(cornerRadius),
          clockwise: false);
      // Line left tab's bottom side
      path.lineTo(0 + cornerRadius,
          tabEnd - cornerRadius); // Line to outer bottom-left arc start
      // Outer bottom-left corner (convex)
      path.arcToPoint(Offset(0, tabEnd - cornerRadius - cornerRadius),
          radius: Radius.circular(cornerRadius), clockwise: true);
      // Line up tab's left edge
      path.lineTo(
          0,
          tabStart +
              cornerRadius +
              cornerRadius); // Line to outer top-left arc start
      // Outer top-left corner (convex)
      path.arcToPoint(Offset(0 + cornerRadius, tabStart + cornerRadius),
          radius: Radius.circular(cornerRadius), clockwise: true);
      // Line right tab's top side
      path.lineTo(mainRect.left - cornerRadius,
          tabStart + cornerRadius); // Line to inner top-right arc start
      // Inner top-right corner (concave)
      path.arcToPoint(Offset(mainRect.left, tabStart),
          radius: Radius.circular(cornerRadius), clockwise: false);
      // Line to top-left corner start
      path.lineTo(mainRect.left, mainRect.top + cornerRadius);
    } else {
      // Normal left edge
      path.lineTo(mainRect.left, mainRect.top + cornerRadius);
    }
    // Top-Left Corner (if not handled by tab logic end)

    path.arcToPoint(Offset(mainRect.left + cornerRadius, mainRect.top),
        radius: Radius.circular(cornerRadius), clockwise: true);

    path.close(); // Close the path

    // --- Draw Shadow and Shape ---
    if (shadowBlur > 0 && shadowColor.a > 0) {
      final shadowPaint = Paint()
        ..color = shadowColor // Use original shadow color
        ..maskFilter = MaskFilter.blur(BlurStyle.normal, shadowBlur);
      final shadowPath = path.shift(shadowOffset);
      canvas.drawPath(shadowPath, shadowPaint); // Draw shadow first
    }
    canvas.drawPath(path, paint); // Draw main shape
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
