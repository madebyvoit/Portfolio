import 'dart:convert';

import 'package:flutter/material.dart';
import 'dart:math' as math; // For min/max functions

// Enums to define tab position
enum TabSide { none, top, bottom, left, right }

enum CustomTabAlignment { start, center, end }

// The reusable widget - now with tab position controls
class CustomShapeWidget extends StatelessWidget {
  final double width;
  final double height;
  final Color color;
  final Color shadowColor;
  final Offset shadowOffset;
  final double shadowSigma;
  final double cornerRadius;
  final double? innerCornerRadius; // Optional, defaults to cornerRadius if null

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
    this.shadowSigma = 5.0,
    this.cornerRadius = 15.0,
    this.innerCornerRadius,
    // Tab Defaults: No tab by default
    this.tabSide = TabSide.none,
    this.customTabAlignment =
        CustomTabAlignment.center, // Default alignment if tab exists
    this.tabLengthRatio = 0.35, // Default length ratio if tab exists
    this.tabDepthRatio = 0.15, // Default depth ratio if tab exists
  });

  @override
  Widget build(BuildContext context) {
    // Ensure ratios are within reasonable bounds
    final validTabLengthRatio = tabLengthRatio.clamp(0.0, 1.0);
    final validTabDepthRatio = tabDepthRatio.clamp(0.0, 1.0);

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
          innerCornerRadius: innerCornerRadius ?? cornerRadius,
          tabSide: tabSide,
          customTabAlignment: customTabAlignment,
          tabLengthRatio: validTabLengthRatio,
          tabDepthRatio: validTabDepthRatio,
        ),
      ),
    );
  }
}

// The painter class - significantly refactored for tab positioning
class _ShapePainter extends CustomPainter {
  final Color color;
  final Color shadowColor;
  final Offset shadowOffset;
  final double shadowSigma;
  final double cornerRadius;
  final double innerCornerRadius;
  final TabSide tabSide;
  final CustomTabAlignment customTabAlignment;
  final double tabLengthRatio;
  final double tabDepthRatio;

  _ShapePainter({
    required this.color,
    required this.shadowColor,
    required this.shadowOffset,
    required this.shadowSigma,
    required this.cornerRadius,
    required this.innerCornerRadius,
    required this.tabSide,
    required this.customTabAlignment,
    required this.tabLengthRatio,
    required this.tabDepthRatio,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path();

    // Adjust radii if they are too large for the dimensions
    final double effectiveCornerRadius =
        math.min(cornerRadius, math.min(size.width / 2, size.height / 2));
    final double effectiveInnerRadius =
        math.min(innerCornerRadius, math.min(size.width / 2, size.height / 2));

    // Calculate Tab dimensions based on side
    double tabLength = 0;
    double tabDepth = 0;
    bool isHorizontalTab =
        (tabSide == TabSide.top || tabSide == TabSide.bottom);

    if (tabSide != TabSide.none) {
      tabLength = isHorizontalTab
          ? (size.width * tabLengthRatio)
          : (size.height * tabLengthRatio);
      tabDepth = isHorizontalTab
          ? (size.height * tabDepthRatio)
          : (size.width * tabDepthRatio);
      // Prevent radii from being larger than half the tab dimensions
      // effectiveCornerRadius = math.min(effectiveCornerRadius, tabDepth / 2); // Outer corners are on main body mostly
      // effectiveInnerRadius = math.min(effectiveInnerRadius, math.min(tabLength / 2, tabDepth / 2)); // Inner corners constrained by tab
    }

    // Define main rectangle bounds (adjusting for tab depth)
    double mainX = 0;
    double mainY = 0;
    double mainW = size.width;
    double mainH = size.height;

    if (tabSide == TabSide.top) mainY = tabDepth;
    if (tabSide == TabSide.left) mainX = tabDepth;
    if (tabSide == TabSide.bottom) mainH = size.height - tabDepth;
    if (tabSide == TabSide.right) mainW = size.width - tabDepth;
    // Ensure main dimensions are not negative if depth ratio is high
    mainW = math.max(0, mainW - mainX);
    mainH = math.max(0, mainH - mainY);

    final Rect mainRect = Rect.fromLTWH(mainX, mainY, mainW, mainH);

    // Calculate Tab start position along the edge
    double tabStart = 0;
    final double edgeLength = isHorizontalTab ? size.width : size.height;

    switch (customTabAlignment) {
      case CustomTabAlignment.start:
        tabStart = 0;
        break;
      case CustomTabAlignment.center:
        tabStart = (edgeLength - tabLength) / 2;
        break;
      case CustomTabAlignment.end:
        tabStart = edgeLength - tabLength;
        break;
    }
    // Prevent negative start if length ratio is > 1 (already clamped, but safety)
    tabStart = math.max(0, tabStart);
    final double tabEnd = tabStart + tabLength;

    // --- Build the Path ---
    // We trace clockwise from top-left corner of the effective drawing area

    // Top-Left Corner
    path.moveTo(mainRect.left + cornerRadius, mainRect.top);

    // Top Edge (potentially includes top tab)
    if (tabSide == TabSide.top) {
      path.lineTo(mainRect.left + tabStart, mainRect.top); // Line to tab start
      // Tab Detour (Upwards)
      path.arcToPoint(
          Offset(mainRect.left + tabStart + cornerRadius, mainRect.top + tabStart - cornerRadius),
          radius: Radius.circular(cornerRadius),
          clockwise: false); // Inner bottom-left tab corner
      path.lineTo(mainRect.left + tabStart,
          0 + cornerRadius); // Tab left side up
      path.arcToPoint(
          Offset(mainRect.left + tabStart + cornerRadius, 0),
          radius: Radius.circular(cornerRadius),
          clockwise: true); // Outer top-left tab corner
      path.lineTo(
          mainRect.left + tabEnd - cornerRadius, 0); // Tab top edge
      path.arcToPoint(Offset(mainRect.left + tabEnd, 0 + cornerRadius),
          radius: Radius.circular(cornerRadius),
          clockwise: true); // Outer top-right tab corner
      path.lineTo(mainRect.left + tabEnd,
          mainRect.top - cornerRadius); // Tab right side down
      path.arcToPoint(Offset(mainRect.left + tabEnd, mainRect.top),
          radius: Radius.circular(cornerRadius),
          clockwise: false); // Inner bottom-right tab corner

      if (customTabAlignment != CustomTabAlignment.end) {
        // Rounded border if tabalignment is centered
        path.lineTo(mainRect.right - cornerRadius, mainRect.top);

        path.arcToPoint(
            Offset(mainRect.right, mainRect.top + cornerRadius),
            radius: Radius.circular(cornerRadius),
            clockwise: true);
      }
    } else if (customTabAlignment == CustomTabAlignment.start &&
        tabSide == TabSide.right) {
      path.lineTo(mainRect.right, mainRect.top);
    } else {
      path.lineTo(mainRect.right - cornerRadius, mainRect.top);

      path.arcToPoint(
          Offset(mainRect.right, mainRect.top + cornerRadius),
          radius: Radius.circular(effectiveCornerRadius),
          clockwise: true);
    }

    // Right Edge (potentially includes right tab)
    if (tabSide == TabSide.right) {
      path.lineTo(
          mainRect.right, mainRect.top + tabStart); // Line down to tab start
      // Tab Detour (Rightwards)
      path.arcToPoint(
          Offset(
              mainRect.right + effectiveInnerRadius, mainRect.top + tabStart),
          radius: Radius.circular(effectiveInnerRadius),
          clockwise: true);
      path.lineTo(size.width - effectiveInnerRadius, mainRect.top + tabStart);
      path.arcToPoint(
          Offset(size.width, mainRect.top + tabStart + effectiveInnerRadius),
          radius: Radius.circular(effectiveInnerRadius),
          clockwise: true);
      path.lineTo(size.width, mainRect.top + tabEnd - effectiveInnerRadius);
      path.arcToPoint(
          Offset(size.width - effectiveInnerRadius, mainRect.top + tabEnd),
          radius: Radius.circular(effectiveInnerRadius),
          clockwise: true);
      path.lineTo(mainRect.right + effectiveInnerRadius, mainRect.top + tabEnd);
      path.arcToPoint(Offset(mainRect.right, mainRect.top + tabEnd),
          radius: Radius.circular(effectiveInnerRadius), clockwise: false);

      if (customTabAlignment != CustomTabAlignment.end) {
        // Bottom-Right Corner
        path.lineTo(mainRect.right, mainRect.bottom - effectiveCornerRadius);

        path.arcToPoint(
            Offset(mainRect.right - effectiveCornerRadius, mainRect.bottom),
            radius: Radius.circular(effectiveCornerRadius),
            clockwise: true);
      }
    } else if (customTabAlignment == CustomTabAlignment.end &&
        tabSide == TabSide.bottom) {
      path.lineTo(mainRect.right, mainRect.bottom);
    } else {
      path.lineTo(mainRect.right, mainRect.bottom - effectiveCornerRadius);

      path.arcToPoint(
          Offset(mainRect.right - effectiveCornerRadius, mainRect.bottom),
          radius: Radius.circular(effectiveCornerRadius),
          clockwise: true);
    }

    // Bottom Edge (potentially includes bottom tab)
    if (tabSide == TabSide.bottom) {
      path.lineTo(mainRect.left + tabEnd, mainRect.bottom); // Line to tab end
      // Tab Detour (Downwards)
      path.arcToPoint(
          Offset(
              mainRect.left + tabEnd, mainRect.bottom + effectiveInnerRadius),
          radius: Radius.circular(effectiveInnerRadius),
          clockwise: false);
      path.lineTo(mainRect.left + tabEnd, size.height - effectiveInnerRadius);
      path.arcToPoint(
          Offset(mainRect.left + tabEnd - effectiveInnerRadius, size.height),
          radius: Radius.circular(effectiveInnerRadius),
          clockwise: true);
      path.lineTo(mainRect.left + tabStart + effectiveInnerRadius, size.height);
      path.arcToPoint(
          Offset(mainRect.left + tabStart, size.height - effectiveInnerRadius),
          radius: Radius.circular(effectiveInnerRadius),
          clockwise: true);
      path.lineTo(
          mainRect.left + tabStart, mainRect.bottom + effectiveInnerRadius);
      path.arcToPoint(Offset(mainRect.left + tabStart, mainRect.bottom),
          radius: Radius.circular(effectiveInnerRadius), clockwise: false);
      // End Tab Detour

      // Bottom-Left Corner
      if (customTabAlignment != CustomTabAlignment.start) {
        path.lineTo(mainRect.left + effectiveCornerRadius,
            mainRect.bottom); // Line to bottom-left corner start

        path.arcToPoint(
            Offset(mainRect.left, mainRect.bottom - effectiveCornerRadius),
            radius: Radius.circular(effectiveCornerRadius),
            clockwise: true);
      }
    } else if (customTabAlignment == CustomTabAlignment.end &&
        tabSide == TabSide.left) {
      path.lineTo(mainRect.left, mainRect.bottom);
    } else {
      path.lineTo(mainRect.left + effectiveCornerRadius,
          mainRect.bottom); // Normal bottom edge
      path.arcToPoint(
          Offset(mainRect.left, mainRect.bottom - effectiveCornerRadius),
          radius: Radius.circular(effectiveCornerRadius),
          clockwise: true);
    }

    // Left Edge (potentially includes left tab)
    if (tabSide == TabSide.left) {
      path.lineTo(mainRect.left, mainRect.top + tabEnd); // Line up to tab end
      // Tab Detour (Leftwards)
      path.arcToPoint(
          Offset(mainRect.left - effectiveInnerRadius, mainRect.top + tabEnd),
          radius: Radius.circular(effectiveInnerRadius),
          clockwise: true);
      path.lineTo(0 + effectiveInnerRadius, mainRect.top + tabEnd);
      path.arcToPoint(Offset(0, mainRect.top + tabEnd - effectiveInnerRadius),
          radius: Radius.circular(effectiveInnerRadius), clockwise: true);
      path.lineTo(0, mainRect.top + tabStart + effectiveInnerRadius);
      path.arcToPoint(Offset(0 + effectiveInnerRadius, mainRect.top + tabStart),
          radius: Radius.circular(effectiveInnerRadius), clockwise: true);
      path.lineTo(
          mainRect.left - effectiveInnerRadius, mainRect.top + tabStart);
      path.arcToPoint(Offset(mainRect.left, mainRect.top + tabStart),
          radius: Radius.circular(effectiveInnerRadius), clockwise: false);

      if (customTabAlignment != CustomTabAlignment.start) {
        // End Tab Detour
        path.lineTo(
            mainRect.left,
            mainRect.top +
                effectiveCornerRadius); // Line up to top-left corner start

        // Close Path to Top-Left Arc start point
        path.arcToPoint(
            Offset(mainRect.left + effectiveCornerRadius, mainRect.top),
            radius: Radius.circular(effectiveCornerRadius),
            clockwise: true);
      }
    } else if (customTabAlignment == CustomTabAlignment.start &&
        tabSide == TabSide.top) {
      path.lineTo(mainRect.left, mainRect.top);
    } else {
      path.lineTo(mainRect.left,
          mainRect.top + effectiveCornerRadius); // Normal left edge

      // Close Path to Top-Left Arc start point
      path.arcToPoint(
          Offset(mainRect.left + effectiveCornerRadius, mainRect.top),
          radius: Radius.circular(effectiveCornerRadius),
          clockwise: true);
    }

    path.close(); // Should connect back to the start

    // --- Draw Shadow and Shape ---
    final shadowPaint = Paint()
      ..color = shadowColor
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, shadowSigma);
    final shadowPath = path.shift(shadowOffset);

    canvas.drawPath(shadowPath, shadowPaint); // Draw shadow first
    canvas.drawPath(path, paint); // Draw main shape
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // Since the shape is static, we don't need to repaint unless the painter instance changes.
    // Returning false is often sufficient for static shapes.
    return false;
  }
}
