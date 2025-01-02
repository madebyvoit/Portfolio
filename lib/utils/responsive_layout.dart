import 'package:flutter/material.dart';
import 'package:layout/layout.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobileBody;
  final Widget tabletBody;
  final Widget dekstopBody;

  const ResponsiveLayout({
    super.key,
    required this.mobileBody,
    required this.tabletBody,
    required this.dekstopBody,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          return mobileBody;
        } else if (constraints.maxWidth < 1100) {
          return tabletBody;
        } else {
          return dekstopBody;
        }
      },
    );
  }
}

double widthOfScreen(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double heightOfScreen(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

double assignHeight(
  BuildContext context,
  double fraction, {
  double additions = 0,
  double subs = 0,
}) {
  return (heightOfScreen(context) - (subs) + (additions)) * fraction;
}

//
double assignWidth(
  BuildContext context,
  double fraction, {
  double additions = 0,
  double subs = 0,
}) {
  return (widthOfScreen(context) - (subs) + (additions)) * fraction;
}

double responsiveSize(
  BuildContext context,
  double xs,
  double lg, {
  double? sm,
  double? md,
  double? xl,
}) {
  return context.layout.value(
    xs: xs,
    sm: sm ?? (md ?? xs), //assign md to sm if it is not null, if null assign xs
    md: md ?? lg,
    lg: lg,
    xl: xl ?? lg,
  );
}

int responsiveSizeInt(
  BuildContext context,
  int xs,
  int lg, {
  int? sm,
  int? md,
  int? xl,
}) {
  return context.layout.value(
    xs: xs,
    sm: sm ?? (md ?? xs), //assign md to sm if it is not null, if null assign xs
    md: md ?? lg,
    lg: lg,
    xl: xl ?? lg,
  );
}
