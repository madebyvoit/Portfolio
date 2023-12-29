import 'package:flutter/material.dart';
import 'package:portfolio/blog/widgets/navbar/navigationbar.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/sharedwidgets/centeredview.dart';

class BlogDesktopHomePage extends StatefulWidget {
  const BlogDesktopHomePage({super.key});

  @override
  State<BlogDesktopHomePage> createState() => _BlogDesktopHomePage();
}

class _BlogDesktopHomePage extends State<BlogDesktopHomePage> {
  @override
  Widget build(BuildContext context) {
    var key4 = GlobalKey();
    var key5 = GlobalKey();
    var key6 = GlobalKey();

    return Scaffold(
        backgroundColor: Pallete.darkgrey,
        body: LayoutBuilder(
          builder: (context, constraints) {
            return Stack(
              children: <Widget>[
                SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      //
                      Container(
                        key: key4,
                        color: Colors.green,
                        height:
                            MediaQuery.of(context).size.height - kToolbarHeight,
                        child: Center(
                            child: ElevatedButton(
                                onPressed: () {
                                  Scrollable.ensureVisible(key5.currentContext!,
                                      curve: Curves.decelerate,
                                      duration: Durations.medium1);
                                },
                                child: Text('blogpage Down'))),
                      ),
                      //
                      Container(
                        key: key5,
                        color: Colors.red,
                        height:
                            MediaQuery.of(context).size.height - kToolbarHeight,
                        child: Center(
                            child: ElevatedButton(
                                onPressed: () {
                                  Scrollable.ensureVisible(key5.currentContext!,
                                      curve: Curves.decelerate,
                                      duration: Durations.medium1);
                                },
                                child: Text('Scroll Down'))),
                      ), 
                      //
                      Container(
                        key: key6,
                        color: Colors.red,
                        height:
                            MediaQuery.of(context).size.height - kToolbarHeight,
                        child: Center(
                            child: ElevatedButton(
                                onPressed: () {
                                  Scrollable.ensureVisible(key4.currentContext!,
                                      curve: Curves.decelerate,
                                      duration: Durations.medium1);
                                },
                                child: Text('Scroll Down'))),
                      )
                    ],
                  ),
                ),
                CenteredView(child: BlogNavBar(key1: key4, key2: key5, key3: key6,)),
              ],
            );
          },
        ));
  }
}
