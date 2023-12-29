import 'package:flutter/material.dart';

class OnHoverCheck extends StatefulWidget {
  final Widget Function(bool isHovered) builder;

  const OnHoverCheck({Key? key, required this.builder}) : super(key: key);

  @override
  _OnHoverCheckState createState() => _OnHoverCheckState();
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
