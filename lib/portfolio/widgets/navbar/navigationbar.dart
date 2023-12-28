import 'package:flutter/material.dart';
import 'package:portfolio/constants/colors.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);

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
          const Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              _NavbarItem('about'),
              SizedBox(
                width: 60,
              ),
              _NavbarItem('services'),
              SizedBox(
                width: 60,
              ),
              _NavbarItem('blog'),
              SizedBox(
                width: 60,
              ),
              _NavbarItem('Let\u0027s talk'),
              SizedBox(
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
  const _NavbarItem(this.title);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(fontSize: 18, color: Pallete.aliceblue),
    );
  }
}
