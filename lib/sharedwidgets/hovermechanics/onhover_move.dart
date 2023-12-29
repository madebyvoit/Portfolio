import 'package:flutter/material.dart';

class OnHoverMove extends StatefulWidget {
  final Widget child;

  const OnHoverMove({super.key, required this.child});

  @override
  State<OnHoverMove> createState() => _OnHoverMoveState();
}

class _OnHoverMoveState extends State<OnHoverMove> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final hoveredTransform = Matrix4.identity()..translate(0, -8, 0);
    final transform = isHovered ? hoveredTransform : Matrix4.identity();
    return MouseRegion(
      onEnter: (event) => onEntered(true),
      onExit: (event) => onEntered(false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: transform,
        child: widget.child,
      ),
    );
  }

  void onEntered(bool isHovered) => setState(() {
        this.isHovered = isHovered;
      });
}
