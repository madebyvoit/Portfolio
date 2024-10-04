import 'package:flutter/material.dart';
import 'package:portfolio/constants/values/values.dart';
import 'package:portfolio/widgets/home/loading_page.dart';

class TabletHomepage extends StatefulWidget {
  const TabletHomepage({super.key});

  @override
  State<TabletHomepage> createState() => _TabletHomepageState();
}

class _TabletHomepageState extends State<TabletHomepage> {
  @override
  Widget build(BuildContext context) {
    return LoadingHomePageAnimation(
      text: "Pascal Dohle",
      style: Styles.customTextStyle(),
      onLoadingDone: () {},
    );
  }
}
