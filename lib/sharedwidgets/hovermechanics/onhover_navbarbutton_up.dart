import 'package:flutter/material.dart';

class NavbarButtonUp extends StatefulWidget {
  final Widget Function(bool isHovered) builder;

  const NavbarButtonUp({Key? key, required this.builder}) : super(key: key);

  @override
  _NavbarButtonUpState createState() => _NavbarButtonUpState();
}

class _NavbarButtonUpState extends State<NavbarButtonUp> {
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
        duration: Duration(milliseconds: 200),
        transform: transform,
        child: widget.builder(isHovered),
      ),
    );
  }

  void onEntered(bool isHovered) => setState(() {
        this.isHovered = isHovered;
      });
}
