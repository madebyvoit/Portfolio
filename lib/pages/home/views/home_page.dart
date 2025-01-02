import 'package:flutter/material.dart';
import 'package:portfolio/data/configs/configs.dart';
import 'package:portfolio/pages/home/widgets/loading_page.dart';
import 'package:portfolio/utils/extensions/extensions.dart';
import 'package:portfolio/pages/wrapper.dart';
import 'package:portfolio/widgets/widgets.dart';

import '../widgets/introduction_page.dart';
import '../widgets/showcase_projects_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final _scrollController = ScrollController();
  List<Widget> mainPages = [];
  final _key = GlobalKey();
  bool _isDrawerOpen = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    mainPages = [
      IntroductionPage(
        onTapSeeMyWorks: _onTapSeeMyWorks,
      ),
      const ShowcaseProjectsPage(),
      const FooterPage(),
    ];
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void onMenuTapped() {
    setState(() {
      _isDrawerOpen = !_isDrawerOpen;
    });
  }

  void _onTapSeeMyWorks() {
    _scrollController.animateTo(
      context.screenHeight,
      duration: duration500,
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Wrapper(
          page: mainPages.addListView(
            key: _key,
            controller: _scrollController,
            physics: const ClampingScrollPhysics(),
            scrollDirection: Axis.vertical,
          ),
        ),
        LoadingHomePageAnimation(
          text: 'Pascal Dohle',
          style: Styles.mavenPro(
            color: AppColors.loadingLineColor,
            fontWeight: FontWeight.bold,
            fontSize: 50,
          ),
          onLoadingDone: () {},
        ),
      ],
    );
  }
}
