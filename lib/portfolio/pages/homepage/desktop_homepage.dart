import 'package:flutter/material.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/constants/text_styles.dart';
import 'package:portfolio/portfolio/widgets/navigationbar.dart';
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
                      //
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        key: key0,
                        children: <Widget>[
                          SizedBox(
                            width: 80,
                            height: 80,
                          ),
                          Row(
                            children: <Widget>[
                              Container(
                                alignment: Alignment.center,
                                height: 700,
                                width: 850,
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 200,
                                    ),
                                    Container(
                                      height: 400,
                                      width: 850,
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: 150,
                                          ),
                                          Column(children: [
                                            Align(
                                              alignment: Alignment.centerLeft,
                                              child: Container(
                                                child: Text(
                                                    "HEY I'M PASCAL DOHLE",
                                                    style: CustomStyle
                                                        .heroHeading),
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                  "THE GAMEDESIGNER AND DEVELOPER BEHIND VOITNOTES",
                                                  style: CustomStyle.herotext),
                                            ),
                                            Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                  "Creating Games feels like magic, because you can create your own world from nearly" +
                                                      '\n\n' +
                                                      "nothing and the only thing holding you back is your owen imaginations",
                                                  style:
                                                      CustomStyle.herospeech),
                                            ),
                                          ])
                                        ],
                                      ),
                                    ),
                                    Container(),
                                  ],
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                width: 400,
                                child: Image.asset(
                                    'assets/images/portfolio/sketchofme.png'),
                              ),
                              SizedBox(
                                width: 50,
                                height: 80,
                              ),
                            ],
                          )
                        ],
                      ),
                      //
                      Container(
                        key: key1,
                        color: Pallete.darkgrey,
                        height: MediaQuery.of(context).size.height,
                        child: Center(
                            child: ElevatedButton(
                                onPressed: () {
                                  Scrollable.ensureVisible(key1.currentContext!,
                                      curve: Curves.decelerate,
                                      duration: Durations.medium1);
                                },
                                child: Text('Scroll Down'))),
                      ),
                      //
                      Container(
                        key: key2,
                        color: Pallete.darkgrey,
                        height: MediaQuery.of(context).size.height,
                        child: Center(
                            child: ElevatedButton(
                                onPressed: () {
                                  Scrollable.ensureVisible(key2.currentContext!,
                                      curve: Curves.decelerate,
                                      duration: Durations.medium1);
                                },
                                child: Text('Scroll Down'))),
                      ),
                      //
                      Container(
                        key: key3,
                        color: Pallete.darkgrey,
                        height: MediaQuery.of(context).size.height,
                        child: Center(
                            child: ElevatedButton(
                                onPressed: () {
                                  Scrollable.ensureVisible(key2.currentContext!,
                                      curve: Curves.decelerate,
                                      duration: Durations.medium1);
                                },
                                child: Text('Scroll Down'))),
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
