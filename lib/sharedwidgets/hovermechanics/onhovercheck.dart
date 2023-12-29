import 'package:flutter/material.dart';

class OnHoverCheck extends StatefulWidget {
  final Widget Function(bool isHovered) builder;

  const OnHoverCheck({super.key, required this.builder});

  @override
  State<OnHoverCheck> createState() => _OnHoverCheckState();
}

class _OnHoverCheckState extends State<OnHoverCheck> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) => onEntered(true),
      onExit: (event) => onEntered(false),
      child: widget.builder (isHovered),
    );
  }

  void onEntered(bool isHovered) => setState(() {
        this.isHovered = isHovered;
      });
}
