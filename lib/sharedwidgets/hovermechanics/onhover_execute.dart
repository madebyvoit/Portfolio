import 'package:flutter/material.dart';

class HoverExecute extends StatefulWidget {
  final bool hovered;
  final Widget child;

  const HoverExecute({Key? key, required this.hovered, required this.child})
      : super(key: key);

  @override
  _HoverExecuteState createState() => _HoverExecuteState();
}

class _HoverExecuteState extends State<HoverExecute> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    isHovered = widget.hovered;
    final hoveredTransform = Matrix4.identity()
      ..scale(1.15)
      ..translate(1, -6, 0);
    final transform = isHovered ? hoveredTransform : Matrix4.identity();
    return MouseRegion(
      onEnter: (event) => onEntered(true),
      onExit: (event) => onEntered(false),
      child: AnimatedContainer(
        curve: Curves.decelerate,
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
