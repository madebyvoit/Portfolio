import 'package:flutter/material.dart';
import 'package:portfolio/shared/utilities/layout/responsive_layout.dart';
import 'package:portfolio/views/message_me/responsive/desktop_mesage_me.dart';
import 'package:portfolio/views/message_me/responsive/mobile_mesage_me.dart';
import 'package:portfolio/views/message_me/responsive/tablet_mesage_me.dart';

class MessageMe extends StatelessWidget {
  final int pageIndex = 3;
  const MessageMe({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileScaffold: MobileMesageMe(
        pageIndex: pageIndex,
      ),
      tabletScaffold: TabletMesageMe(),
      desktopScaffold: DesktopMesageMe(),
    );
  }
}
