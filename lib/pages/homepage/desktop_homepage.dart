import 'package:flutter/material.dart';
import 'package:portfolio/constants/values/values.dart';
import 'package:portfolio/widgets/home/loading_page.dart';

class DesktopHomepage extends StatefulWidget {
  const DesktopHomepage({super.key});

  @override
  State<DesktopHomepage> createState() => _DesktopHomepageState();
}

class _DesktopHomepageState extends State<DesktopHomepage> {
  @override
  Widget build(BuildContext context) {
    return LoadingHomePageAnimation(
      text: "Pascal Dohle",
      style: Styles.customTextStyle(),
      onLoadingDone: () {},
    );
  }
}
