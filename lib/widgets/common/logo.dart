import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/utils/extensions/extensions.dart';
import 'package:portfolio/data/configs/configs.dart';

class Logo extends StatelessWidget {
  const Logo({
    super.key,
    required this.onTap,
  });
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    double size = context.adaptive<double>(
      s20,
      s80,
      md: s60,
    );
    return GestureDetector(
      onTap: onTap,
      child: SvgPicture.asset(
        kaLogo,
        semanticsLabel: 'Logo SVG',
        width: size,
        height: size,
      ).addPadding(edgeInsets: context.padding(l: s10)),
    );
  }
}
