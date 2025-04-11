part of '../constants.dart';

class AppColors {
  //lightTheme
  static const Color lightSurface = Color(0xFFE0E7E5);
  static const Color lightOnSurface = Color(0xFF1A3A32);
  static const Color lightPrimary = Color(0xFF4CAF87);
  static const Color lightOnPrimary = Color(0xFFE0E7E5);
  static const Color lightPrimaryContainer = Color(0xFFC8E6C9);
  static const Color lightOnPrimaryContainer = Color(0xFF1A3A32);
  static const Color lightSecondary = Color(0xFF6A877F);
  static const Color lightOnSecondary = Color(0xFFE0E7E5);
  static const Color lightSecondaryContainer = Color(0xFFE0E7E5);
  static const Color lightOnSecondaryContainer = Color(0xFF1A3A32);
  static const Color lightOutline = Color(0xFF6A877F);
  static const Color lightShadow = Color(0xFF000000);
  static const Color lightError = Color(0xFFCF6679);
  static const Color lightOnError = Color(0xFFE0E7E5);
  static const Color lightErrorContainer = Color(0xFFFFCDD2);
  static const Color lightOnErrorContainer = Color(0xFFB71C1C);

  //darktheme
  static const Color darkSurface = Color(0xFF0B0D0C);
  static const Color darkOnSurface = Color(0xFFE0E7E5);
  static const Color darkPrimary = Color(0xFF1A3A32);
  static const Color darkOnPrimary = Color(0xFFE0E7E5);
  static const Color darkPrimaryContainer = Color(0xFF2D5047);
  static const Color darkOnPrimaryContainer = Color(0xFFE0E7E5);
  static const Color darkSecondary = Color(0xFF6A877F);
  static const Color darkOnSecondary = Color(0xFFE0E7E5);
  static const Color darkSecondaryContainer = Color(0xFF4A635D);
  static const Color darkOnSecondaryContainer = Color(0xFFE0E7E5);
  static const Color darkOutline = Color(0xFF6A877F);
  static const Color darkShadow = Color(0xFF000000);
  static const Color darkError = Color(0xFFCF6679);
  static const Color darkOnError = Color(0xFFE0E7E5);
  static const Color darkErrorContainer = Color(0xFF8C4A55);
  static const Color darkOnErrorContainer = Color(0xFFE0E7E5);

  //custom Colors
}

/*
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
    double effectiveInnerRadius = math.min(innerCornerRadius ?? cornerRadius, maxMainRadius);

    // Further constrain radii based on tab dimensions if a tab exists
    if (tabSide != TabSide.none && tabLength > 0 && tabDepth > 0) {
       final double maxTabRadius = math.min(tabLength / 2, tabDepth / 2);
       // Outer corners of the tab use effectiveCornerRadius, inner corners use effectiveInnerRadius
       // Both must respect the maxTabRadius constraint.
       effectiveCornerRadius = math.min(effectiveCornerRadius, maxTabRadius);
       effectiveInnerRadius = math.min(effectiveInnerRadius, maxTabRadius);
    }
     // Ensure radii are not negative
    effectiveCornerRadius = math.max(0.0, effectiveCornerRadius);
    effectiveInnerRadius = math.max(0.0, effectiveInnerRadius);


    return SizedBox(
      width: width,
      height: height,
      child: CustomPaint(
        painter: _ShapePainter(
          color: color,
          shadowColor: shadowColor,
          shadowOffset: shadowOffset,
          shadowSigma: shadowSigma,
          cornerRadius: effectiveCornerRadius, // Pass potentially constrained radius
          innerCornerRadius: effectiveInnerRadius, // Pass potentially constrained radius
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
  final double shadowSigma;
  final double cornerRadius; // Already constrained effective corner radius
  final double innerCornerRadius; // Already constrained effective inner radius
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
    required this.shadowSigma,
    required this.cornerRadius, // Use directly
    required this.innerCornerRadius, // Use directly
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

    // Use the passed, constrained radii
    final double r = cornerRadius; // Outer radius
    final double ir = innerCornerRadius; // Inner radius (where tab meets body)

    // Use pre-calculated tab dimensions
    final double tabLength = initialTabLength;
    final double tabDepth = initialTabDepth;
    final bool isHorizontalTab = (tabSide == TabSide.top || tabSide == TabSide.bottom);

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
        tabStart = isHorizontalTab ? mainRect.left : mainRect.top;
        break;
      case CustomTabAlignment.center:
        // Center the tab length along the *total* edge
        tabStart = (edgeLength - tabLength) / 2;
        // Adjust start based on mainRect offset if left/top tab
        if (tabSide == TabSide.left) tabStart -= mainRect.left;
        if (tabSide == TabSide.top) tabStart -= mainRect.top;

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

    // Clamp tabStart to be within the mainRect bounds
     if (isHorizontalTab) {
         tabStart = tabStart.clamp(0.0, mainRect.width - tabLength);
         // Absolute positions on the mainRect edge
         tabStart += mainRect.left;
     } else {
         tabStart = tabStart.clamp(0.0, mainRect.height - tabLength);
         // Absolute positions on the mainRect edge
         tabStart += mainRect.top;
     }


    final double tabEnd = tabStart + tabLength;


    // --- Build the Path (Clockwise from Top-Left corner of bounds) ---

    // Adjust start point if the top-left corner is involved in a tab
    if (tabSide == TabSide.top && customTabAlignment == CustomTabAlignment.start) {
         path.moveTo(mainRect.left, 0 + r); // Start on the tab arc
    } else if (tabSide == TabSide.left && customTabAlignment == CustomTabAlignment.start) {
        path.moveTo(0 + r, mainRect.top); // Start on the tab arc
    } else {
        path.moveTo(mainRect.left + r, mainRect.top); // Standard top-left start
    }


    // -- Top Edge & Potential Top Tab --
    if (tabSide == TabSide.top) {
      // Line to start of tab's left inner corner arc
      path.lineTo(tabStart, mainRect.top);
      // Inner bottom-left corner (concave)
      path.arcToPoint(Offset(tabStart + ir, mainRect.top - ir), radius: Radius.circular(ir), clockwise: false);
      // Line up tab's left side
      path.lineTo(tabStart + ir, 0 + r); // Go up to the start of the outer arc
      // Outer top-left corner (convex)
      path.arcToPoint(Offset(tabStart + ir + r, 0), radius: Radius.circular(r), clockwise: true);
      // Line along tab's top edge
      path.lineTo(tabEnd - ir - r, 0); // Line to start of outer top-right arc
      // Outer top-right corner (convex)
      path.arcToPoint(Offset(tabEnd - ir, 0 + r), radius: Radius.circular(r), clockwise: true);
      // Line down tab's right side
      path.lineTo(tabEnd - ir, mainRect.top - ir); // Line to start of inner bottom-right arc
      // Inner bottom-right corner (concave)
      path.arcToPoint(Offset(tabEnd, mainRect.top), radius: Radius.circular(ir), clockwise: false);
      // Line to end of top edge / start of top-right corner
      path.lineTo(mainRect.right - r, mainRect.top);
    } else {
      // Normal top edge
      path.lineTo(mainRect.right - r, mainRect.top);
    }
    // Top-Right Corner (if not handled by tab logic end)
     if (!(tabSide == TabSide.right && customTabAlignment == CustomTabAlignment.start)) {
        path.arcToPoint(Offset(mainRect.right, mainRect.top + r), radius: Radius.circular(r), clockwise: true);
     }


    // -- Right Edge & Potential Right Tab --
    if (tabSide == TabSide.right) {
        path.lineTo(mainRect.right, tabStart); // Line to tab start
        // Inner top-left corner (concave)
        path.arcToPoint(Offset(mainRect.right + ir, tabStart + ir), radius: Radius.circular(ir), clockwise: false);
        // Line right tab's top side
        path.lineTo(size.width - r, tabStart + ir); // Line to outer top-right arc start
        // Outer top-right corner (convex)
        path.arcToPoint(Offset(size.width, tabStart + ir + r), radius: Radius.circular(r), clockwise: true);
        // Line down tab's right edge
        path.lineTo(size.width, tabEnd - ir - r); // Line to outer bottom-right arc start
        // Outer bottom-right corner (convex)
        path.arcToPoint(Offset(size.width - r, tabEnd - ir), radius: Radius.circular(r), clockwise: true);
        // Line left tab's bottom side
        path.lineTo(mainRect.right + ir, tabEnd - ir); // Line to inner bottom-left arc start
         // Inner bottom-left corner (concave)
        path.arcToPoint(Offset(mainRect.right, tabEnd), radius: Radius.circular(ir), clockwise: false);
        // Line to bottom-right corner start
        path.lineTo(mainRect.right, mainRect.bottom - r);
    } else {
      // Normal right edge
      path.lineTo(mainRect.right, mainRect.bottom - r);
    }
     // Bottom-Right Corner (if not handled by tab logic end)
    if (!(tabSide == TabSide.bottom && customTabAlignment == CustomTabAlignment.end)) {
        path.arcToPoint(Offset(mainRect.right - r, mainRect.bottom), radius: Radius.circular(r), clockwise: true);
    }


    // -- Bottom Edge & Potential Bottom Tab --
    if (tabSide == TabSide.bottom) {
        path.lineTo(tabEnd, mainRect.bottom); // Line to tab end
        // Inner top-right corner (concave)
        path.arcToPoint(Offset(tabEnd - ir, mainRect.bottom + ir), radius: Radius.circular(ir), clockwise: false);
        // Line down tab's right side
        path.lineTo(tabEnd - ir, size.height - r); // Line to outer bottom-right arc start
        // Outer bottom-right corner (convex)
        path.arcToPoint(Offset(tabEnd - ir - r, size.height), radius: Radius.circular(r), clockwise: true);
        // Line along tab's bottom edge
        path.lineTo(tabStart + ir + r, size.height); // Line to outer bottom-left arc start
        // Outer bottom-left corner (convex)
        path.arcToPoint(Offset(tabStart + ir, size.height - r), radius: Radius.circular(r), clockwise: true);
        // Line up tab's left side
        path.lineTo(tabStart + ir, mainRect.bottom + ir); // Line to inner top-left arc start
        // Inner top-left corner (concave)
        path.arcToPoint(Offset(tabStart, mainRect.bottom), radius: Radius.circular(ir), clockwise: false);
        // Line to bottom-left corner start
        path.lineTo(mainRect.left + r, mainRect.bottom);

    } else {
      // Normal bottom edge
      path.lineTo(mainRect.left + r, mainRect.bottom);
    }
     // Bottom-Left Corner (if not handled by tab logic end)
     if (!(tabSide == TabSide.left && customTabAlignment == CustomTabAlignment.end)) {
        path.arcToPoint(Offset(mainRect.left, mainRect.bottom - r), radius: Radius.circular(r), clockwise: true);
     }


    // -- Left Edge & Potential Left Tab --
    if (tabSide == TabSide.left) {
        path.lineTo(mainRect.left, tabEnd); // Line to tab end
         // Inner bottom-right corner (concave)
        path.arcToPoint(Offset(mainRect.left - ir, tabEnd - ir), radius: Radius.circular(ir), clockwise: false);
        // Line left tab's bottom side
        path.lineTo(0 + r, tabEnd - ir); // Line to outer bottom-left arc start
        // Outer bottom-left corner (convex)
        path.arcToPoint(Offset(0, tabEnd - ir - r), radius: Radius.circular(r), clockwise: true);
        // Line up tab's left edge
        path.lineTo(0, tabStart + ir + r); // Line to outer top-left arc start
        // Outer top-left corner (convex)
        path.arcToPoint(Offset(0 + r, tabStart + ir), radius: Radius.circular(r), clockwise: true);
        // Line right tab's top side
        path.lineTo(mainRect.left - ir, tabStart + ir); // Line to inner top-right arc start
         // Inner top-right corner (concave)
        path.arcToPoint(Offset(mainRect.left, tabStart), radius: Radius.circular(ir), clockwise: false);
         // Line to top-left corner start
        path.lineTo(mainRect.left, mainRect.top + r); // Connect back to the start of the top-left corner arc

    } else {
      // Normal left edge
      path.lineTo(mainRect.left, mainRect.top + r);
    }
     // Top-Left Corner (if not handled by tab logic end)
    if (!(tabSide == TabSide.top && customTabAlignment == CustomTabAlignment.start)) {
        // Ensure we connect back to the very start point
        path.arcToPoint(Offset(mainRect.left + r, mainRect.top), radius: Radius.circular(r), clockwise: true);
     }


    path.close(); // Close the path

    // --- Draw Shadow and Shape ---
    if (shadowSigma > 0 && shadowColor.alpha > 0) {
      final shadowPaint = Paint()
        ..color = shadowColor // Use original shadow color
        ..maskFilter = MaskFilter.blur(BlurStyle.normal, shadowSigma);
      final shadowPath = path.shift(shadowOffset);
      canvas.drawPath(shadowPath, shadowPaint); // Draw shadow first
    }
    canvas.drawPath(path, paint); // Draw main shape
  }

  @override
  bool shouldRepaint(covariant _ShapePainter oldDelegate) {
    // Repaint if any property changes
    return oldDelegate.color != color ||
        oldDelegate.shadowColor != shadowColor ||
        oldDelegate.shadowOffset != shadowOffset ||
        oldDelegate.shadowSigma != shadowSigma ||
        oldDelegate.cornerRadius != cornerRadius ||
        oldDelegate.innerCornerRadius != innerCornerRadius ||
        oldDelegate.tabSide != tabSide ||
        oldDelegate.customTabAlignment != customTabAlignment ||
        oldDelegate.tabLengthRatio != tabLengthRatio ||
        oldDelegate.tabDepthRatio != tabDepthRatio ||
        oldDelegate.initialTabLength != initialTabLength ||
        oldDelegate.initialTabDepth != initialTabDepth;
  }
}
*/