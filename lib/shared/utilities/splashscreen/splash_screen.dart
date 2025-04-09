import 'dart:async'; // Import async for Timer
import 'dart:math';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  // ... (previous parameters remain the same) ...
  final Widget child;
  final Duration duration;
  final String name;
  final TextStyle nameStyle;
  final Color backgroundColor;
  final double loadingBarMaxWidth;
  final double loadingBarHeight;
  final Color loadingBarColor;
  final double nameLoadingBarSpacing;
  final String cursorSymbol;
  final Duration cursorBlinkDuration;
  final Duration typingSpeedPerChar; // New: Control typing speed

  const SplashScreen({
    super.key,
    required this.child,
    required this.name,
    this.duration = const Duration(milliseconds: 4500), // Adjust if needed
    this.nameStyle = const TextStyle(
      fontSize: 30.0,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    this.backgroundColor = Colors.blueAccent,
    this.loadingBarMaxWidth = 180.0,
    this.loadingBarHeight = 4.0,
    this.loadingBarColor = Colors.white70,
    this.nameLoadingBarSpacing = 12.0,
    this.cursorSymbol = '_', // Customizable cursor
    this.cursorBlinkDuration = const Duration(milliseconds: 500), // Cursor blink rate
    this.typingSpeedPerChar = const Duration(milliseconds: 80), // Adjust typing speed
  });

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<int> _typingAnimation; // Animation for character index
  late Animation<double> _nameFadeAnimation; // Now only for fade-out
  late Animation<double> _loadingBarAnimation;
  late Animation<double> _loadingBarFadeAnimation;
  late Animation<double> _circleRevealAnimation;

  Timer? _cursorTimer;
  bool _showCursor = true;
  late Duration _typingDuration; // Calculated duration for typing phase

  @override
  void initState() {
    super.initState();

    // Calculate total typing duration based on name length and speed
    _typingDuration = widget.typingSpeedPerChar * widget.name.length;

    // Ensure total duration is sufficient, adjust if typing takes longer
    final totalDuration = widget.duration > _typingDuration + const Duration(milliseconds: 2500) // Ensure time for load, fade, reveal
        ? widget.duration
        : _typingDuration + const Duration(milliseconds: 2500); // Add buffer

    _controller = AnimationController(
      vsync: this,
      duration: totalDuration, // Use potentially adjusted duration
    );

    // --- Calculate Animation Intervals based on actual timings ---
    final double typingEndFraction = (_typingDuration.inMilliseconds / totalDuration.inMilliseconds).clamp(0.0, 1.0);
    // Example: Load bar starts slightly after typing, fades with name
    final double loadStartFraction = (typingEndFraction + 0.05).clamp(0.0, 1.0); // Start load 5% after typing ends
    final double fadeStartFraction = (loadStartFraction + 0.4).clamp(0.0, 0.85); // Start fade ~40% later (ensure < reveal)
    final double fadeEndFraction = (fadeStartFraction + 0.15).clamp(0.0, 0.9); // Fade duration 15%
    final double revealStartFraction = (fadeEndFraction - 0.05).clamp(0.0, 1.0); // Reveal starts slightly before fade ends

    // --- Typing Animation (Character Index) ---
    _typingAnimation = IntTween(begin: 0, end: widget.name.length).animate(
      CurvedAnimation(
        parent: _controller,
        // Animate index from 0.0 up to typingEndFraction
        curve: Interval(0.0, typingEndFraction, curve: Curves.linear),
      ),
    );

    // --- Name Fade Animation (Now only for Fade Out) ---
    _nameFadeAnimation = TweenSequence<double>([
      // Stay visible until fade starts
      TweenSequenceItem(tween: ConstantTween(1.0), weight: fadeStartFraction * 100),
      // Fade Out
      TweenSequenceItem(
          tween: Tween(begin: 1.0, end: 0.0).chain(CurveTween(curve: Curves.easeOut)),
          weight: (fadeEndFraction - fadeStartFraction) * 100),
      // Stay Hidden
      TweenSequenceItem(tween: ConstantTween(0.0), weight: (1.0 - fadeEndFraction) * 100),
    ]).animate(_controller);


    // --- Loading Bar Width Animation ---
    _loadingBarAnimation = Tween<double>(begin: 0.0, end: 1.0)
        .chain(CurveTween(curve: Curves.linear))
        .animate(CurvedAnimation(
      parent: _controller,
      // Fill bar between load start and fade start
      curve: Interval(loadStartFraction, fadeStartFraction, curve: Easing.standard),
    ));

    // --- Loading Bar Fade Animation ---
    _loadingBarFadeAnimation = TweenSequence<double>([
      TweenSequenceItem(tween: ConstantTween(1.0), weight: fadeStartFraction * 100), // Visible until fade start
      TweenSequenceItem(
          tween: Tween(begin: 1.0, end: 0.0).chain(CurveTween(curve: Curves.easeOut)),
          weight: (fadeEndFraction - fadeStartFraction) * 100), // Fade out with name
      TweenSequenceItem(tween: ConstantTween(0.0), weight: (1.0 - fadeEndFraction) * 100), // Hidden
    ]).animate(_controller);


    // --- Circle Reveal ---
    _circleRevealAnimation = Tween<double>(begin: 0.0, end: 1.0)
        .chain(CurveTween(curve: Curves.easeIn))
        .animate(CurvedAnimation(
      parent: _controller,
      curve: Interval(revealStartFraction, 1.0), // Reveal starts near end of fade
    ));

    // --- Cursor Timer ---
    _cursorTimer = Timer.periodic(widget.cursorBlinkDuration, (_) {
      // Only blink if controller is running and typing is not yet complete
      if (_controller.isAnimating && _typingAnimation.value < widget.name.length) {
         if (mounted) { // Check if widget is still in the tree
           setState(() { _showCursor = !_showCursor; });
         }
      } else if (_showCursor) {
         // Ensure cursor is hidden once typing is done or animation stops
         if (mounted) {
            setState(() { _showCursor = false; });
         }
      }
    });

    _controller.forward();
  }

  @override
  void dispose() {
    _cursorTimer?.cancel(); // Cancel the timer!
    _controller.dispose();
    super.dispose();
  }

  double _maxRadius(Size size) {
    final screenDiagonal =
        sqrt(size.width * size.width + size.height * size.height);
    return screenDiagonal / 2.0;
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final maxRadiusValue = _maxRadius(screenSize);

    return Stack(
      children: [
        widget.child,
        AnimatedBuilder(
          animation: _controller, // Listens to all animations driven by controller
          builder: (context, _) {
            if (_controller.status == AnimationStatus.completed) {
              return const SizedBox.shrink();
            }

            // --- Calculate current values ---
            final currentRadius = _circleRevealAnimation.value * maxRadiusValue;
            final currentLoadingBarWidth = _loadingBarAnimation.value * widget.loadingBarMaxWidth;
            final currentTypedIndex = _typingAnimation.value;
            final isTypingComplete = currentTypedIndex >= widget.name.length;

            // Determine displayed text based on typing animation
            final displayedName = widget.name.substring(0, currentTypedIndex);

            // Determine cursor visibility (show only while typing and based on timer)
            final bool shouldShowActualCursor = _showCursor && !isTypingComplete;
            final String cursor = shouldShowActualCursor ? widget.cursorSymbol : "";

            // Construct the text to show in the Text widget
            final String textToShow = displayedName + cursor;

            return ClipPath(
              clipper: CircleRevealClipper(
                radius: currentRadius,
                center: Offset(screenSize.width / 2, screenSize.height / 2),
              ),
              child: Container(
                width: double.infinity,
                height: double.infinity,
                color: widget.backgroundColor,
                alignment: Alignment.center,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Name: Now shows typing effect, still fades out via _nameFadeAnimation
                    FadeTransition(
                      opacity: _nameFadeAnimation, // Handles the fade OUT
                      child: Text(
                        textToShow, // Shows typing + cursor
                        style: widget.nameStyle,
                        textAlign: TextAlign.center, // Center align if name wraps
                      ),
                    ),
                    SizedBox(height: widget.nameLoadingBarSpacing),
                    // Loading Bar: Fades out via _loadingBarFadeAnimation
                    FadeTransition(
                      opacity: _loadingBarFadeAnimation,
                      child: Container(
                        height: widget.loadingBarHeight,
                        width: currentLoadingBarWidth,
                        decoration: BoxDecoration(
                           color: widget.loadingBarColor,
                           borderRadius: BorderRadius.circular(widget.loadingBarHeight / 2)
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}

// Custom Clipper (Unchanged)
class CircleRevealClipper extends CustomClipper<Path> {
 // ... (clipper code remains the same) ...
  final double radius;
  final Offset center;

  const CircleRevealClipper({required this.radius, required this.center});

  @override
  Path getClip(Size size) {
     return Path()
      ..addOval(Rect.fromCircle(center: center, radius: radius))
      ..addRect(Rect.fromLTWH(0.0, 0.0, size.width, size.height))
      ..fillType = PathFillType.evenOdd;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return oldClipper is CircleRevealClipper && oldClipper.radius != radius;
  }
}