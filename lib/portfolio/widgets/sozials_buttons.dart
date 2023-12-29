import 'package:flutter/material.dart';
import 'package:portfolio/constants/strings.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/constants/text_styles.dart';

class BuildSozialButtons extends StatelessWidget {
  const BuildSozialButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildSocialButtons();
  }
}

Widget _buildSocialButtons({
  int quarterTurns = 3,
  Axis axis = Axis.vertical,
  alignment = Alignment.centerRight,
}) {
  return Align(
    alignment: alignment,
    child: Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      direction: axis,
      children: <Widget>[
        _buildMenuItem(
            quarterTurns, Strings.menuLinkedinLink, Strings.menuLinkedin),
        _buildMenuItem(
            quarterTurns, Strings.menuArtstationLink, Strings.menuArtstation),
        _buildMenuItem(
            quarterTurns, Strings.menuGithubLink, Strings.menuGithub),
        _buildMenuItem(
            quarterTurns, Strings.menuDiscordLink, Strings.menuDiscord),
        _buildMenuItem(quarterTurns, Strings.menuMailLink, Strings.menuMail),
        SizedBox(
          width: 55,
        ),
      ],
    ),
  );
}

Widget _buildMenuItem(int quarterTurns, String link, String title) {
  return RotatedBox(
    quarterTurns: quarterTurns,
    child: MaterialButton(
      hoverColor: Pallete.babyblue,
      onPressed: () {
        _launchURL(link);
      },
      child: Text(
        title,
        style: CustomStyle.sozialmenu,
      ),
    ),
  );
}

_launchURL(String link) async {
  String atSign = '@';
  if (link.contains(atSign)) {
    final Uri params = Uri(scheme: 'mailto', path: link);
    var url = params.toString();
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  } else {
    if (await canLaunchUrl(Uri.parse(link))) {
      await launchUrl(Uri.parse(link));
    } else {
      throw 'Could not launch $link';
    }
  }
}
