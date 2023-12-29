import 'package:flutter/material.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/portfolio/pages/aboutme/aboutme.dart';
import 'package:portfolio/portfolio/widgets/herosection.dart';
import 'package:portfolio/portfolio/widgets/letstalksection.dart';
import 'package:portfolio/portfolio/widgets/navigationbar.dart';
import 'package:portfolio/portfolio/widgets/servicessections.dart';
import 'package:portfolio/portfolio/widgets/sozials_buttons.dart';
import 'package:portfolio/sharedwidgets/centeredview.dart';

class DesktopHomePage extends StatefulWidget {
  const DesktopHomePage({super.key});

  @override
  State<DesktopHomePage> createState() => _DesktopHomePage();
}

class _DesktopHomePage extends State<DesktopHomePage> {
  @override
  Widget build(BuildContext context) {
    var key0 = GlobalKey();
    var key1 = GlobalKey();
    var key2 = GlobalKey();
    var key3 = GlobalKey();

    return Scaffold(
        backgroundColor: Pallete.darkgrey,
        body: LayoutBuilder(
          builder: (context, constraints) {
            return Stack(
              children: <Widget>[
                SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      // Hero Sections
                      Container(
                        key: key0,
                        color: Pallete.darkgrey,
                        height: MediaQuery.of(context).size.height,
                        child: HeroSection(),
                      ),
                      //AboutSection
                      Container(
                        key: key1,
                        color: Pallete.darkgrey,
                        height: MediaQuery.of(context).size.height,
                        child: AboutMe(),
                      ),
                      //ServiceSection
                      Container(
                        key: key2,
                        color: Pallete.darkgrey,
                        height: MediaQuery.of(context).size.height,
                        child: Services(),
                      ),
                      //Let's Talk Section
                      Container(
                        key: key3,
                        color: Pallete.darkgrey,
                        height: MediaQuery.of(context).size.height,
                        child: LetsTalk(),
                      ),
                    ],
                  ),
                ),
                CenteredView(
                    child: NavBar(
                  key0: key0,
                  key1: key1,
                  key2: key2,
                  key3: key3,
                )),
                BuildSozialButtons(),
              ],
            );
          },
        ));
  }
}
