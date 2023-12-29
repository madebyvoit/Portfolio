import 'package:flutter/material.dart';
import 'package:portfolio/blog/pages/homepage/blog_desktop_homepage.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/constants/text_styles.dart';
import 'package:portfolio/sharedwidgets/navbar_buttons.dart';

class NavBar extends StatelessWidget {
  final GlobalKey key0;
  final GlobalKey key1;
  final GlobalKey key2;
  final GlobalKey key3;
  const NavBar(
      {super.key,
      required this.key0,
      required this.key1,
      required this.key2,
      required this.key3});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          SizedBox(
              height: 60,
              width: 100,
              child: _InvisibleButton(
                  Image.asset('assets/images/portfolio/logo.png'), key0)),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              NavbarButtons(
                  title: 'about',
                  normalStyle: CustomStyle.navbar,
                  hoverStyle: CustomStyle.navbarhover,
                  normalColor: Pallete.aliceblue,
                  hoverColor: Pallete.babyblue,
                  fillColor: Colors.transparent,
                  width: 100,
                  height: 42,
                  cmd: () {
                    Scrollable.ensureVisible(key1.currentContext!,
                        curve: Curves.decelerate, duration: Durations.long1);
                  }),
              const SizedBox(
                width: 50,
              ),
              NavbarButtons(
                  title: 'services',
                  normalStyle: CustomStyle.navbar,
                  hoverStyle: CustomStyle.navbarhover,
                  normalColor: Pallete.aliceblue,
                  hoverColor: Pallete.babyblue,
                  fillColor: Colors.transparent,
                  width: 130,
                  height: 42,
                  cmd: () {
                    Scrollable.ensureVisible(key2.currentContext!,
                        curve: Curves.decelerate, duration: Durations.long1);
                  }),
              const SizedBox(
                width: 50,
              ),
              NavbarButtons(
                  title: 'blog',
                  normalStyle: CustomStyle.navbar,
                  hoverStyle: CustomStyle.navbarhover,
                  normalColor: Pallete.aliceblue,
                  hoverColor: Pallete.babyblue,
                  fillColor: Colors.transparent,
                  width: 95,
                  height: 42,
                  cmd: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const BlogDesktopHomePage()));
                  }),
              const SizedBox(
                width: 50,
              ),
              NavbarButtons(
                  title: 'Let\'s Talk',
                  normalStyle: CustomStyle.navbar,
                  hoverStyle: CustomStyle.bignavbar,
                  normalColor: Pallete.babyblue,
                  hoverColor: Pallete.aliceblue,
                  fillColor: Pallete.babyblue,
                  width: 145,
                  height: 42,
                  cmd: () {
                    Scrollable.ensureVisible(key3.currentContext!,
                        curve: Curves.decelerate, duration: Durations.long1);
                  }),
              const SizedBox(
                width: 60,
              ),
            ],
          )
        ],
      ),
    );
  }
}

//Invisible Button over Logo
class _InvisibleButton extends StatelessWidget {
  final Widget child;
  final GlobalKey sectionkey;
  const _InvisibleButton(this.child, this.sectionkey);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        Scrollable.ensureVisible(sectionkey.currentContext!,
            curve: Curves.decelerate, duration: Durations.medium1);
      },
      child: child,
    );
  }
}
