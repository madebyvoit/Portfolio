import 'package:flutter/material.dart';

class OnHoverScale extends StatefulWidget {
  final Widget child;

  const OnHoverScale({Key? key, required this.child}) : super(key: key);

  @override
  _OnHoverScaleState createState() => _OnHoverScaleState();
}

class _OnHoverScaleState extends State<OnHoverScale> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final hoveredTransform = Matrix4.identity()..scale(1.1);
    final transform = isHovered ? hoveredTransform : Matrix4.identity();
    return MouseRegion(
      onEnter: (event) => onEntered(true),
      onExit: (event) => onEntered(false),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        transform: transform,
        child: widget.child,
      ),
    );
  }

  void onEntered(bool isHovered) => setState(() {
        this.isHovered = isHovered;
      });
}
