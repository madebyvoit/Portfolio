import 'package:flutter/material.dart';
import 'package:portfolio/constants/values/values.dart';
import 'package:portfolio/widgets/home/loading_page.dart';

class MobileHomepage extends StatefulWidget {
  const MobileHomepage({super.key});

  @override
  State<MobileHomepage> createState() => _MobileHomepageState();
}

class _MobileHomepageState extends State<MobileHomepage> {
  @override
  Widget build(BuildContext context) {
    return LoadingHomePageAnimation(
      text: "Pascal Dohle",
      style: Styles.customTextStyle(),
      onLoadingDone: () {},
    );
  }
}
