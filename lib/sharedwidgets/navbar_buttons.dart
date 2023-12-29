import 'package:flutter/material.dart';
import 'package:portfolio/sharedwidgets/hovermechanics/onhover_execute.dart';
import 'package:portfolio/sharedwidgets/hovermechanics/onhovercheck.dart';

class NavbarButtons extends StatelessWidget {
  final String title;
  final TextStyle normalStyle;
  final TextStyle hoverStyle;
  final Color normalColor;
  final Color hoverColor;
  final Color fillColor;
  final double width;
  final double height;
  final Function cmd;
  const NavbarButtons(
      {Key? key,
      required this.title,
      required this.normalStyle,
      required this.hoverStyle,
      required this.normalColor,
      required this.hoverColor,
      required this.fillColor,
      required this.width,
      required this.height,
      required this.cmd})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OnHoverCheck(builder: (isHovered) {
      return Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              border: Border.all(
                  color: isHovered ? hoverColor : normalColor, width: 4),
              borderRadius: BorderRadius.circular(22),
              color: isHovered ? hoverColor : fillColor,
            ),
          ),
          HoverExecute(
              hovered: isHovered,
              child: MaterialButton(
                elevation: 0,
                splashColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(22.0)),
                color: isHovered ? normalColor : fillColor,
                onPressed: () {
                  this.cmd();
                },
                child: Text(
                  title,
                  style: isHovered ? hoverStyle : normalStyle,
                ),
              ))
        ],
      );
    });
  }
}
