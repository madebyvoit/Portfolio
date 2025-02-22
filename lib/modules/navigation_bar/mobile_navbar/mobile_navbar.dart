import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MobileNavbar extends StatelessWidget {
  final int pageIndex;
  const MobileNavbar({super.key, required this.pageIndex});

  @override
  Widget build(BuildContext context) {
    // replace the strings later with  variables from library
    final List<String> pages = [
      '/',
      '/projects',
      '/aboutme',
      '/messageme',
    ];

    void navigateBottomBar(int index) {
      context.go(pages[index]);
    }

    return BottomNavigationBar(
      iconSize: 40,
      showSelectedLabels: true,
      showUnselectedLabels: false,
      backgroundColor: Colors.transparent,
      selectedItemColor: Theme.of(context).colorScheme.secondary,
      unselectedItemColor: Theme.of(context).colorScheme.primary,
      elevation: 0,
      currentIndex: pageIndex,
      onTap: navigateBottomBar,
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.bookmark_add_rounded),
          label: 'Projects',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'About Me',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.chat),
          label: 'Message Me',
        ),
      ],
    );
  }
}
