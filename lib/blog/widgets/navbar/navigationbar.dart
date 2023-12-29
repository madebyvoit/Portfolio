import 'package:flutter/material.dart';
import 'package:portfolio/portfolio/pages/homepage/desktop_homepage.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/constants/text_styles.dart';

class BlogNavBar extends StatelessWidget {
  final GlobalKey key1;
  final GlobalKey key2;
  final GlobalKey key3;
  const BlogNavBar(
      {super.key, required this.key1, required this.key2, required this.key3});

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
            child: Image.asset('assets/logo.png'),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              _NavbarItem('about', key1, true),
              const SizedBox(
                width: 60,
              ),
              _NavbarItem('services', key1, true),
              const SizedBox(
                width: 60,
              ),
              _NavbarItem('Portfolio', key1, false),
              const SizedBox(
                width: 60,
              ),
              _NavbarItem('Latest Post', key3, true),
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

class _NavbarItem extends StatelessWidget {
  final String title;
  final GlobalKey sectionskey;
  final bool hasKey;
  const _NavbarItem(this.title, this.sectionskey, this.hasKey);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        color: Colors.transparent,
        hoverColor: Pallete.aliceblue,
        onPressed: () {
          if(hasKey == true)
          {
            Scrollable.ensureVisible(sectionskey.currentContext!,
                                      curve: Curves.decelerate,
                                      duration: Durations.medium1);
          }else
          {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => const DesktopHomePage()));
          }
        },
        child: Text(
          title,
          style: CustomStyle.navbar,
        ));
  }
}

//     Navigator.of(context).push(MaterialPageRoute(builder: (context) => BlogDesktopHomePage()));