import 'package:flutter/material.dart';

class OnHoverText extends StatefulWidget {
  final Widget Function(bool isHovered) builder;

  const OnHoverText({super.key, required this.builder});

  @override
  State<OnHoverText> createState() => _OnHoverTextState();
}

class _OnHoverTextState extends State<OnHoverText> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final hoveredTransform = Matrix4.identity()
      ..translate(2, -4, 0)
      ..scale(1.1);
    final transform = isHovered ? hoveredTransform : Matrix4.identity();
    return MouseRegion(
      onEnter: (event) => onEntered(true),
      onExit: (event) => onEntered(false),
      child: AnimatedContainer(
        curve: Curves.decelerate,
        duration: const Duration(milliseconds: 200),
        transform: transform,
        child: widget.builder(isHovered),
      ),
    );
  }

  void onEntered(bool isHovered) => setState(() {
        this.isHovered = isHovered;
      });
}
